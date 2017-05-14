provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "marvin" {
  ami           = "ami-efd0428f"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags {
    Name = "hubot"
  }

  provisioner "file" {
    source = "./ec2_bootstrap.sh"
    destination = "/tmp/ec2_bootstrap.sh"
    connection {
      user = "ubuntu"
    }
}

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/ec2_bootstrap.sh",
      "/tmp/ec2_bootstrap.sh }",
    ]
    connection {
      user = "ubuntu"
    }
  }

  provisioner "file" {
    source = "./run_marvin.sh"
    destination = "/home/ubuntu/run_marvin.sh"
    connection {
      user = "ubuntu"
    }
}

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/run_marvin.sh",
      "/home/ubuntu/run_marvin.sh ${var.slack_token} ${var.marvin_version}",
    ]
    connection {
      user = "ubuntu"
    }
  }
}

