resource "kubernetes_pod" "ghost_alpine" {
  metadata {
    name = "ghost-alpine"
  }

  spec {
    host_network = "true"
    container {
      image        = "ghost:alpine"
      name         = "ghost-alpine"
    }
  }
}