# Define the provider
provider "aws" {
  region = "us-east-1" # Specify your preferred region
}

# Define the key pair
resource "aws_key_pair" "key" {
  key_name   = "minikube-key"
  public_key = file("~/.ssh/id_rsa.pub") # Path to your public SSH key
}
# Define the security group
resource "aws_security_group" "minikube_sg" {
  name        = "minikube-sg"
  description = "Allow SSH and Minikube traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30000
    to_port     = 32767
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

# Define the EC2 instance
resource "aws_instance" "minikube" {
  ami           = "ami-0dba2cb6798deb6d8" # Ubuntu 22.04 LTS AMI (update for your region)
  instance_type = "t2.medium" # Adjust as needed
  key_name      = aws_key_pair.key.key_name
  security_groups = [aws_security_group.minikube_sg.name]

  root_block_device {    volume_size = 30
    volume_type = "gp2"
  }

  tags = {
    Name = "minikube-instance"
  }

  user_data = <<-EOF
    #!/bin/bash
    # Update system
    apt-get update -y && apt-get upgrade -y

    # Install Minikube dependencies
    apt-get install -y curl wget apt-transport-https gnupg

    # Install Docker
    apt-get install -y docker.io
    systemctl start docker
    systemctl enable docker

    # Install kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    mv kubectl /usr/local/bin/

    # Install Minikube
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    chmod +x minikube
    mv minikube /usr/local/bin/

    # Start Minikube
    minikube start --driver=docker --kubernetes-version=v1.26.3
  EOF
}

# Output the instance public IP
output "instance_public_ip" {
  value = aws_instance.minikube.public_ip
}
