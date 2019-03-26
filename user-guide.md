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
