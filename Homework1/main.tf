resource "aws_iam_user" "user" {
  name = "jenny"
}
resource "aws_iam_user" "user2" {
  name = "rose"
}
resource "aws_iam_user" "user3" {
  name = "lisa"
}
resource "aws_iam_user" "user4" {
  name = "jitsoo"
}
resource "aws_iam_user" "user5" {
  name = "jihyo"
}
resource "aws_iam_user" "user6" {
  name = "sana"
}
resource "aws_iam_user" "user7" {
  name = "momo"
}
resource "aws_iam_user" "user8" {
  name = "dahyun"
}

resource "aws_iam_group" "blackpink" {
  name = "blackpink"
}
resource "aws_iam_group" "twice" {
  name = "twice"
}
resource "aws_iam_group_membership" "blackpink" {
  name = "blackpink"

  users = [
    aws_iam_user.user.name,
    aws_iam_user.user2.name,
    aws_iam_user.user3.name,
    aws_iam_user.user4.name,
    aws_iam_user.user9.name,
  ]

  group = aws_iam_group.blackpink.name
}
resource "aws_iam_group_membership" "twice" {
  name = "twice"

  users = [
    aws_iam_user.user5.name,
    aws_iam_user.user6.name,
    aws_iam_user.user7.name,
    aws_iam_user.user8.name,
    aws_iam_user.user10.name,
  ]

  group = aws_iam_group.twice.name
}

resource "aws_iam_user" "user9" {
  name = "miyeon"
}
resource "aws_iam_user" "user10" {
  name = "mina"
}

