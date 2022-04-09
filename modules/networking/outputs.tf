output "subnet" {
  value = "${aws_subnet.public.*.id}"
}

output "sg" {
  value = "${aws_security_group.sg.id}"
}

