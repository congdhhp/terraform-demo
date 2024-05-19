# Specify the provider and access details

provider "aws" {
  
}

# Create an S3 bucket
resource "aws_s3_bucket" "udabucket" {
  bucket = "cicd-terraform-demo-bucket20213"

  tags = {
    Name        = "CICD test bucket"
    Environment = "Dev"
  }
}

# Create an EC2 instance
resource "aws_instance" "ec2_instance" {
  ami           = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"

  tags = {
    Name = "CICD test instance"
  }
}

# Output for S3 bucket
output "bucket_name" {
  value = aws_s3_bucket.udabucket.bucket
  description = "The name of the bucket"
}

# Output for EC2 instance ID
output "instance_id" {
  value = aws_instance.ec2_instance.id
  description = "The ID of the EC2 instance"
}

# Placeholder outputs for Blue/Green deployment status
# These need to be adapted based on your actual deployment strategy
output "blue_status" {
  value = "live"  # This should reflect the actual condition or state from your infrastructure
}

output "green_status" {
  value = "inactive"  # This should reflect the actual condition or state from your infrastructure
}
