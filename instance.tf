provider "aws"{
        region = "us-east-1"
    }


resource "aws_instance" "web-server" {
    ami                 = "ami-0636eac5d73e0e5d7"
    instance_type       = "t2.micro"
    subnets             = "subnet-0c40bf030effcd2e5"
    count               = 1
    key_name            = "terraform"
    security_groups     = ["sg-0280840b0426ff6ef"]
    user_data = <<-EOF

        #!/bin/bash
        sudo su
        yum update -y
        yum install httpd -y
        systemctl start httpd
        systemctl enable httpd
        echo "<html><h1>Hello World</p></h1>
        EOF
    tags = {
    Name = "web-server-terraform"
    }
}
