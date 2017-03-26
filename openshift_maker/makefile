# Makefile for install openshift on Mac OS
# Simple version of openshift_aws (private code in my company)
# Use xhyve for VM instead of virtualbox

install:
	# Install xhyve as openshift virtual machine
	brew install docker-machine-driver-xhyve
	# docker-machine-driver-xhyve need root owner and uid
	sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
	sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
	# Install minishift
	brew cask install minishift

run:
	minishift start
	eval $(minishift docker-env)
	oc login --username=admin --password=admin