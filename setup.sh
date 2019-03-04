#!/bin/bash

# Create project
PROJECT="geeknight-hyd-demo"

gcloud projects create ${PROJECT} \
  --set-as-default

gcloud beta billing projects link ${PROJECT} \
  --billing-account $(gcloud beta billing accounts list | awk 'FNR == 2 {print $1}')

# Create terraform service account
TF_CREDS=~/.config/gcloud/${PROJECT}.json

gcloud iam service-accounts create terraform \
  --display-name "Terraform admin account"

gcloud iam service-accounts keys create ${TF_CREDS} \
  --iam-account terraform@${PROJECT}.iam.gserviceaccount.com

# Grant permissions to terraform service account
gcloud projects add-iam-policy-binding ${PROJECT} \
  --member serviceAccount:terraform@${PROJECT}.iam.gserviceaccount.com \
  --role roles/editor

gcloud projects add-iam-policy-binding ${PROJECT} \
  --member serviceAccount:terraform@${PROJECT}.iam.gserviceaccount.com \
  --role roles/storage.admin

# Enable Google cloud APIs
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable cloudbilling.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com

# Create GCS for terraform remote state and enable versioning
gsutil mb -p ${PROJECT} gs://${PROJECT}
gsutil versioning set on gs://${PROJECT}
