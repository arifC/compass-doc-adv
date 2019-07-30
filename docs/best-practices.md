---
layout: default
title: Best Practices
nav_order: 6
permalink: /docs/best-practices
---

# Best Practices

Here, we show some best practices in working with Compass.

## Specify how your response should look like

In mutations and queries, you can exactly specify how the API response should look like. We recommend to have more verbose responses to take the information for further steps. For example, if we create an Application like this, we only get minimal information and might have to fetch more information later on:

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
    # this is more helpful
    labels
    webhooks {
      id
      type
      url
    }
    apis {
      id
      name
      version {
        value
      }
    }
    # this is more helpful
  }
}
```

## Using the Playground

THe playground is easy to use but might get a messy workspace if matters are complex. We have some recommendations to make life easier:

### New tabs

Use a new tab for each request you issue!

![new-tabs](/assets/images/new-tabs.png)

### Prettify your requests

Use the **"Prettify"** button to bring some structure to bigger requests.

![prettify](/assets/images/prettify.png)