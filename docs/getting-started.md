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

## First steps

Let us start with the basic entities in Compass: Runtimes and Applications. We will now create both using GraphQL *mutations*. Using mutations you can create, update, and delete resources in GraphQL. After that we will use a *query* to read our resources.

### Create a runtime

The runtime stands for a cluster that has Kyma installed. It can be labelled for better manageability and has a variety of attributes. The runtime is the point where the applications connect to. However, this will not be covered in this guide.  
The following request uses the mutation **createRuntime** to create a runtime. We only specify the name, description, and one label. You can define more attributes (see [specification](/assets/graphql-doc/index.html) for further information).

This request will create a runtime and return a JSON with the id and name of the created object.

```graphql
mutation {
  createRuntime(
    in: { 
      name: "first-runtime"
      description: "This is my first runtime."
      labels: { group: ["production"]}
    }
  ) {
    id
    name
  }
}
```

### Create an application

An application is any external system that needs to communicate with the components of a runtime or with other systems connected to a runtime. An application has more complex concepts such as event APIs, webhooks, and documents. In this example we create the application with some basic attributes (name, description, labels) and the API element, which specifies the API exposed by this particular application.  
Again, we use a mutation, in this case it is **createApplication**. For more details on the attributes and syntax, see the [specification](/assets/graphql-doc/index.html). Use the search bar to find the mutation easily.

This request will create an application and return a JSON with the id, name, and description of the created object.

```graphql
mutation {
  createApplication(
    in: {
      name: "first-application"
      description: "This is my first application."
      labels: { group: ["production"] }
      apis: [
        {
          name: "v1"
          description: "API of our first application."
          targetURL: "www.example.com/api"
          spec: { data: "<API-SPEC>", type: OPEN_API, format: YAML }
        }
      ]
    }
  ) {
    id
    name
    description
  }
}
```

### Query your systems

To get all runtimes or applications, we will use a GraphQL **query**. Using a query you can only read resources from the API without manipulating it. In your query, you can precisely specify what information should be returned. The GraphQL API will respond in the way you specified (more on [GraphQL advantages & disadvantages](https://stablekernel.com/advantages-and-disadvantages-of-graphql/)).

The following query will list all applications with some basic attributes and their APIs.

```graphql
query {
  applications {
    data {
      id
      name
      description
      labels
      apis {
        data {
          name
          spec {
            type
          }
          targetURL
        }
      }
      eventAPIs {
        data {
          name
          spec {
            type
          }
        }
      }
    }
  }
}
```

A possible response from the API might look like this:

```json
{
  "data": {
    "applications": {
      "data": [
        {
          "id": "2cd012b4-c242-424f-bfd4-55afc3b71b0f",
          "name": "first-application",
          "description": "This is my first application.",
          "labels": {
            "group": [
              "production"
            ]
          },
          "apis": {
            "data": [
              {
                "name": "v1",
                "spec": {
                  "type": "OPEN_API"
                },
                "targetURL": "www.example.com/api"
              }
            ]
          },
          "eventAPIs": {
            "data": []
          }
        }
      ]
    }
  }
}
```