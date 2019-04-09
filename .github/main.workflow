action "check master" {
  uses    = "docker://codesuki/check-master-action:latest"
  args    = ["--path", "terraform/(.+)/"]
  secrets = ["GITHUB_TOKEN"]
}

workflow "Master Change" {
  on       = "push"
  resolves = ["check master"]
}

workflow "New PR" {
  on       = "pull_request"
  resolves = ["check master"]
}
