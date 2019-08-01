---
layout: default
title: Tutorial
nav_order: 4
permalink: /docs/tutorial
---

# Tutorial

In this tutorial we will demonstrate some **very common uses** of Compass. We start with a blank landscape and will create every component ourselves until we have reached a state that is representative. We recommend using the [GraphQL Playground](https://director.compass.cluster.extend.cx.cloud.sap/) to walk through the tutorial. Alternatively, you can use the following button to import a Postman collection:

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/8605900361a34a6f4100)

In our case, we will imagine a large enterprise which has some applications that need to be connected to cluster runtimes. We will also talk through some realistic changes.

**What we cover here:**
- two runtimes for different environments (development, production, ...)
- one application with an exposed APIs
- add a Webhook to our Application

## Setting up the landscape

We will create our two Runtimes (**prod** and **dev**) first. These requests **create the Runtimes**:

```graphql
mutation {
  createRuntime(
    in: {
      name: "prod"
      description: "This cluster contains our production environment."
      labels: { group: ["prod"] }
    }
  ) {
    id
    name
    labels
  }
}
```

```graphql
mutation {
  createRuntime(
    in: {
      name: "dev"
      description: "This cluster contains our development environment."
      labels: { group: ["dev"] }
    }
  ) {
    id
    name
    labels
  }
}
```

Our application in this tutorial will be an ERP enterprise system. We will call it SAP ERP. This request **creates the Application** in its simplest form.

```graphql
mutation {
  createApplication(
    in: {
      name: "sap-erp"
      description: "The ERP system of the company with its APIs."
      labels: { group: ["prod", "dev"] }
      apis: [
        {
          name: "v1"
          description: "API of our ERP application."
          targetURL: "www.example.com/api"
          spec: { data: "<API-SPEC>", type: OPEN_API, format: YAML }
        }
      ]
    }
  ) {
    id
    name
    labels
  }
}
```

## Adding a Webhook

To make our application reachable via callbacks, we will now add a webhook afterwards.  
First, we **get the id of our application** since it is a parameter of the `addWebhook()` mutation. You can see all available mutations in the [Spec](http://localhost:4000/assets/graphql-doc/mutation.doc.html):  

```graphql
query {
  applications {
    data {
      id
      name
      description
    }
  }
}
```

The **result** may look similar to this:

```json
{
  "data": {
    "applications": {
      "data": [
        {
          // This is what we are looking for
          "id": "9cf626b2-2d59-48f7-ae85-a9fb1eee7a8b",
          "name": "sap-erp",
          "description": "The ERP system of the company with its APIs."
        }
      ]
    }
  }
}
```

Using the id we can now **add our webhook**. For the definiton of a webhook, please see the [Specification](http://localhost:4000/assets/graphql-doc/webhookinput.doc.html).

```graphql
mutation {
  addWebhook(applicationID: "9cf626b2-2d59-48f7-ae85-a9fb1eee7a8b", in: {
    type: CONFIGURATION_CHANGED
    url: "https://www.erp.company/hook/v1"
  }) {
    id
    type
    url
  }
}
```

Besides adding webhooks to applications, you have **more possibilities** from here. Such as:

- `addApi`
- `addEventAPI`
- `addDocument`

## Updating a Webhook

Often, even the webhook endpoints of an API might change. Our ERP application now has a new version of its webhook. To deal with this, we will use the mutation `updateWebhook`.

Again, we first find the id of our webhook because it is a necessary input parameter for the mutation:

```graphql
query {
  applications {
    data {
      id
      name
      webhooks {
        type
        url
        id
      }
    }
  }
}
```

The response will contain the webhook id which can be used to create the `updateWebhook` mutation:

```graphql
mutation {
  updateWebhook(
    webhookID: "3c0894de-60f5-4fb1-9c85-cd62c1f36250"
    in: { 
      type: CONFIGURATION_CHANGED
      url: "https://www.erp.company/hook/v2"
    }
  ) {
    id
    type
    url
  }
}
```