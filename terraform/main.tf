provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "k3s_node" {
  ami           = "ami-00ca570c1b6d79f36"   # Amazon Linux 2023 (Mumbai)
  instance_type = "t3.micro"
  key_name      = "k3s-key"

  user_data = file("../scripts/install_k3s.sh")

  tags = {
    Name = "k3s-single-node"
  }
}

