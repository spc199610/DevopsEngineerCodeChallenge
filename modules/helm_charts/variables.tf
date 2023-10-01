variable "acr_server" {
  description = "The Azure Container Registry where Helm charts should be deployed."
  type        = string
}

variable "acr_server_subscription" {
  description = "Azure Subscription ID for the instance ACR."
  type        = string
}

variable "source_acr_client_id" {
  description = "Client ID for authenticating to the source ACR."
  type        = string
}

variable "source_acr_client_secret" {
  description = "Client Secret for authenticating to the source ACR."
  type        = string
}

variable "source_acr_server" {
  description = "The Azure Container Registry from where Helm charts should be imported."
  type        = string
}

variable "charts" {
  description = "List of Helm charts to deploy."
  type        = list(object({
    chart_name       = string
    chart_namespace  = string
    chart_repository = string
    chart_version    = string
    values           = list(object({
      name  = string
      value = string
    }))
    sensitive_values = list(object({
      name  = string
      value = string
    }))
  }))
}
