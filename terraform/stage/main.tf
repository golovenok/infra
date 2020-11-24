provider "google" {
  version = "3.0.0"
  project = var.project
  region  = var.region
}

module "app" {
  source = "../modules/app"
  zone = var.zone
  public_key_path = var.public_key_path
  app_disk_image = var.app_disk_image
  user = var.user_name
}

module "db" {
  source = "../modules/db"
  zone = var.zone
  public_key_path = var.public_key_path
  db_disk_image = var.db_disk_image
  user = var.user_name
}

module "vcp" {
  source = "../modules/vcp"
  source_ranges = ["0.0.0.0/0"]
}
# terraform taint "module.vcp.google_compute_firewall.firewall_ssh"
