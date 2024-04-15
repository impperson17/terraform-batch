resource "aws_iam_user" "lb" {
  name = var.name
}

variable name {
    default = ""
    type = string
}
