# Falco on Google Kubernetes Engine User Guide

## Overview

Sysdig Platform it's the most powerful way to understand the data at the heart
of your applications. Starting with a unique data source, we've built a
platform that brings together many disparate operational requirements into a
single, more effective way of securing and monitoring your cloud-native
applications.

This marketplace application allows user to deploy Sysdig to you GKE instances,
with configuration options for the most common scenarios. Actually it is one of
the fastest way s to get started monitoring and securing your applications ran
in top of Kubernetes.

## Installation

The standard installation flow for Sysdig on GCP Marketplace is just to follow
the prompts and fill out the configuration options described below.

### Key Configuration Options

* **Name**: the name of your cluster deployment.
* **Namespace**: the namespace where the Sysdig Agent is going to be deployed.
* **Image**: the image of the Sysdig Agent. You can control its version from here.
* **Sysdig Access Key**: the key provided from Sysdig for monitoring your infrastructure.
* **eBPF support**: use eBPF instead of kernel module based architecture.

### Hardware Allocation

The default values for hardware requests are fairly low. Sysdig requests `100m`
CPU and 512MB of memory and is capped to `200m` of CPU and 1024MB of memory.

### Cluster Formation

Once you have deployed Sysdig on GKE, a DaemonSet is created. This means that
will be a Pod for each node in your cluster. This may take less than 5 minutes,
and you can check its status on the Sysdig Monitor application.
