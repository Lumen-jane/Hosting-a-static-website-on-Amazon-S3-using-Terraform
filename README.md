# Hosting-a-static-website-on-Amazon-S3-using-Terraform
This project demonstrates how to set up a static website using Amazon S3 with Terraform. 


This project demonstrates how to set up a static website using Amazon S3 with Terraform. 

It includes the creation of an S3 bucket configured for website hosting and the uploading of static HTML files to serve as the website content. 

PROJECT STRUCTURE:

- main.tf: Contains the main Terraform configuration for creating the S3 bucket and S3 objects.
- variables.tf: Defines the variables used in the Terraform configuration.
- output.tf: Defines the outputs to retrieve the website URL and domain.
- index.html: The main HTML file for the website.
- error.html: The error page displayed when a requested resource is not found.
- provider.tf: Contains the AWS provider configuration for Terraform.


Prerequisites:

1. Ensure Terraform is installed on your machine. 
2. An AWS account with sufficient permissions to create S3 buckets and upload objects.

 Configuration:

1. Clone the Repository:
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. Configure AWS Credentials:
   Ensure your AWS credentials are set up. You can use the AWS CLI to configure them:
   ```bash
   aws configure
   ```

3. Initialize Terraform:
   Run the following command to initialize the Terraform configuration:
   ```bash
   terraform init
   ```

4. Apply the Configuration:
   Apply the Terraform configuration to create the S3 bucket and upload the website files:
   ```bash
   terraform apply
   ```
   Review the changes and type `yes` to proceed with the creation.


 OUTPUTS:

After applying the configuration, Terraform will output the following information:

- website_url: The regional domain name of the S3 bucket where the website is hosted.

These outputs can be used to access your static website.


 USAGE:

Once the Terraform apply is complete, you can access your website using the URL provided by the `website_url` output. You can view the `index.html` file at this URL, and if an error occurs (e.g., a 404 error), the `error.html` page will be displayed.



 CONTRIBUTIONS:

Feel free to fork the repository and submit pull requests. Contributions are welcome!

