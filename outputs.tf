output "subnet" {
  value = "${join(", ", module.networking.subnet)}"
}

output "instance_count" {
  value = var.instance_count
}