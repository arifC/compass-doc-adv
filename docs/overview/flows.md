---
layout: default
title: Flows
nav_order: 4
parent: Overview
permalink: docs/overview/flows
---

# Flows

A flow is an intended interaction between the components of Compass.

## Application connection

Application connection consists of two phases: Application pairing and API registration. In the process of connecting new Application, two Management Plane's components are involved: Director and Connector.

### Application pairing phase

Application pairing phase is a process of creating new Application in Management Plane and establishing trusted connection between Application and Management Plane. 

![app-pairing](/assets/images/app-pairing.svg)

### API registration phase

API registration phase is a process of registering new API and Event API definitions. Application requests API or Event API registration and receives operation result.

![api-registration](/assets/images/api-registration.svg)

## Runtime creation

To create a new Runtime, Administrator sends proper request to the [Runtime Provisioner](/docs/glossary). Runtime Provisioner requests Runtime configuration from Director, and one-time token from Connector. Runtime Provisioner provisions Runtime, and then injects the configuration with one-time token. [Runtime Agent](/docs/glossary) uses this token to set-up trusted connection between Management Plane and Runtime Agent.

![runtime-creation](/assets/images/runtime-creation.svg)