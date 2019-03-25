TAG=$(shell cat chart/falco-mp/Chart.yaml | grep version: | sed 's/.*: //g')
APP_DEPLOYER_IMAGE=$(REGISTRY)/falco/deployer:$(TAG)

MINOR_TAG=$(shell echo $(TAG) | cut -d. -f1-2)
APP_DEPLOYER_IMAGE_MINOR=$(REGISTRY)/falco/deployer:$(MINOR_TAG)

FALCO_TAG=0.13.0

include ./app.Makefile
include ./crd.Makefile
include ./gcloud.Makefile

$(info ---- TAG = $(TAG))
$(info ---- MINOR_TAG = $(MINOR_TAG))
$(info ---- FALCO_TAG = $(FALCO_TAG))

APP_NAME ?= falco-testrun

APP_PARAMETERS ?= { \
	"name": "$(APP_NAME)", \
	"namespace": "$(NAMESPACE)", \
	"image": "docker.io/falcosecurity/falco:$(FALCO_TAG)" \
}

app/build:: .build/falco \
			.build/falco/deployer  \
			.build/falco/falco

.build/falco: | .build
	mkdir -p "$@"

.build/falco/deployer:	schema.yaml \
						deployer/* \
						chart/falco-mp/* \
						chart/falco-mp/charts/falco-$(TAG).tgz \
						chart/falco-mp/templates/* \
						.build/var/REGISTRY
	docker build \
		--build-arg REGISTRY=$(REGISTRY) \
		--build-arg TAG=$(TAG) \
		--build-arg MARKETPLACE_TOOLS_TAG="$(MARKETPLACE_TOOLS_TAG)" \
		--tag "$(APP_DEPLOYER_IMAGE)" \
		-f deployer/Dockerfile \
		.
	docker tag "$(APP_DEPLOYER_IMAGE)" "$(APP_DEPLOYER_IMAGE_MINOR)"
	docker push "$(APP_DEPLOYER_IMAGE)"
	docker push "$(APP_DEPLOYER_IMAGE_MINOR)"
	@touch "$@"

.build/falco/falco:	.build/var/REGISTRY \
					.build/var/TAG \
					| .build/falco
	docker pull docker.io/falcosecurity/falco:$(FALCO_TAG)
	docker tag docker.io/falcosecurity/falco:$(FALCO_TAG) \
	    "$(REGISTRY)/falco:$(TAG)"
	docker tag docker.io/falcosecurity/falco:$(FALCO_TAG) \
	    "$(REGISTRY)/falco:$(MINOR_TAG)"
	docker push "$(REGISTRY)/falco:$(TAG)"
	docker push "$(REGISTRY)/falco:$(MINOR_TAG)"
	@touch "$@"

chart/falco-mp/charts/falco-$(TAG).tgz:
	helm dependency build chart/falco-mp
