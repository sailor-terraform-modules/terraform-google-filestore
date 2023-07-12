resource "google_project_service" "filestoreapi" {
  project = var.project_id
  service = "file.googleapis.com"
}
resource "google_filestore_instance" "instance" {
  depends_on = [google_project_service.filestoreapi]
  name       = var.name
  zone       = var.zone
  tier       = var.tier
  project    = var.project_id
  file_shares {
    capacity_gb = var.capacity_gb
    name        = var.file_shares_name
  }
  networks {
    network           = var.network
    modes             = var.modes
    reserved_ip_range = var.reserved_ip_range
  }
}