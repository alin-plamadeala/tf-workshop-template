terraform {
  backend "gcs" {
    bucket = "computas-terraform-workshop"
    prefix = "terraform/env/alin"
  }
}
