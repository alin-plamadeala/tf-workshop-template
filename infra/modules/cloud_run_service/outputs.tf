output "url" {
  value = length(google_cloud_run_service.api) > 0 ? google_cloud_run_service.api.status.0.url : ""
}

output "api_service_account" {
  value = google_service_account.api.email
}
