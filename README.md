# tf-workshop-template exercise
## Create the terraform configuration for a GCP Cloud Run instance with public traffic allowed.
You can use this sample docker image:
`gcr.io/cloudrun/hello`

###Note:
* A CI pipeline has been setup on TODO repo. 
  * Create a branch with your first name as a name and create a PR to main. 
  * Everytime you push to this branch the terraform configuration will be applied.
  * Append your name to unique resources identifiers (service account, cloud run service, etc) so there is no conflict if multiple people create the same resources
* Copy the directory ./infra/environments/alin to ./infra/environments/<your_name>
  * Update the prefix property in ./infra/environments/<your_name>/backend.tf
  * Update the environment property in ./infra/environments/<your_name>/terraform.tfvars
