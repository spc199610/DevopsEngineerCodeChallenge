module "chart" {
  source                   = "./modules/helm_charts"
  acr_server               = var.acr_server
  acr_server_subscription  = var.acr_server_subscription
  source_acr_client_id     = var.source_acr_client_id
  source_acr_client_secret = var.source_acr_client_secret
  source_acr_server        = var.source_acr_server

  charts = var.charts
}
