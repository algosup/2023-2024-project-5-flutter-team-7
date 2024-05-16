<!--
Temporary notes:

Might need to be more concise and remove some information.

https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/setting-guidelines-for-repository-contributors
https://github.com/rails/rails/blob/main/CONTRIBUTING.md
https://github.com/opengovernment/opengovernment/blob/master/CONTRIBUTING.md
-->



## Files
Lowercase, eventually spaced by underscores (snake_case) \
Example: `path/to/my_file.md`

### Layout
- `docs`
  - `images`
  - `management`
  - `qa`
  - `specs`
    - `functional.md`
    - `technical.md`
  - `README.md` (table of contents)
- `src`
  - TBD
- `test`
  - TBD

## Branches
Lowercase, spaced by hyphens (kebab-case) \
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

## Commits and pull requests

TODO

## Issues

TODO