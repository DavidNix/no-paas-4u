SSH_KEY = ~/.ssh/tf_hetzner
$(SSH_KEY):
	ssh-keygen -f $(SSH_KEY) -t ed25519 -C "<your email here>"

.PHONY: ssh-key
ssh-key: $(SSH_KEY)
	@echo "SSH key generated at $(SSH_KEY)"

.PHONY: my-ip
my-ip:
	@curl ipinfo.io/ip
	@echo
	@curl --ipv4 ipinfo.io/ip