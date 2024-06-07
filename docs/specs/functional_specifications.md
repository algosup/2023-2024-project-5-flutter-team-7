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
  - [2. How Adopte Un Candidat works](#2-how-adopte-un-candidat-works)
  - [3. Functionalities](#3-functionalities)
    - [3.1 Homepage](#31-homepage)
    - [3.2 User Selection](#32-user-selection)
    - [3.3 Candidate Profile Creation](#33-candidate-profile-creation)
    - [3.4 Company Profile Creation](#34-company-profile-creation)
    - [3.5 Anonymization \[^6\]](#35-anonymization-6)
    - [3.6 Matching Process](#36-matching-process)
      - [Candidate Side:](#candidate-side)
      - [Company Side:](#company-side)
      - [Matching:](#matching)
    - [3.7 Application Accessibility](#37-application-accessibility)
  - [4. Risks and Assumptions](#4-risks-and-assumptions)
    - [4.1 Risks](#41-risks)
    - [4.2 Budget Consideration](#42-budget-consideration)
    - [4.3 Out of Scope](#43-out-of-scope)
    - [4.4 External Resources](#44-external-resources)

</details>

## 1. Introduction

This is the official document containing the functional specifications of "Adopte Un Candidat". Our team is composed of:

| Name            | Role              | Description                                                                               |
| --------------- | ----------------- | ----------------------------------------------------------------------------------------- |
| Jason GROSSO    | Project Manager   | Responsible for project management, including timelines, planning and team coordination.  |
| David CUAHONTE  | Program Manager   | Manages functional specification development and client communication for the project.    |
| Léo CHARTIER    | Technical Lead    | Guides technical decisions and translates requirements into scalable technical solutions. |
| Robin DEBRY     | Software Engineer | Develops and implements codebase, ensures code quality and collaboration within the team. |
| Malo ARCHIMBAUD | QA                | Creates tests to validate the quality of the solution and to ensure compliance.           |
| Manech LAGUENS  | Technical Writer  | Creates comprehensive end-user documentation to facilitate the usage of the application . |

### 1.1 Overview

"Adopte Un Candidat" modernizes recruitment by anonymizing candidates and companies, prioritizing soft skills [^1] evaluation, and embracing a human-centered approach to hiring. The platform facilitates easy interaction between candidates and companies, promoting fair and efficient recruitment practices.

_A logo of the application is shown below:_

<div align = "center">

![Adopte1Candidat](images/ADOPTE_logo.png)

</div>

### 1.2 Purpose

We are evolution[^2] has entrusted us with this project. Our purpose is to help them create the application, following the previously mentioned criteria. The full solution will be composed of an application for mobile phones, tablets, and a computer application, all designed for a French-speaking audience. Other aspects of the project, such as the backend[^3], the database[^4], and an English translation, are outside of the scope of our team.

Our main goal is to create the appearance of the matching process. The other aspects that we will work on are the main interface, including the log-in page, sign-in page, soft-skills and hobby selections page among many other pages.

### 1.3 Personas

The primary users of the "Adopte Un Candidat" application include:

- **Jobseekers**: An individual who is seeking a job is one of the primary targets of "Adopte Un Candidat". This person would like to find a job without having to worry about their lack of experience. They would also like to be informed whenever a new job opportunity arises.
- **Recruiters**: The recruiter is another target of "Adopte Un Candidat". The recruiter would like to find individuals interested in his company by scouting specific soft skills. It would ease the process of selection if they could find someone that fits their cultural and organizational needs easily.

### 1.4 Use cases

**Candidate Registration**:

1. A jobseeker downloads and installs the "Adopte Un Candidat" application on their phone, tablet, or computer.
2. The jobseeker creates a profile, providing necessary details such as name, contact information, and anonymized data.
3. The jobseeker selects their soft skills from a provided list and adds them to their profile.
4. The application saves the profile, and the jobseeker is ready to be matched with potential employers.

**Company Registration**:

1. A recruiter signs up for an account on the "Adopte Un Candidat" application using their phone, tablet, or computer.
2. The recruiter creates a company profile, including anonymized details about the company and its culture.
3. The recruiter specifies the soft skills and qualifications they are looking for in candidates.
4. The recruiter posts job openings, detailing the role, required skills, and organizational needs.
5. The application saves the company profile and job postings, making them available for matching with potential candidates.

**Matching Candidates with Companies**:

1. A jobseeker, eager to find employment, opens the "Adopte Un Candidat" application on their selected device.
2. The jobseeker will now see on his screen different companies that may or may not interest him.
3. A match occurs when a jobseeker expresses interest in a company by selecting it, and the recruiter reciprocates by accepting the candidate's offer using a similar process.
4. When the matching process is completed, while the company will have to wait for the jobseeker's response, the individual will receive a notification of the success of the process.

## 2. How Adopte Un Candidat works

The application is composed of a creation of an account creation screen, a log-in page, a soft skills selection page, a hobby selection page and a matching between different companies page.

As requested by the client, the application has two different sides:

- **Candidate**: Candidates create anonymized profiles, select soft skills and hobbies, and receive job matches. They can communicate with companies and schedule interviews once the company contacts them.
- **Company**: Companies create profiles, specify desired soft skills, and post job openings. They can browse candidate matches, communicate with candidates, and schedule interviews via email communication.

## 3. Functionalities

### 3.1 Homepage

The homepage is the first section a user will see when opening the application.

This page contains four different buttons: one to display the selected language, one to log in, one to sign up, and a last one to connect with Google.

<div align = "center">

<img src="images/HOME.png" alt="home" width = 200>

</div>

### 3.2 User Selection

The user selection page will appear after the user presses one of the three buttons from the homepage.

In this page, the user will be able to select if he is a Candidate that is seeking for a job or a company.

<div align = "center">

<img src="images/SELECT.png" alt="select" width = 200>

</div>

### 3.3 Candidate Profile Creation

The profile creation will be the first step a candidate will need to take to use the application.

Firstly, the user will need to input different information such as their full name, date of birth, country of residence, postal address, email address, a user name and a password. The postal address may be selected by pressing the geolocation[^5] button.

<div align = "center">

<img src="images/CREATE_candidate.png" alt="account" width = 200>

</div>

Secondly, the candidate will have to select up to 8 soft skills between 27 different ones.

<div align = "center">

<img src="images/SOFTSKILLS.png" alt="softskills" width = 200>

</div>

Finally, there will be a need to select at most, 3 different hobbies for the profile, to ensure further distinction between candidates.

<div align = "center">

<img src="images/HOBBIES.png" alt="hobbies" width = 200>

</div>

After the profile is created, the candidate will be able to modify at all times their personal information, their soft skills and their hobbies.

<div align = "center">

<img src="images/PROFILE_candidate.png" alt="profile" width = 200>

</div>

### 3.4 Company Profile Creation

The profile creation on the company's side consists of inputting similar information as mentioned earlier: The name of the company, the country where it resides, an email address, a user name and a password.

<div align = "center">

<img src="images/CREATE_company.png" alt="account" width = 200>

</div>

Secondly, the soft skill list in this case should have the skills that the person who is recruiting is looking for in candidates.

<div align = "center">

<img src="images/SOFTSKILLS_company.png" alt="softskills" width = 200>

</div>

On this side, the user will have two different pages to manage their account. A first one that contains buttons to help modify the information of the company and another button to modify their job offers.

<div align = "center">

<img src="images/PROFILE_company.png" alt="profile" width = 200>

</div>
The second page is related to these job offers, it will display the current offers that are active at the moment.

<div align = "center">

<img src="images/OFFERS.png" alt="offers" width = 200>

</div>

### 3.5 Anonymization [^6]

To prevent discrimination, candidates will be anonymized on the platform. As a result, the personal information provided during account creation will only be accessible to the client's company and will not be shared or displayed at any time.

The main purpose of this is to avoid the usage of regular recruiting methods such as certifications, instead promoting a different course of selection based on the person on itself.

### 3.6 Matching Process

The matching process in "Adopte Un Candidat" involves two sides: the candidate and the company. Here's how it works:

#### Candidate Side:

Upon logging into the application, candidates are presented with a list of different companies that may match their skills and preferences. Candidates then review the anonymized profiles of these companies, focusing on the soft skills and job requirements they demand. For each company, candidates have the option to either accept or reject it based on their interest and compatibility. They can explore more about the company and its job offers by clicking on their respective profiles.

<div align = "center">

<img src="images/MATCHING_candidate.png" alt="matching" width = 200>

</div>

#### Company Side:

Recruiters, upon logging in, can view all the candidates who have shown interest in their company by ticking them. They have access to the anonymized profiles of these candidates, showcasing their soft skills and other relevant details. For each candidate, recruiters have the option to either accept or reject them based on their specific needs and job requirements.

_The color changes depending on the applicant's taste:_


<div align = "center">

<img src="images/MATCHING_company.png" alt="matching" width = 200>

</div>

#### Matching:

A match occurs when both the candidate and the company have ticked each other. Once a match is made, candidates and companies are notified of the successful match via the application. Matched candidates and companies can proceed to communicate further and schedule interviews within the app via email communication.

_Candidate side:_

<div align = "center">

<img src="images/MATCHED_candidate.png" alt="matched" width = 200>

</div>

_Company side:_

<div align = "center">

<img src="images/MATCHED_company.png" alt="matched" width = 200>

</div>

### 3.7 Application Accessibility

"Adopte Un Candidat" is currently accessible on Android phones, prioritizing mobile accessibility for users. While desktop accessibility and iOS versions are potential future considerations, our current focus is on delivering a comprehensive experience for Android users.

Additionally, the client has specified that the application should be in French, aligning with its intended audience in France.

As such, we are currently focusing on only doing the application on French, other languages are not in the scope of the team.

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
- A button to share your profile to a friend so that it can be reviewed by them is out of scope.
- The backend development (such as a database) is not part of the scope.
- An automatization towards the matching process is out of scope.
- Other languages for the application are out of scope.

### 4.4 External Resources

To gain further knowledge on the application, our figma contains all of our mockups. [Link](https://www.figma.com/design/b4Ws8mQPVYingGF7a6FfGE/Mockup-1?node-id=0%3A1&t=QcX7vEzgQXon72yb-1)


[^1]: **Soft Skills**: Non-technical skills related to how individuals interact with others, such as
[^2]: **We are evolution**: We are evolution is a company based in France that focuses on innovative recruitment. For more information visit [We Are Evolution](https://www.we-are-evolution.com/).
[^3]: **Backend**: The backend manages data, logic, and processes on the server-side of an application. Though not within your team's scope, it's crucial for supporting the app's functionality and performance.
[^4]: **Database**: A database stores and manages structured data for efficient retrieval and manipulation. While not part of your team's tasks, it serves as an external resource for storing user information, job postings, and other data.
[^5]: **Geolocation**: Geolocation identifies the real-world location of an object, like a mobile device or user. In the app, it enables candidates to automatically provide their current location during profile creation.
[^6]: **Anonymization**: The process of concealing or protecting the identities of candidates on the platform to prevent discrimination.
