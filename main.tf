resource "yandex_storage_bucket" "bucket" {
  access_key = "Your_access_key"
  secret_key = "Your_storage_key"

  bucket = "bucket_name"
  acl    = "public-read"

  default_storage_class = "standard"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "yandex_storage_object" "index" {
  access_key = yandex_storage_bucket.bucket.access_key
  secret_key = yandex_storage_bucket.bucket.secret_key
  bucket = yandex_storage_bucket.bucket.bucket
  key    = "index.html"
  source = "${path.module}/index.html"  # Ensure the path is correct relative to the Terraform configuration
  acl    = "public-read"
}

resource "yandex_storage_object" "error" {
  access_key = yandex_storage_bucket.bucket.access_key
  secret_key = yandex_storage_bucket.bucket.secret_key
  bucket = yandex_storage_bucket.bucket.bucket
  key    = "error.html"
  source = "${path.module}/error.html"  # Ensure the path is correct relative to the Terraform configuration
  acl    = "public-read"
}


resource "yandex_cdn_origin_group" "origin_group" {
  name = "Origin for cdn.abcd.com"
  folder_id = "Your_folder_id"

  origin {
    source = "${Your_bucket_name}.website.yandexcloud.net"
    enabled = true
  }
}


resource "yandex_cdn_resource" "cdn" {
  folder_id = "Your_folder_id"
  cname     = "cdn.${domain_name}"  #Present
  options {
    custom_host_header = "${Your_bucket_name}.website.yandexcloud.net"
  }
  origin_protocol     = "http"
  origin_group_id = yandex_cdn_origin_group.origin_group.id
}


output "bucket_name" {
  value = yandex_storage_bucket.bucket.bucket
}


output "cdn_cname" {
  value = yandex_cdn_resource.cdn.cname
}
