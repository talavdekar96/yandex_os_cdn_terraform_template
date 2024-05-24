# yandex_os_cdn_terraform_template
A Terraform template for creating a CDN with an Object storage for Yandex Cloud.


1. access_key, secret_key : You will get it from the Service account tab. Select the user that has the permission. If the user does not have any access_key or secret_key please create keys. A static key needs to be created. Copy the keys and paste it in their respective fields.
2. bucket : Bucket names can be given by the user according to their liking.
3. path.module : The files need to be 1st created then stored in the folder of the template for easy accessability.
4. folder_id : Will be the ID of the folder that you are currently in.
5. source : Source will be from where the cdn will bw able to access the website from.
6. cname : It should have the domain name in it. e.g: cdn.abcd.com
7. Once all this is done then the command for terraform needs to be ran in the terminal that has the credentials present on it.
8. The tereraform commands are as follows.
   1. Terraform init
   2. Terraform validate
   3. Terraform plan
   4. Terraform apply
   5. Terraform destroy (To delete all the resources created by the terraform)
  
9. Once the terraform template runs completely all the resources mentioned in the terraform template will be created.
10. Once this is done The cname and it's value (present in the cdn console) needs to be added in the domain's settings.
11. The CDN will take up to 15 minutes to be properly deployed.
12. Once all this is done the cname can be used to access the website.
