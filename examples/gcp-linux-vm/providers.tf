provider "google" {
  credentials = file("/home/kjbleckm/code/intel-csa-resource-gcp.json")
  project     = "intel-csa-resource-gcp"
  region      = "us-central1"
  zone    = "us-central1-b"
}