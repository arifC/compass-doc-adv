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