provider "google" {
  zone        = "us-east1-b"
  region      = "us-east1"
  project     = "intel-csa-resource-gcp"
  credentials = file("C:/Users/kwischme/Downloads/intel-csa-resource-gcp-4f110abc317a.json")
}