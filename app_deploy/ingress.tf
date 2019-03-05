resource "null_resource" "ingress" {
  provisioner "local-exec" {
    command = "kubectl apply -f ingress-template.yaml"
  }

  provisioner "local-exec" {
    command = "kubectl delete -f ingress-template.yaml"
    when    = "destroy"
  }
}