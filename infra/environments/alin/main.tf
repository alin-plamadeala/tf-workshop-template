provider "google" {
  project = var.project
  region  = var.region
}

module "cloud_run" {
  source  = "GoogleCloudPlatform/cloud-run/google"
  version = "~> 0.2.0"

  service_name           = "my-api-service-2"
  project_id             = var.project
  location               = var.region
  image                  = "gcr.io/cloudrun/hello"
  members = [ "allUsers" ]
}