provider "aws {
access_key = ""
secret_key = ""
region = "ap-southeast-1"
}

resource "aws_instance" "cicdvm" {
ami = "ami-04613ff1fdcd2eab1"
instance_type = "t2.medium"
root_block_device{
volume_size = "100"
}
provisioner "remote-exec" {
    inline = [
        "sudo wget -Nnv https://raw.githubusercontent.com/officialabhradip/terraform-elk-aws/master/elk.sh && bash elk.sh"
        "sleep 10"
    ]
  }
  
}
