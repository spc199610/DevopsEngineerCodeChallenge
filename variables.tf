variable "acr_server" {
  description = "The server of the Azure Container Registry instance."
  type        = string
}

variable "acr_server_subscription" {
  description = "The Azure subscription ID for the ACR instance."
  type        = string
}

variable "source_acr_client_id" {
  description = "The client ID for the source ACR."
  type        = string
}

variable "source_acr_client_secret" {
  description = "The client secret for the source ACR."
  type        = string
  sensitive   = true # This marks the variable as sensitive.
}

variable "source_acr_server" {
  description = "The server name of the source Azure Container Registry."
  type        = string
}

variable "charts" {
  description = "List of Helm charts to be deployed."
  type = list(object({
    chart_name       = string
    chart_namespace  = string
    chart_repository = string
    chart_version    = string
    values = list(object({
      name  = string
      value = string
    }))
    sensitive_values = list(object({
      name  = string
      value = string
    }))
  }))
}
