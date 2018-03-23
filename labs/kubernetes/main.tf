# Deploy a kubernetes_pod resource for the ghost:alpine image.
# Use host_networking and give it a name in the metadata. 

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
