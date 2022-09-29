resource "aws_instance" "web" {
  ami                    = "ami-0fb391cce7a602d1f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [resource.aws_security_group.nginx-server-sg.id] #aws_security_group.nginx-server-sg.id]

  user_data = <<EOF
#!/bin/bash
apt update
apt-get install nginx -y
EOF

  tags = {
    Name = "HelloWorld"
  }
}
