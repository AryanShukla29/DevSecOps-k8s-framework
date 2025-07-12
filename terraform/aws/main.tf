resource "aws_instance" "jenkins" {
  ami           = "ami-020cba7c55df1f615"  # Ubuntu 22.04 LTS (us-east-1)
  instance_type = "t2.micro"
  key_name      = var.key_name

  tags = {
    Name = "Jenkins-Server"
  }

  # (optional: add EBS size increase if needed)
  root_block_device {
    volume_size = 16
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y docker.io",
      "sudo usermod -aG docker ubuntu"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}
