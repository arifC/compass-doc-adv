---
layout: default
title: Best Practices
nav_order: 6
permalink: /docs/best-practices
---

# Best Practices

Here, we show some best practices in working with Compass.

## Information retrieval with mutations

Usually, the mutation is only used for the creation, deletion or update of a resource. The response of a mutation is often held minimal. We recommend to have more verbose responses to take the information for further steps. For example, if we create an Application like this, we only get minimal information and might have to fetch more information later on:

```graphql
mutation {
  createApplication(
    in: {
      name: "test-app"
      description: "Something."
      webhooks: {
        type: CONFIGURATION_CHANGED
        url: "www.example.com/api/v1"
      }
    }
  ) {
    id
    name
    labels
  }
}
```

Rather do this to get more information

```graphql
mutation {
  createApplication(
    in: {
      name: "test-app"
      description: "Something."
      webhooks: {
        type: CONFIGURATION_CHANGED
        url: "www.example.com/api/v1"
      }
    }
  ) {
    id
    name
    labels
    # this is more helpful
    webhooks {
      id
      type
      url
    }
  }
}
```

## Using the Playground

THe playground is easy to use but might get a messy workspace if matters are complex. We have some recommendations to make life easier:

### New tabs

Use a new tab for each request you issue!

![new-tabs](/assets/images/new-tabs.png)

### Use the embedded resources

The playground has a documentation and schema embedded. Use the search function to get along easily.

![embedded-resources](/assets/images/embedded-resources.png)

### Prettify your requests

Use the **"Prettify"** button to bring some structure to bigger requests.

![prettify](/assets/images/prettify.png)