terraform{
    backend "s3" {
        bucket = "demo-aws-cicd-pipeline100"
        encrypt = true
        key = "terraform.tfstate"
        region = "eu-west-1"
    }
}

provider "aws" {
    region = "eu-west-1"
}