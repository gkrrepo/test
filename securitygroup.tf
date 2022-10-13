resource "aws_security_group" "web-server" {
        vpc_id = "vpc-03cd299bd746c752f"
        name = "web-server"
        description = "Allow incoming HTTP"

        ingress {
           from_port   = 80
           to_port     = 80
           protocol    = "tcp"
           cidr_blocks = ["0.0.0.0/0"]
        }


        egress {
           from_port   = 0
           to_port     = 0
           protocol    = "-1"
           cidr_blocks = ["0.0.0.0/0"]
        }
}
