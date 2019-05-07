# Falco on Google Kubernetes Engine User Guide

## Overview

Falco is an open source project for intrusion and abnormality detection for
Cloud Native platforms such as Kubernetes, Mesosphere, and Cloud Foundry.
Detect abnormal application behavior. Alert via Slack, Fluentd, NATS, and more.
Protect your platform by taking action through serverless (FaaS) frameworks,
or other automation.

This marketplace application allows user to deploy Falco to you GKE instances,
with configuration options for the most common scenarios. Actually it is one of
the fastest way s to get started to secure your Kubernetes platform and its
applications.

## Installation

The standard installation flow for Falco on GCP Marketplace is just to follow
the prompts and fill out the configuration options described below.

### Key Configuration Options

* **Name**: the name of your cluster deployment.
* **Namespace**: the namespace where the Sysdig Agent is going to be deployed.
* **Image**: the image of the Sysdig Agent. You can control its version from here.
* **eBPF support**: use eBPF instead of kernel module based architecture.

### Google Pub/Sub Integration configuration options

In addition to key configuration options, we also support several integrations
we built with Google ecosystem. One of them is the ability to send Falco
alerts directly to a Google Pub/Sub topic.

You will need to configure.

* **Enable Pub/Sub integration**: enable or disable the Google Pub/Sub integration.
* **Project ID**: the project identifier where Google Pub/Sub topic is deployed.
* **Topic**: the topic name which is going to receive Falco alerts.
* **Credentials**: the credentials required to send messages to the topic. It
  can be a base64 encoding string instead of messing with the JSON format.

### Google Cloud Security Command Center Integration configuration options

Like previous topic, we also built an integration to send and transform Falco
alerts to findings in the Google Cloud Security Command Center.

To enable this integration, you will need a [Sysdig Connector](https://github.com/draios/sysdig-gcscc-connector/)
instance deployed in an accesible place (it may be this cluster) and you will
need to configure:

* **Enable Google Cloud Security Control Center integration**: enable or disable
  the Google Cloud Security Control Center integration.
* **Webhook URL**: the url where the Sysdig Connector is listening.
* **Authentication Token**: the same authentication token you used to deploy
  the Sysdig Connector.
