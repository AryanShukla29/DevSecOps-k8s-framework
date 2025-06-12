provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "jenkins" {
    ami = "ami-uvvuvnnvnfv"
    instance_type="t2.micro"
    key_name =var.key_name

tags={
    Name="Jenkins-Server"
}

provisioner "remote-exec" {
    inline =[
        "sudo apt update",
        sudo apt install -y docker.io",
        "sudo usermodm -aG docker ubuntu"
    ]
    connection {
        type ="ssh"
        user ="ubuntu"
        private_key=file(var.private_key_path)
        host = self.public_ip
    }
}
}
