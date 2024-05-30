<!-- Somewhere: No budget -->

# Technical specifications

- [Introduction](#introduction)
  - [Project description](#project-description)
  - [Goals](#goals)
  - [Scope and future](#scope-and-future)
- [Technical Architecture](#technical-architecture)
  - [Technology Stack](#technology-stack)
  - [Architecture](#architecture)
  - [Internal APIs](#internal-apis)
  - [External APIs](#external-apis)
- [Development](#development)
  - [Requirements](#requirements)
  - [Coding standards](#coding-standards)
- [Testing](#testing)
- [Deployment](#deployment)
  - [Maintenance and Support](#maintenance-and-support)
- [Glossary](#glossary)



## Introduction

### Project description

Adopte Un Candidat is a mobile and desktop app made to ease the recruitment process. \
How the application works will resemble [Tinder](https://tinder.com/) with a swiping mechanic.

It is a request from We Are Evolution, a French company based in Châteauroux that provides advice to companies for their recruitment.

The matchmaking will be based solely on soft skills to allow companies to recruit candidates even if they do not have diplomas or experience. Additionally, to avoid discrimination and potential biases, the profiles of both the candidates and the companies are anonymized.

The mobile application targets any person looking for a job, while the desktop version is intended for companies that have difficulties filling a position with the usual recruitment methods.

### Goals

Our goals for the application are by order of priority:
1. Allow the matchmaking of job-seekers and companies
2. Selection of soft skills for both parties
3. Further customization of one's profile
   - Possibility to geolocate or manually input your address
4. Possibility for companies to have multiple offers at once
5. Language selection
6. Have both a mobile (job-seeker-focused) and a desktop (recruiter-focused) version of the application

### Scope and future

Our task for this project is only to create the interface the users will use. The backend with all the algorithms and logistics is up to our client to decide and create. <!-- Give hints on how to do it? --> \
For us to be able to test our application, we will still have to create a mockup system with basic functionality and fake data.

Since our timeframe for this project is quite short, uploading our app on Apple's AppStore or on Google Play might prove to be difficult. As such, distributing the application to those marketplaces is not our priority and will not be done. \
If a decision is taken to do otherwise, we will update this document as needed.

Similarly, making our application responsive and fully working on mobile, tablets, and computers will require a lot of time. For this reason, it is the last goal on our list and might even require to be a future improvement.

Finally, some companies may get a lot of matches. For this reason, it is important to have the possibility for them to have automatic matchmaking. This task is not our priority and has been defined as out of scope.



## Technical Architecture

### Technology Stack

To design the front end of our application, we will use [Flutter](https://flutter.dev/), a framework for [Dart](https://dart.dev/) created by Google.

As for the backend, we will create a quick and temporary one using [Pocketbase](https://pocketbase.io/). Since we are not in charge of it, the interactions and responses will be hardcoded.

### Architecture

Our application will follow the MVVM (Model-View-ViewModel) architecture pattern with a provider design pattern. This will be done using the [Riverpod](https://riverpod.dev/) library.

<!-- Component diagram here -->

### Internal APIs

We will use three categories of endpoints for this application.

**Authentification**

The first step is to authentify the user. There are two ways to do so:
- `/auth/login` (POST)
- `/auth/register` (POST)

There will also be one endpoint to logout:
- `/auth/logout`

**Profile**

There will be two endpoints to access a profile, depending on who you are:
- `/profile/user` (GET/POST/PUT/DELETE)
- `/profile/company` (GET/POST/PUT/DELETE)

**Matchmaking**

Once again, there are two enpoints:
- `/match/user` (GET/POST)
- `/match/company` (GET/POST)

The POST method should return wether there is a match or not. The requests from the company side should also include the id of the job offer that is targeted.

### External APIs

<!-- Google sign-in -->

## Development

### Requirements

The development of the code can be done on any IDE but the following instructions will focus on Visual Studio Code.

Those instructions are taken from the official [Flutter installation documentation](https://docs.flutter.dev/get-started/install).

<details>
<summary>Flutter installation with VSCode</summary>

1. If you have not done so already, download [Git](https://git-scm.com/downloads).
2. First, ensure your VSCode is up to date. Then install the [Flutter extension](vscode:extension/Dart-Code.flutter).
3. Then open the Command Palette (Ctrl/⌘+Shift+P), run `Flutter: New Project`, and click on the **Download SDK** button.
4. Select a path that does not contain spaces or requires elevated privileges.
5. On Windows, once the installation is complete, you may click on **Add SDK to PATH** if you wish to.

To ensure the code works properly, please also install the Android emulator:

1. If you do not have it already, download [Android Studio](https://developer.android.com/studio).
2. On the welcome page, click on **More Options**, then **Virtual Device Manager**
3. On the new window, click on **Create virtual device**, select a device from the list, and hit **Next**
4. Select (and download) a system image and continue the setup to the end.
5. Back in VSCode, start debugging the program. This will show a list of available devices. Select the emulator you just created.

</details>

### Coding standards

Coding standards are available in our [contribution document](../../CONTRIBUTING.md).

## Testing
<!-- Type (unit, integration, ...) -->
<!-- Tools -->
<!-- Bug tracking -->

## Deployment
<!-- Only on Play Store for now, beta version -->
<!-- GH actions -->

### Maintenance and Support
<!-- Documentation and hand-over -->
<!-- Support handled by company -->

## Glossary
<!-- TODO -->