# falco-google-kubernetes-marketplace

This repository contains instructions and files necessary to run Falco via
Google's Hosted Marketplace.

If you would like to read setup instructions about how to install this from the
GCP marketplace, or on how to use the application once it's deployed, please
refer to the [user guide](user-guide.md).

## Getting started

### Setting up your cluster and environment

This guide assumes that you already has a GKE cluster up and running and you
can run `kubectl` commands for that cluster.

Do a one time setup for application CRD:

```shell
make crd/install
```

## Installing Falco

Build and install Falco onto your cluster:

```shell
make app/install
```

To delete the installation, run:

```shell
make app/uninstall
```

## Building the deployment container

Apps must supply a deployment container image ("deployer") which is used in
UI-based deployment. This image should extend from one of the base images
provided in the marketplace-k8s-app-tools repository.

The deployment container uses [Helm Chart for Falco](https://hub.helm.sh/charts/stable/falco)
but it downloads the dependency in build time, so that, you need
[Helm](https://helm.sh/) installed in the machine where the deployment container
is built.

Once you have the Helm dependency resolved, you can build and push the
deployment container just running:

```shell
make app/build
```
