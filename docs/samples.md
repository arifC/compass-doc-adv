---
layout: default
title: Samples
nav_order: 5
permalink: /docs/samples
---

# Samples

This page covers some common examples of using Compass. While working on the samples in the [Playground](https://director.compass.cluster.extend.cx.cloud.sap) please make sure to set the `tenant` header to `samples`. You can also use a Postman collection to work on the examples locally:  

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/8605900361a34a6f4100)

## Runtime

### Create a runtime

Only a small selection of mandatory fields is necessary.  
Also see [Mutations](http://localhost:4000/assets/graphql-doc/mutation.doc.html).

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

### Get all runtimes

For all specifiable Runtime properties see the [Runtime Specification](http://localhost:4000/assets/graphql-doc/runtime.doc.html).  
Also see [Queries](http://localhost:4000/assets/graphql-doc/query.doc.html).

```graphql
query {
 runtimes {
  data {
   id
   name
   labels
   description
   status {condition}
  }
 }
}
```

### Get a specific runtime

The runtime query only takes the `id` as an input.  
Also see [Queries](http://localhost:4000/assets/graphql-doc/query.doc.html).

```graphql
query {
  runtime(id: "123abc") {
    id
    name
    description
  }
}
```

## Application

### Create an application

To see all properties of the input for this mutation, see the [Application Specification](http://localhost:4000/assets/graphql-doc/applicationinput.doc.html).  
Also see [Mutations](http://localhost:4000/assets/graphql-doc/mutation.doc.html).

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

### Get all applications

Also see [Queries](http://localhost:4000/assets/graphql-doc/query.doc.html).

```graphql
query {
  applications {
    data {
      id
      name
      description
      apis {
        data {
          name
        }
      }
      documents {
        data {
          title
        }
      }
    }
  }
}
```

Alternative:

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

### Get a specific application

The only parameter for the `application()` query is the `id`.  
Also see [Queries](http://localhost:4000/assets/graphql-doc/query.doc.html).

```graphql
query {
  application(id: "123abc") {
    id
    name
    labels
    eventAPIs {
      data {
        spec
        version
      }
    }
  }
}
```

### Adding a resource to an application

If you have an application and want to add something to it, make sure you have the `id` ready. Then use one of the `add...()` mutations like `addAPI()` or `addWebhook()`.  
For example like this:  

```graphql
mutation {
  addEventAPI(
    applicationID: "<you_should_have_this>"
    in: { 
      name: "Test"
      spec: { 
        format: YAML
        eventSpecType: ASYNC_API 
      }
    }
  ) {
    id
    name
  }
}
```