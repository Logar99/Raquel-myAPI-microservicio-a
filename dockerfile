resource "aws_iam_user" "usr_mark"  {
    name = "mark@email.com"
}

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = ">= 2.16.0"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "microservice" {
  name   = "microservice"
  build {
    path = "../microservice/."
    tag  = [
      "microservice:latest"
      ]
  }
}
