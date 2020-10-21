# Github Repository Settings
variable "name" {
  type        = string
  description = "Name of the repository"
}

variable "description" {
  type        = string
  default     = "Development repository"
  description = "(optional) Repository description. Leave blank for default of: Development repository"
}

variable "homepage_url" {
  default     = ""
  description = "(optional) Home page URL for the Git repo"
}

variable "visibility" {
  type        = string
  default     = "public"
  description = "(optional) Visibility of the repository. Can be public, private or internal"

  validation {
    condition     = contains(["public", "private", "internal"], var.visibility)
    error_message = "Must be one of public, private or internal."
  }
}

variable "has_issues" {
  type        = bool
  default     = false
  description = "(optional) Enables GitHub issues"
}

variable "has_downloads" {
  type        = bool
  default     = false
  description = "(optional) Enables GitHub issues"
}

variable "has_projects" {
  type        = bool
  default     = false
  description = "(optional) Enables GitHub projects"
}

variable "has_wiki" {
  type        = bool
  default     = false
  description = "(optional) Enables GitHub wiki"
}

variable "delete_branch_on_merge" {
  type        = bool
  default     = true
  description = "(optional) Automatically delete head branch after a pull request is merged"
}

variable "auto_init" {
  type        = bool
  default     = true
  description = "(optional) Meaningful only during create, set to true to produce an initial commit in the repository"
}

variable "archived" {
  type        = bool
  default     = false
  description = "(optional) Archives the repository if set to true"
}

# Github Branch Protection
variable "branch_protection_enabled" {
  type        = bool
  default     = true
  description = "(optional) Control branch protection for the defaault branch"
}

variable "enforce_admins" {
  type        = bool
  default     = true
  description = "(optional) Enforce status checks for repository administrators"
}

variable "require_ci_pass" {
  type        = bool
  default     = true
  description = "(optional) Require all CI checks listed in status_checks to pass"
}

variable "status_checks" {
  type        = list
  default     = []
  description = "(optional) A list of required passing CI checks"
}

# Pull Request Reviews
variable "dismiss_stale_reviews" {
  type        = bool
  default     = true
  description = "(optional) Dismiss approved reviews automatically when a new commit is pushed"
}

variable "require_code_owner_reviews" {
  type        = bool
  default     = false
  description = "(optional) Require an approved review in pull requests including files with a designated code owner"
}

variable "required_approving_review_count" {
  type        = number
  default     = 1
  description = "(optional) Require x number of approvals to satisfy branch protection requirements. If this is specified it must be a number between 1-6"
}

variable "default_branch_name" {
  type        = string
  description = "(optional) Default branch name and the branch name with protection applied to it"
  default     = "main"
}


variable "team_access" {
  type        = map
  description = "A map of access to the repository"
  default = {
    admin = {
      team_id = ""
      access  = "admin"
    }
  }
}
