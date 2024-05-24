# Functional Specifications

## Table of Contents

<details>
<summary>Click to expand</summary>

- [Functional Specifications](#functional-specifications)
  - [Table of Contents](#table-of-contents)
  - [1. Introduction](#1-introduction)
    - [1.1 Overview](#11-overview)
    - [1.2 Purpose](#12-purpose)
    - [1.3 Personas](#13-personas)
    - [1.4 Use cases](#14-use-cases)
  - [2. How Adopte 1 Candidat works](#2-how-adopte-1-candidat-works)
  - [3. Functionalities](#3-functionalities)
    - [3.1 Candidate Profile Creation](#31-candidate-profile-creation)
    - [3.2 Company Profile Creation](#32-company-profile-creation)
    - [3.3 Anonymization](#33-anonymization)
    - [3.4 Matching Process](#34-matching-process)
      - [Candidate Side:](#candidate-side)
      - [Company Side:](#company-side)
      - [Matching:](#matching)
    - [3.5 Application Accessibility](#35-application-accessibility)
  - [4. Risks and Assumptions](#4-risks-and-assumptions)
    - [4.1 Risks](#41-risks)
    - [4.2 Budget Consideration](#42-budget-consideration)
    - [4.3 Out of Scope](#43-out-of-scope)

</details>

## 1. Introduction

This is the official document containing the functional specifications of "Adopte 1 Candidat". Our team is composed of:

| Name            | Role              | Description                                                                                 |
| --------------- | ----------------- | ------------------------------------------------------------------------------------------- |
| Jason GROSSO    | Project Manager   | In charge of managing the project to meet deadlines.                                        |
| David CUAHONTE  | Program Manager   | In charge of writing of the functional specification and the communication with the client. |
| Léo CHARTIER    | Technical Lead    | In charge of writing the technical specification.                                           |
| Robin DEBRY     | Software Engineer | In charge of writing the code.                                                              |
| Malo ARCHIMBAUD | QA                | In charge of testing the solution and ensuring compliance.                                  |
| Manech LAGUENS  | Technical Writer  | In charge of writing the user manual.                                                       |

### 1.1 Overview

"Adopte 1 Candidat" modernizes recruitment by anonymizing candidates and companies, prioritizing soft skills evaluation, and embracing a human-centered approach to hiring. The platform facilitates easy interaction between candidates and companies, promoting fair and efficient recruitment practices.

### 1.2 Purpose

We are evolution has entrusted us with this project. Our purpose is to help them create the application, following the previously mentioned criteria. The full solution will be composed of an application for mobile phones, tablets and a computer application. Other aspects of the project, such as the backend and the database are outside of the scope of our team.

Our main goal is to tackle the algorithm for the matching process. The other aspects that we will work on are the main interface, including the log-in page, sign-in page, soft-skills and hobby selections page among many other pages.

### 1.3 Personas

The primary users of the "Adopte 1 Candidat" application include:

- **Jobseekers**: An individual who is seeking a job is one of the primary targets of "Adopte 1 Candidat". This person would like to find a job without having to worry about their lack of experience. They would also like to be informed whenever a new job opportunity arises.
- **Recruiters**: The recruiter is another target of "Adopte 1 Candidat". The recruiter would like to find individuals interested in his company by scouting specific soft skills. It would ease the process of selection if they could find someone that fits their cultural and organizational needs easily.

### 1.4 Use cases

- **Candidate Registration**:

  1. A jobseeker downloads and installs the "Adopte 1 Candidat" application on their phone, tablet, or computer.
  2. The jobseeker creates a profile, providing necessary details such as name, contact information, and anonymized data.
  3. The jobseeker selects their soft skills from a provided list and adds them to their profile.
  4. The application saves the profile, and the jobseeker is ready to be matched with potential employers.

- **Company Registration**:

  1. A recruiter signs up for an account on the "Adopte 1 Candidat" application using their phone, tablet, or computer.
  2. The recruiter creates a company profile, including anonymized details about the company and its culture.
  3. The recruiter specifies the soft skills and qualifications they are looking for in candidates.
  4. The recruiter posts job openings, detailing the role, required skills, and organizational needs.
  5. The application saves the company profile and job postings, making them available for matching with potential candidates.

- **Matching Candidates with Companies**:
  1. A jobseeker, eager to find employment, opens the "Adopte 1 Candidat" application on their selected device.
  2. The jobseeker will now see on his screen different companies that may or may not interest him.
  3. The "matching" process will begin, with a match occurring when there is a selection on the jobseeker side of a company. On the recruiter side, they must select the individual as well for a match to occur.
  4. When the matching process is completed, while the company will have to wait for the jobseeker's response, the individual will receive a notification of the success of the process.

## 2. How Adopte 1 Candidat works

The application is composed of a creation of an account creation screen, a log-in page, a soft skills selection page, a hobby selection page and a matching between different companies page.

As requested by the client, the application has two different sides:

- **Candidate**: Candidates create anonymized profiles, select soft skills and hobbies, and receive job matches. They can communicate with companies and schedule interviews within the app via email.
- **Company**: Companies create profiles, specify desired soft skills, and post job openings. They can browse candidate matches, communicate with candidates, and schedule interviews within the app via email.

## 3. Functionalities

### 3.1 Candidate Profile Creation

The profile creation will be the first step a candidate will need to take to use the application.

Firstly, the user will need to input different information such as their full name, date of birth, country of residence, postal address, email address, a user name and a password.

"placeholder for image of mockup"

Secondly, the candidate will have to select up to 8 soft skills between 27 different ones.

"placeholder for image of mockup"

Finally, there will be a need to select at most, 3 different hobbies for the profile, to ensure further distinction between candidates.

"placeholder for image of mockup"

After the profile is created, the candidate will be able to modify at all times their personal information, their soft skills and their hobbies.

"placeholder for image of mockup"

### 3.2 Company Profile Creation

The profile creation on the company's side consists of inputting similar information as mentioned earlier: The name of the company, the country where it resides, an email address, a user name and a password.

"placeholder for image of mockup"

Secondly, the soft skill list in this case should have the skills that the person who is recruiting is looking for in candidates.

"placeholder for image of mockup"

On this side, the user will have two different pages to manage their account. A first one that contains buttons to help modify the information of the company and another button to modify their job offers.

"placeholder for image of mockup"

The second page is related to these job offers, it will display the current offers that are active at the moment.

"placeholder for image of mockup"

### 3.3 Anonymization

To prevent discrimination, candidates will be anonymized on the platform. As a result, the personal information provided during account creation will only be accessible to the company and will not be shared or displayed at any time.

The main purpose of this is to avoid the usage of regular recruiting methods such as certifications, instead promoting a different course of selection based on the person on itself.

### 3.4 Matching Process

The matching process in "Adopte 1 Candidat" involves two sides: the candidate and the company. Here's how it works:

#### Candidate Side:

Upon logging into the application, candidates are presented with a list of different companies that may match their skills and preferences. Candidates then review the anonymized profiles of these companies, focusing on the soft skills and job requirements they demand. For each company, candidates have the option to either tick or cross it based on their interest and compatibility. They can explore more about the company and its job offers by clicking on their respective profiles.

"placeholder image mockup"

#### Company Side:

Recruiters, upon logging in, can view all the candidates who have shown interest in their company by ticking them. They have access to the anonymized profiles of these candidates, showcasing their soft skills and other relevant details. For each candidate, recruiters have the option to either tick or cross them based on their specific needs and job requirements. They can explore more about the candidates by clicking on their profiles.

"placeholder image mockup"

#### Matching:

A match occurs when both the candidate and the company have ticked each other. Once a match is made, candidates and companies are notified of the successful match via the application. Matched candidates and companies can proceed to communicate further and schedule interviews within the app via email communication.

"placeholder image mockup"

### 3.5 Application Accessibility

"Adopte 1 Candidat" is currently accessible on Android phones, as we have decided to prioritize mobile accessibility for users. It is however not out of scope to expand accessibility to desktop platforms or to develop versions for iOS devices.

However, at this stage, the focus remains on providing a complete experience for Android users.

## 4. Risks and Assumptions

### 4.1 Risks

| Risk                           | Impact   | Mitigation                                                                                                                                                                                                                       |
| ------------------------------ | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Data Privacy Concerns          | High     | Data privacy breaches could lead to legal ramifications and damage to the platform's reputation. To mitigate this risk, robust data protection measures will be implemented.                                                     |
| Matching Process Bias          | Moderate | A bias on the matching process could result in unfair or inaccurate matches between candidates and companies. To address this risk, the matching process will undergo testing and validation.                                    |
| Technical Compatibility Issues | Low      | Compatibility issues with different devices, operating systems, or software versions could disrupt the user experience and limit accessibility. To resolve this risk, testing will be pursued on different android environments. |

### 4.2 Budget Consideration

As the application is being created from scratch, there should not be any expenses for the project. However, there may be a need to spend some money to publish the application and to maintain it. We reserve the right to recommend specific functionalities if we feel it is necessary.

### 4.3 Out of Scope

- A screen to view your different matches as a candidate is out of scope.
- A button to pass your profile to a friend so that it can be reviewed by them is out of scope.
- The backend development (such as a database) is not part of the scope.
- An automatization towards the matching process is out of scope.
