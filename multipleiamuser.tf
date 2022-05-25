# resource "aws_iam_user" "tfudemyiamusers" {

#   for_each = toset (["Jack","Ryan","Mike","Tom"])
#   aws_iam_user = ${each.key.}
# }