---
layout: default
title: Overview
nav_order: 2
has_children: true
permalink: /docs/overview
---

# Overview

This page is intended to present the use cases and general information on Compass. 

## What is Compass?

With Compass you can **manage multiple Kyma runtimes** and their **connected applications** in a multi-tenant way. The capabilities of Compass comprise the following features:
- **Runtime management:** CRUD, Labels, Agents
- **Application management:** CRUD, Labels, APIs/Events, Webhooks
- Setting up **health checks**

---

## What problem does Compass solve?

Managing multiple **runtimes and applications** in a central place becomes complex in large enterprises. Suppose, you have to deal with frequent changes in the runtimes, but not every external application such as your ERP or CRM system can easily adapt to this. With Compass, these changes are managed using a single tool and you can keep track of the whole landscape.

The following illustration shows how Compass serves as a Management Plane for Applications and Runtimes:

![high-level](/assets/images/components-high-level.svg)

---

## How does it work?

In Compass, different sub systems are responsible for different tasks. These components are further explained in [Components](/docs/overview/components). On a high-level, the **components expose internal and external APIs** for to deal with Applications, Runtimes, and changes in the system landscape as a whole. This is also explained in [Flows](/docs/overview/flows).

---

## What is next?

You could now get some deeper information on the concepts behind Compass. Reading about [components](/docs/overview/components) and [flows](/docs/overview/flows) is **highly recommended**. Otherwise, you can start working through our [Getting Started](/docs/getting-started) guide.