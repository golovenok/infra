provider "google" {
  version = "3.0.0"
  project = var.project
  region  = var.region
}

module "app" {
  source = "../modules/app"
  public_key_path = var.public_key_path
  zone = var.zone 
  app_disk_image = var.app_disk_image
}


module "db" {
  source = "../modules/db"
  public_key_path = var.public_key_path
  zone = var.zone
  db_disk_image = var.db_disk_image
}

module "vcp" {
  source = "../modules/vcp"
  source_ranges = ["5.159.104.39"]
}
