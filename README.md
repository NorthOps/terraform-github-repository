# terraform-github-repository

Terraform module to manage GitHub repositories

## Requirements

No requirements.

## Providers

| Name   | Version |
| ------ | ------- |
| github | n/a     |

## Inputs

| Name                               | Description                                                                                                                              | Type     | Default                    | Required |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | -------- | -------------------------- | :------: |
| admin\_team                        | Team ID that administers the repository                                                                                                  | `string` | n/a                        |   yes    |
| admin\_team\_only                  | (optional) Disable developer team for this repository                                                                                    | `bool`   | `false`                    |    no    |
| archived                           | (optional) Archives the repository if set to true                                                                                        | `bool`   | `false`                    |    no    |
| auto\_init                         | (optional) Meaningful only during create, set to true to produce an initial commit in the repository                                     | `bool`   | `true`                     |    no    |
| branch\_protection\_enabled        | (optional) Control branch protection for the defaault branch                                                                             | `bool`   | `true`                     |    no    |
| default\_branch\_name              | (optional) Default branch name and the branch name with protection applied to it                                                         | `string` | `"main"`                   |    no    |
| delete\_branch\_on\_merge          | (optional) Automatically delete head branch after a pull request is merged                                                               | `bool`   | `true`                     |    no    |
| description                        | (optional) Repository description. Leave blank for default of: Development repository                                                    | `string` | `"Development repository"` |    no    |
| developer\_team                    | (optional) Team ID that developers belong to                                                                                             | `string` | `""`                       |    no    |
| dismiss\_stale\_reviews            | (optional) Dismiss approved reviews automatically when a new commit is pushed                                                            | `bool`   | `true`                     |    no    |
| enforce\_admins                    | (optional) Enforce status checks for repository administrators                                                                           | `bool`   | `true`                     |    no    |
| has\_downloads                     | (optional) Enables GitHub issues                                                                                                         | `bool`   | `false`                    |    no    |
| has\_issues                        | (optional) Enables GitHub issues                                                                                                         | `bool`   | `false`                    |    no    |
| has\_projects                      | (optional) Enables GitHub projects                                                                                                       | `bool`   | `false`                    |    no    |
| has\_wiki                          | (optional) Enables GitHub wiki                                                                                                           | `bool`   | `false`                    |    no    |
| homepage\_url                      | (optional) Home page URL for the Git repo                                                                                                | `string` | `""`                       |    no    |
| name                               | Name of the repository                                                                                                                   | `string` | n/a                        |   yes    |
| require\_ci\_pass                  | (optional) Require all CI checks listed in status\_checks to pass                                                                        | `bool`   | `true`                     |    no    |
| require\_code\_owner\_reviews      | (optional) Require an approved review in pull requests including files with a designated code owner                                      | `bool`   | `false`                    |    no    |
| required\_approving\_review\_count | (optional) Require x number of approvals to satisfy branch protection requirements. If this is specified it must be a number between 1-6 | `number` | `1`                        |    no    |
| status\_checks                     | (optional) A list of required passing CI checks                                                                                          | `list`   | `[]`                       |    no    |
| visibility                         | (optional) Visibility of the repository. Can be public, private or internal                                                              | `string` | `"public"`                 |    no    |

## Outputs

| Name                     | Description               |
| ------------------------ | ------------------------- |
| github\_team\_repository | Admin team access resorce |
| repository               | Respository resource      |
