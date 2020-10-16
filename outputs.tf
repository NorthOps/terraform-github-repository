output "repository" {
  value       = github_repository.repository
  description = "Respository resource"
}

output "github_team_repository" {
  value = github_team_repository.admin_team_access
  description = "Admin team access resorce"
}
