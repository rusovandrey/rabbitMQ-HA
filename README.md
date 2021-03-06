# How to use
## Create nodes with Terraform

Create the following ENV variables:


    TF_VAR_sel_token
    TF_VAR_selectel_account
    TF_VAR_project_id
    TF_VAR_user_name
    TF_VAR_user_password

Change current directory to `terraform/`:

    cd terraform

Run `terraform init` to initialize and download terraform providers.
Run `terraform plan` to check that you are able to connect and to review the changes that will be done.
Run `terraform apply` to create the environments

## Configure HAproxy and RabbitMQ cluster with Ansible

Change current directory to `ansible/`:

    cd ../ansible


Copy IP addresses from terraform's output and paste them to `hosts.ini` inventory file accordingly.

Some password are encrypted usin Ansible vault, so to be ready to use these playbooks you have to replace some variables. You can ecnrypt your own password using the commands:


    ansible-vault encrypt_string '<your_password>' --name 'rmq_password'
    ansible-vault encrypt_string '<your_password>' --name 'hap_password'

Provide the vault password, copy the output and paste it to `rabbitmq.yml` and `haproxy.yml` accordingly.

Run the playbook and provide the vault password:

    ansible-playbook site.yaml --ask-vault-pass
