resource "aws_instance" "web-server" {
    ami                 = "ami-06489866022e12a14"
    subnet_id           = "subnet-0c40bf030effcd2e5"
    instance_type       = "t2.micro"
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
    Name = "web-servesr"
    }
}

