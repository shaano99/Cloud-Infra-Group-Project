Create Ec2 Instance and s3 bucket using Terraform in visual studio code. 

Configure necessary permissions in the ec2 instance using cli.

Create a github repository and configure repository secrets required for the yml file.

Push necessary files (wordpress files, terraform file, yml (github workflow) file) to GitHub repository using visual studio code terminal by using git commands.

The yml file get activated and push the wordpress files to the ec2 instance except terraform file as we ignore terraform files in our .gitignore file.

After pushing our wordpress files to ec2 instance using yml, then copy those files to the s3 bucket using the cli.

public ip address = 54.169.254.127
