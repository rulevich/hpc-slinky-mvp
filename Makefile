ANSIBLE=ansible-playbook

base:
	$(ANSIBLE) ansible/playbooks/00-base.yml

repos:
	$(ANSIBLE) ansible/playbooks/05-repositories.yml

containerd:
	$(ANSIBLE) ansible/playbooks/10-containerd.yml

validate:
	$(ANSIBLE) ansible/playbooks/90-validate.yml

site:
	$(ANSIBLE) ansible/site.yml
