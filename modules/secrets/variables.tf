variable "secrets" {
  type = map(object({
    name = string
    secret_string = string
  }))
  description = "A map of secrets to create"
}