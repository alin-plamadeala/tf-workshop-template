provider "google" {
  project = var.project
  region  = var.region
}

module "cloud_run_service_demo" {
  source = "../../modules/cloud_run_service"
  region = var.region
}
