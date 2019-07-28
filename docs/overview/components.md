---
layout: default
title: Components
nav_order: 3
parent: Overview
permalink: docs/overview/components
---

# Components

The Management Plane is an abstract definition and set of exposed functionality on how users can manage different aspects of their application landscape allowing flexible approaches of extending, customizing and integrating their existing application solutions. The Management Plane as a whole comprises several components which are explained in this chapter.

![mp-components](/assets/images/mp-components.svg)

## Connector

The Connector component exposes a GraphQL API that can be accessed directly, its responsibility is establishing trust among Applications, Management Plane and [Runtimes](/docs/glossary.md#Runtime). The Connector, as the name indicates, plays a major role in connecting external applications to the Management Plane.

## Gateway

The Gateway component serves as the main Gateway that extracts the tenant header from incoming requests and proxies the requests to the Director component. All requests pass this component.

## Director

The Director component exposes a GraphQL API that can be accessed through the Gateway component. This is also the API we provide in the [Specification](/assets/graphql-doc/index.html) and [Playground](https://director.compass.cluster.extend.cx.cloud.sap). It contains all the business logic required to handle Applications and Runtimes registration as well as health checks. This information is managed through the Director's interaction with the Registry. The Director provides all the necessary functionality to manage an application landscape.

## Cockpit

The Cockpit component calls Management Plane APIs (in particular Compass and Runtime Provisioner APIs). This component is interchangeable since it only requires an implementation of the APIs of the Management Plane.

## Storage/Registry

The Registry component serves as the persistent storage interface. Currently, this component is a relational database that is used by the Director for all information about Applications and Runtimes.

## Runtime Provisioner

The Runtime Provisioner handles the creation, modification, and deletion of Runtimes. This component is also interchangeable and only concerns the infrastructural topics of Runtimes.