# AUTOMATE THE DEPLOYMENT OF A REACT APP WITH PACKER, ANSIBLE, AND TERRAFORM
A simple program to deploy a react app to AWS using Ansible and packer.

# Introduction
This README contains an overview of what the code in the repository does. I lists the tools used and provides links on how to set them up. It lists other dependencies that are not present in the repositor that are necessary for the code to run correctly. It also provides a step by step explaination for how to deploy the app to your AWS account.

# Tools and setup
- Packer is used to create an image using an aws ubuntu ami.
- Ansible is used to provision the image with our react project's code, setup reverse proxy and create a system service using systemd
- Nginx is used by Ansible to setup reverse proxy for the app.
- Terraform is used to create an EC2 instance, setup and setup a security group. It does this using the ami that has been created with packer and provisioned with ansible.


## Tools
- Packer - https://www.packer.io/
- Ansible - https://www.ansible.com/
- Terraform - https://www.terraform.io/
- Nginx - https://www.nginx.com/

## setup
### Clone the repository to your computer
	`git clone https://github.com/davidshare/packer-ansible-aws.git`
### Install Ansible
- Mac and Linux users: https://wiki.alpinelinux.org/wiki/Ansible
- Windows users: http://www.oznetnerd.com/installing-ansible-windows/

### Install Terraform
- https://www.vasos-koupparis.com/terraform-getting-started-install/

### Install Packer
- https://www.packer.io/intro/getting-started/install.html

### Create a free tier AWS account
- https://www.packer.io/intro/getting-started/install.html

### Create a keypair for a region on your AWS account you just created
- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html
- Download your keypair file and copy it to the terraform directory in the project
- Note: Your AWS ami and instances will be created in regions you specify, ensure to create your keypair in the region you want your instance and ami to be provisioned. Your keypair files are private to you and should not be shared with anyone you do not want to have access to your accounts instances.
- To know more about AWS regions, follow this link: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html

### Create and get your access keys on your AWS account you just created
- https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html
- note that your access keys are private and should not be exposed under any condition

### Add your access keys as environment variables
Create a `.env` file using the `env.sample` file as a template in the root directory
~~~
export AWS_ACCESS_KEY_ID=your_aws_access_key_id
export AWS_SECRET_ACCESS_KEY=your_aws_secret_key
~~~

### Change the region you want to provision your instance
-	Open the `packer_template.json` file in the packer directory. In the builders section, replace the value of the region with your own region

		 `"region": "eu-west-1"`
- Open the `terraform-variables.tf` file in the terraform directory. Change the default variable of the region to your own region.

			```
			variable "region" {
			default = "eu-west-1"
			}
			```

# Deployment
- Navigate to the root directory of your project using the terminal and run `bash start.sh`

# Viewing the deployed app
- open your aws ec2 console in the region your instance was provisioned.
- Go to instances and click on the instance that was just created
- Copy the public IP address, and visit it using your browser.
