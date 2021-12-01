

resource "aws_instance" "web_server" {
    ami = "ami-0279c3b3186e54acd"
    instance_type = "t2.micro"
    subnet_id = var.public_subnet[1]
    key_name = "demo"
    security_groups = [var.security_groups]

    user_data = <<-EOF
        sudo apt-get update

        sudo apt-get install -y\
             apt-transport-https \
             ca-certificates \
             curl \
             software-properties-common

         curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

         sudo add-apt-repository \
           "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
            $(lsb_release -cs) \
            stable"

        sudo apt-get update
        sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    
    EOF
    
    tags = {
        Name = "web_server"
    }
}


