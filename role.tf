resource "aws_iam_role" "ec2-role-cloudwatch" {
  name               = "ec2-role-cloudwatch"
  description        = "Allows EC2 instances to call AWS services on your behalf."
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
}
EOF

  tags = {

    sysops = "administrator"
  }
}

resource "aws_iam_role_policy_attachment" "ec2-role-cloudwatch-CloudWatchAgentAdminPolicy" {
  role       = aws_iam_role.ec2-role-cloudwatch.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentAdminPolicy"
}

resource "aws_iam_role_policy_attachment" "ec2-role-cloudwatch-CloudWatchAgentServerPolicy" {
  role       = aws_iam_role.ec2-role-cloudwatch.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "ec2-role-cloudwatch-CloudWatchFullAccess" {
  role       = aws_iam_role.ec2-role-cloudwatch.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}