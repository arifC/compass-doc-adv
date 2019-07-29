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
- name and id of runtime "production"
- timestamp and condition

---

## Task 2 - Application with Documents

**Description**  
Suppose we want to create an application that represents Compass itself. Applications can also contain "Documents" which ideally contain some descriptive information about the application. Create an application that contains one document. The document is a markdown document and contains the "General Information" sentence from the [Introduction](/) page.

**Acceptance Criteria**  
Output shows:  
- name and id of created application
- title, format, and data of document in the application

---

## Task 3 - Add API to Application

**Description**  
Now we will also create an API for our application. The recently created application only has a document so far (Task 2). In this task you will add the API. The specification and version of this API must be in line with the other application (name: `existingApplication`) which is already in the system. The targetURL for our API will be the one you can find in the address bar of the playground.

**Acceptance Criteria**  
Output shows:  
- applicationID of our created application
- targetURL, spec with type and format