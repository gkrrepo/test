

data "aws_caller_identity" "source" { ## Creating Caller identity and Providing the provider 
  provider = aws.source
}



data "aws_iam_policy_document" "assume_role" {  ## Creating Policy documents for STS
  provider = aws.destination
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
      "sts:SetSourceIdentity"
    ]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.source.account_id}:root"]
    }
  }
}

resource "aws_iam_role" "assume_role" {  ## Creating and Integrating the policy with the role
  provider            = aws.destination
  name                = "assume_role"
  assume_role_policy  = data.aws_iam_policy_document.assume_role.json
  managed_policy_arns = [data.aws_iam_policy.ec2.arn]
  tags                = {}
}


