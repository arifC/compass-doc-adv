---
layout: default
title: Tutorial
nav_order: 4
permalink: /docs/tutorial
---

# Tutorial

In this tutorial we will demonstrate some very common uses of Compass. We start with a blank landscape and will create every component ourselved until we have reached a state that is representative to what most customers have.

In our case, we will imagine a large enterprise which has some applications that need to be connected to cluster runtimes. We will also talk through some realistic changes.

**Desired outcome:**
- multiple runtimes for different environment (development, production, ...)
- multiple applications with exposed APIs
- handling a change in the landscape

## Setting up the landscape

We will create our two Runtimes ("**prod**" and "**dev**") first. After, we can create our Application in a plain version without any APIs. These requests create the runtimes:

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

Our application in this tutorial will be an ERP enterprise system. We will call it SAP ERP. This request creates the Application in its simplest form.

```graphql
mutation {
  createApplication(
    in: {
      name: "sap-erp"
      description: "The ERP system of the company with its APIs."
      labels: { group: ["prod", "dev"] }
      documents: {
        title: "ERP Handbook"
        displayName: "erp-handbook"
        description: "This handbook contains the documentation of this application."
        format: MARKDOWN
        data: "All the information about our ERP."
      }
    }
  ) {
    id
    name
    labels
  }
}
```

## Adding a Webhook

To make our application reachable via callbacks, we will no add a webhook afterwards.

First, we get the id of our application since it is a parameter of the `addWebhook()` mutation:

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

The result may look similar to this:

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

Using the id we can now add our webhook. For the definiton of a webhook, please see the [Specification](http://localhost:4000/assets/graphql-doc/webhookinput.doc.html).

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

Now we have added a webhook to our Application that can react on changed configurations. 