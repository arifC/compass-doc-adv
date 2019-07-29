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