# Create a key

resource "aws_key_pair" "Bastion-key" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Create 2 s3 buckets 

resource "aws_s3_bucket" "kaizen-chyngyz" {
  bucket = "kaizen-chyngyz"
}
resource "aws_s3_bucket" "kaizen-" {
  bucket_prefix = "kaizen-"
}
# Create manually two more buckets (with any names)

resource "aws_s3_bucket" "kaizen-chyngyz17" {
  bucket_prefix = "kaizen-chyngyz17"
}
resource "aws_s3_bucket" "kaizen-chyngyz33" {
  bucket_prefix = "kaizen-chyngyz33"
}

resource "aws_iam_user" "user" {
  for_each = toset (["jenny", "rose", "lisa", "jisoo"]) 
  name = each.key 
}

resource "aws_iam_group" "team" {
  name = "blackpink"
}

resource "aws_iam_group_membership" "team" {
  name = "blackpink"

  users = [
 for i in aws_iam_user.user : i.name
  ]
  group = aws_iam_group.team.name
}

