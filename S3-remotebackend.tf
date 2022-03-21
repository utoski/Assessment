terraform {
    backend "S3" {
     bucket   = "obi-terraform-bucket"
     key      = "key/terraform.tfstate"
     region   = "eu-west-2"
    }
}
