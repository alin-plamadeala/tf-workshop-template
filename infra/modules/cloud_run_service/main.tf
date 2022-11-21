resource "google_service_account" "api" {
  account_id   = "my-service-api"
  display_name = "my-service API Service Account"
}

resource "google_cloud_run_service" "api" {
  name     = "my-service"
  location = var.region

  template {
    spec {
      service_account_name = google_service_account.api.email
      containers {
        image = "europe-west3-docker.pkg.dev/sharkcell-dwh-suite-temp/terraform-workshop/sample-app:1"
        resources {
          limits = {
            cpu    = "1000m"
            memory = "2048Mi"
          }
        }
      }
    }
  }
  metadata {
    annotations = {
      "run.googleapis.com/ingress" = "all"
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}

data "google_iam_policy" "auth_policy" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "auth_policy" {
  location = google_cloud_run_service.api.location
  project  = google_cloud_run_service.api.project
  service  = google_cloud_run_service.api.name

  policy_data = data.google_iam_policy.auth_policy.policy_data
}