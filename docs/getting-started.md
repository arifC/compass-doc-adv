---
layout: default
title: Getting Started
nav_order: 3
permalink: /docs/getting-started
---

# Getting Started

This page is intended for developers who want to start working with Compass. We will cover the prerequisites, first steps, and some basic requests that will help you understand the concepts.

## Before you start

Before making any API requests, we want to introduce the tools we offer you for interacting with the API. For now, you don't need to install anything. This documentation provides tools to "play around. Make sure you find and check the most important resources:
- [Specification](/assets/graphql-doc/index.html) & [Playground](https://director.compass.cluster.extend.cx.cloud.sap/) (upper right of the page)
- Components & Flows in the [Overview](/docs/overview)

The Specification & Playground will help you with the technicalities of the API, while the Overview provides all the conceptual knowledge to really understand Compass as a whole.

## GraphQL Playground

The [GraphQL Playground](https://director.compass.cluster.extend.cx.cloud.sap/) consists of an interface for GraphQL requests and responses. You can find the original project on [Github](https://github.com/prisma/graphql-playground). You can interact with the API of the **Director** component of compass. In total, the playground comprises the following components:

- runtime environment for Director
- embedded technical specification
- embedded documentation

If you open the playground you will see the UI with its fields. The following image, points out the most important features.

![playground](/assets/images/playground.png)

1. Use tabs to keep the API requests.
2. The endpoint of the GraphQL API is ``https://director.compass.cluster.extend.cx.cloud.sap/graphql``. Make sure you use this exact URL in the address field.
3. Use the left-hand side to formualate your GraphQL queries.
4. Define HTTP headers for your queries. The header ``tenant`` is necessary.
5. Use the button in the middle to execute your request. Alternatively, use the shortcut ``CTRL+Enter``.
6. The right-hand side shows the response for your request.
7. Embedded schema and documentation for quick references.

## Use the specification

The [GraphQL Schema](/assets/graphql-doc/index.html) is the most important resource concerning types, attributes and objects. Make sure to use the search bar and clickable elements within an object description. By clicking through the types, you get an insight on how to build your own requests.

![spec](/assets/images/spec.png)
