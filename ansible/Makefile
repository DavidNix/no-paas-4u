.PHONY: ping
ping:
	ansible -i hosts.ini -m ping -vvv <your ip address>

.PHONY: ansible
provision:
	ansible-playbook -i hosts.ini provision.yml

.PHONY: deploy
deploy:
	ansible-playbook -i hosts.ini --vault-password-file .vault-password deploy.yml

.PHONY: copy-prod-db
copy-prod-db:
	ansible-playbook -i hosts.ini dbcopy.yml

.PHONY: edit-secrets
edit-secrets:
	ansible-vault edit secrets.yml
