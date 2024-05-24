terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.79.0"
    }
  }
}

provider "yandex" {
  token     = "Your_token"
  cloud_id  = "Your_cloud_id"
  folder_id = "Your_folder_id"
  zone      = "Your_zone"
}
