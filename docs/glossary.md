---
layout: default
title: Glossary
nav_order: 10
permalink: docs/glossary
---

# Glossary

We summarize the most important and frequent used terms in this glossary. 

| Term         | Description       |
|:-------------|:------------------|
| [Application](#Application)  | Existing system registered to MP with its API and Event Definitions. |
| [Connector](/docs/overview/components) | Compass component handling the first pairing and registration of Applications. |
| [Director](/docs/overview/components) | Compass component responsible for the management of Applications and Runtimes. |
| [Gateway](/docs/overview/components) | Compass component that handles all incoming API requests. |
| [Management Plane](#Management Plane) | Includes Compass, Runtime Provisioners and Cockpit components. |
| [Runtime](#Runtime) | Any system that can configure itself according to the configuration provided by the Management Plane. Takes care about a customer workload. |

---

## Application

Existing system registered to *MP* with its *API and Event Definitions*.

### API Defintion

An Application in Compass has to expose an API. This can be an ordinary (REST) API or an EventAPI which is used to receive business events. The APIs of an Application are registered at the Connector during the initial pairing and registration.

### Document

A resource giving additional information about an Application. This could be a software documentation in Markdown format or any other describing document.

## Management Plane
Abbr.: *MP*
Includes Compass, Runtime Provisioners and Cockpit components.

The multi-tenant system which allows to:

- create Applications
- create Runtimes
- manage Applications and Runtimes

## Runtime

Any system that can configure itself according to the configuration provided by the *Management Plane*. Takes care about a customer workload.

### Runtime Status

The runtime status consists of the condition and timestamp of a Runtime.  
The condition can have the values `INITIAL`, `READY` or `FAILED`. This indicates the health of the runtime. The timestamp shows when the Runtime changed its condition to the current one.

### Runtime Agent
Abbr.: *Agent*  

This component is responsible:
- to fetch configuration from *MP* to *Runtime*.
- for reporting health checks