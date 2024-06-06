# Contribution guidelines

This document contains guidelines to work on this project and should be followed as closely as possible.
If you have any questions or remarks regarding them, please open an issue.

> [!IMPORTANT]
> Please be wary that changes may be made to those guidelines if deemed necessary.

**Table of Content**
- [Bug reports and feature requests (issues)](#bug-reports-and-feature-requests-issues)
- [Pull requests](#pull-requests)
- [Files](#files)
  - [Layout](#layout)
- [Branches](#branches)
  - [Persistent branches](#persistent-branches)
- [Code style](#code-style)

## Bug reports and feature requests (issues)

Ensure the bug was not already reported.
If you are unable to find an open issue addressing the problem, open a new one using the appropriate template.

The title should be explicit yet concise enough to know at first glance what the issue is about. \
Example: `Crash on login with invalid email` \
We also encourage the use of tags to better categorize the issue.

If you are using a template, please follow its structure and any recommendations that may be specific to it.

The content of the issue should be as descriptive as possible, with code snippets and/or screenshots to give a better understanding.
It is also heavily recommended to read [those guidelines](https://how-to-question.com/) beforehand (even if they do not completely relate to your issue).

## Pull requests

Please use a title starting with a verb in the imperative present tense.

If your commit is linked to a pull request or an issue, please mention it as specified in [GitHub's documentation](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue).

For code changes, please update the documentation to reflect those.

<!-- TODO: Tests and builds -->

## Files

Use lowercase names, possibly spaced by underscores (snake_case). \
Example: `path/to/my_file.md`

### Layout

- `.github/`
  - `ISSUE_TEMPLATE/bug_report.md`
  - `workflows/`
    - `test.yml`
    - `deploy.yml`
- `docs/`
  - `images/`
  - `management/`
  - `qa/`
  - `specs/`
    - `functional.md`
    - `technical.md`
  - `README.md` (table of contents)
- `src/`
  - `lib/`
    - `models/`
    - `providers/`
    - `widgets/`
    - `main.dart`
  - `test/`
    - `unit/`
    - `integration/`
  - (other usual Dart files)
  - `.gitignore`

## Branches

Use lowercase names, spaced by hyphens (kebab-case). \
Example: `feature-ui-matchmaking-skill-list`

When merging a branch, it is heavily recommended to do the merge the other way first and resolve any conflicts locally.
This avoids having to resolve conflicts afterward.

### Persistent branches

- `main`
  - Stable branch
  - Should be merged to at least once a day
  - Only accepts merges from other branches

- `dev`
  - Unstable code branch
  - Should be committed to each time a feature is partially complete, even if unfinished
  - Committed to it directly is discouraged
  - Merging to `main`

- `docs`
  - Documents branch
  - Can be committed to for typos, merged to for bigger changes
  - Merging to `main`

## Code style

Read and follow the conventions for [Dart](https://dart.dev/effective-dart/style).

Here is a summary:
- Classes and type definitions should be written in `PascalCase`.
- Variables, parameters, and members should be in `camelCase`.
- Do not use prefixes (also known as [Hungarian notation](https://en.wikipedia.org/wiki/Hungarian_notation)).
- Use `import 'dart:...'` for global packages and `import 'package:...'` for local ones.
- It is recommended to format the code often (activate the auto-formatting on save).