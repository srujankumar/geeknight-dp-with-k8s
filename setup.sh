#!/bin/bash

# Create terraform admin project
TF_ADMIN_PROJECT = "geeknight-hyd-terraform-admin"

gcloud projects create ${TF_ADMIN_PROJECT} \
  --set-as-default

gcloud beta billing projects link ${TF_ADMIN_PROJECT} \
  --billing-account $(gcloud beta billing accounts list)

# Create terraform service account
TF_CREDS=~/.config/gcloud/geeknight-hyd-terraform-admin.json

gcloud iam service-accounts create terraform \
  --display-name "Terraform admin account"

gcloud iam service-accounts keys create ${TF_CREDS} \
  --iam-account terraform@${TF_ADMIN_PROJECT}.iam.gserviceaccount.com

# Grant permissions to terraform service account
gcloud projects add-iam-policy-binding ${TF_ADMIN_PROJECT} \
  --member serviceAccount:terraform@${TF_ADMIN_PROJECT}.iam.gserviceaccount.com \
  --role roles/viewer

gcloud projects add-iam-policy-binding ${TF_ADMIN_PROJECT} \
  --member serviceAccount:terraform@${TF_ADMIN_PROJECT}.iam.gserviceaccount.com \
  --role roles/storage.admin

# Enable Google cloud APIs
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable cloudbilling.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable compute.googleapis.com
