terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-barcode-cluster"
}

resource "kubernetes_deployment" "barcode" {
  metadata {
    name = "barcode-deployment"

    labels = {
      app = "barcode"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "barcode"
      }
    }

    template {
      metadata {
        labels = {
          app = "barcode"
        }
      }

      spec {
        container {
          name              = "barcode-container"
          image             = "barcode-generator:latest"
          image_pull_policy = "Never"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "barcode" {
  metadata {
    name = "barcode-service"
  }

  spec {
    selector = {
      app = "barcode"
    }

    type = "NodePort"

    port {
      port        = 80
      target_port = 80
      node_port   = 30080
    }
  }
}