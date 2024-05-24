# Management Artifacts

## Introduction

This document contains the main management documents

- [Management Artifacts](#management-artifacts)
  - [Introduction](#introduction)
  - [Project Charter](#project-charter)
  - [RACI Matrix](#raci-matrix)
  - [MoSCoW](#moscow)

## Project Charter

You can find the Project Charter [HERE](/docs/management/project_charter.md)


## RACI Matrix

The RACI Matrix is a management document used to define team roles across 4 categories: Responsible[^1], Accountable[^2], Consulted[^3], Informed[^4].

| Name | Project Manager | Program Manager | Tech Lead | Software Engineer | Quality Assurance | Technical Writer | Client | StakeHolder |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| Project Brief | I | I | I | I | I | I | R / A | C |
| Project Charter | R / A | C / I | C / I | C / I | C / I | C / I | C | I |
| Mockups | C / I | R / A | C / I | C / I | C / I | C / I | C / I | I |
| Planning | R / A | C / I | C / I | C / I | C / I | C / I | - | I |
| Functional Specification | I | R / A | C / I | I | I | I | C | I |
| Technical Specification | I | C | R / A | I | I | - | C | I |
| Code | - | - | C | R / A | I | - | - | - |
| Code Documentation | - | - | C | R / A | C / I | - | - | - |
| Test Plan | I | - | C | C | R / A | - | - | - |
| User Manual | I | C | C | - | - | R / A | I | - |

[^1]: **Responsible**: Those who are responsible for the correct completion of the task;
[^2]: **Accountable**: The one that must sign off (approve) work that responsible provides;
[^3]: **Consulted**: Those whose opinions are sought, typically subject-matter experts, and with whom there is two-way communication;
[^4]: **Informed**: Those who are kept up-to-date on progress, often only on completion of the task or deliverable, and with whom there is just one-way communication;

## MoSCoW 

The MoSCoW method is a prioritisation technique used in management, business analysis, project management, and software development to reach a common understanding with stakeholders on the importance they place on the delivery of each requirement; it is also known as MoSCoW prioritisation or MoSCoW analysis.

| Must Have | Should Have | Could Have | Will not Have |
| --- | --- | --- | --- |
| Front-End | Mock Data | Website / Computer Version | Back-End |
