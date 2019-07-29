---
layout: default
title: Tasks
nav_order: 99
permalink: docs/tasks
---

# Tasks

This page contains the three challenges to solve during this study. They increase in difficulty and require you to form one or multiple API requests to get the expected output.

## Task 1 - Runtime Status

**Description**  
The system already manages some runtimes. We would like to know the status of the runtime with the name "production". The status includes the condition and the timestamp. We need both information for this task.

**Acceptance Criteria**  
Output shows:  
- name and id of runtime "Production"
- timestamp and condition

---

## Task 2 - Application with Documents

**Description**  
Suppose we want to register an application that represents Compass itself. Applications can also contain "Documents" which ideally contain some descriptive information about the application. Create an application that contains one document. The document is a markdown document and contains the "General Information" sentence from the [Introduction](/) page.

**Acceptance Criteria**  
Output shows:  
- name and id of created application
- title, format, and data of document in the application

---

## Task 3 - Add API to Application

**Description**  
Now we will also register an API for our application. Update our recently create application by adding an API to it. The specification and version of the API must be in line with the other applications which are already registered. The targetURL for our API will be the one you can find in the address bar of the playground.

**Acceptance Criteria**  
Output shows:  
- applicationID of our created application
- targetURL, spec with type and format