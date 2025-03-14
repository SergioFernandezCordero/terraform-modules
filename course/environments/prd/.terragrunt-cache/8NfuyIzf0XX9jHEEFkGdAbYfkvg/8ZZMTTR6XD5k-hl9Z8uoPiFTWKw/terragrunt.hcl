terraform {
  source = "../../shared"
}
inputs = {
  environ = "PRD"
  content = "Hello from PRD, Terragrunt!"
  nombre = "mengano"
}