graph:
	terraform graph | dot -Tpng > graph.png

ssh-key:
	mkdir ssh; ssh-keygen -t rsa -C "kcdc_terraform" -P '' -f ssh/kcdc_terraform

plan:
	terraform plan -refresh=true -input=false

apply:
	terraform apply -refresh=true -input=false
