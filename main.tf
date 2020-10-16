resource "github_repository" "repository" {
  name         = var.name
  description  = "${var.description}"
  homepage_url = var.homepage_url

  visibility             = var.visibility
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = var.delete_branch_on_merge
  has_downloads          = var.has_downloads
  auto_init              = var.auto_init
  archived               = var.archived
  default_branch         = var.default_branch_name
}

resource "github_branch_protection" "repository_master" {
  count          = var.branch_protection_enabled == true ? 1 : 0
  repository     = var.name
  branch         = var.default_branch_name
  enforce_admins = var.enforce_admins

  required_status_checks {
    strict   = var.require_ci_pass
    contexts = var.status_checks
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = var.dismiss_stale_reviews
    require_code_owner_reviews      = var.require_code_owner_reviews
    required_approving_review_count = var.required_approving_review_count
  }

  depends_on = [github_repository.repository]
}

resource "github_team_repository" "admin_team_access" {
  team_id    = var.admin_team
  repository = github_repository.repository.name
  permission = "admin"
}

resource "github_team_repository" "developer_access" {
  count      = var.admin_team_only ? 0 : 1
  team_id    = var.developer_team
  repository = github_repository.repository.name
  permission = "push"
}
