# #lambda function python for aws
# resource "aws_lambda_function" "projectA-lambda" {
#     filename = "lambda.zip"
#     function_name = "projectA-lambda"
#     role = "${aws_iam_role.projectA-lambda-role.arn}"
#     handler = "lambda_function.lambda_handler"
#     source_code_hash = "${base64sha256(file("lambda.zip"))}"
#     runtime = "python3.6"
#     timeout = "60"
#     memory_size = "128"
#     publish = true
#     vpc_config {
#         subnet_ids = ["${aws_subnet.projectA-private-subnet.id}"]
#         security_group_ids = ["${aws_security_group.projectA-sg.id}"]
#     }
#     tags = {
#         Name = "projectA-lambda"
#     }
# }