


resource "aws_instance" "web-server" {
    ami                 = "ami-06489866022e12a14"
    instance_type       = "t2.micro"
    count               = 1
    key_name            = "terraform"
    security_groups     = ["${aws_security_group.web-server.name}"]
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
    Name = "web-server"
    }
}

