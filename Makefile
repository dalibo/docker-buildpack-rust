all: rockylinux8 trixie

rockylinux8 trixie:
	docker build \
	  --build-arg http_proxy \
	  --tag dalibo/buildpack-rust:$@ \
	  --file Dockerfile.$@ \
	.

push-%:
	docker push dalibo/buildpack-rust:$*
