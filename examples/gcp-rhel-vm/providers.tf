provider "google" {
  zone        = "us-east1-b"
  region      = "us-east1"
  project     = "intel-csa-resource-gcp"
  credentials = file("intel-csa-resource-gcp-4f110abc317a.json")
}