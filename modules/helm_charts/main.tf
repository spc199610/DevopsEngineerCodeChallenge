resource "null_resource" "copy_charts" {
  for_each = { for chart in var.charts : chart.chart_name => chart }

  provisioner "local-exec" {
    command = <<EOT
      az acr import \
        --name ${var.acr_server} \
        --source ${var.source_acr_server}/${each.value.chart_name}:${each.value.chart_version} \
        --subscription ${var.acr_server_subscription} \
        --username ${var.source_acr_client_id} \
        --password ${var.source_acr_client_secret}
    EOT
  }

  triggers = {
    chart_version = each.value.chart_version
  }
}

resource "helm_release" "chart" {
  for_each = { for chart in var.charts : chart.chart_name => chart }

  depends_on      = [null_resource.copy_charts]
  name            = each.value.chart_name
  namespace       = each.value.chart_namespace
  chart           = "${var.acr_server}/${each.value.chart_name}"
  version         = each.value.chart_version
  repository      = each.value.chart_repository
  
  dynamic "set" {
    for_each = each.value.values
    content {
      name  = set.value.name
      value = set.value.value
    }
  }

  dynamic "set_sensitive" {
    for_each = each.value.sensitive_values
    content {
      name  = set_sensitive.value.name
      value = set_sensitive.value.value
    }
  }
}
