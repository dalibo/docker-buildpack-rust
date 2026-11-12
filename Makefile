all: rockylinux8 rockylinux9 trixie

rockylinux8 rockylinux9 trixie:
	docker build \
	  --build-arg http_proxy \
	  --tag dalibo/buildpack-rust:$@ \
	  --file Dockerfile.$@ \
	.

# Cross-build for IBM POWER (needs QEMU binfmt on non-ppc hosts:
#   docker run --privileged --rm tonistiigi/binfmt --install ppc64le)
ppc: rockylinux9-ppc64le

rockylinux9-ppc64le:
	docker buildx build \
	  --platform linux/ppc64le \
	  --build-arg http_proxy \
	  --load \
	  --tag dalibo/buildpack-rust:$@ \
	  --file Dockerfile.rockylinux9 \
	.

push-%:
	docker push dalibo/buildpack-rust:$*

.PHONY: all ppc rockylinux8 rockylinux9 trixie rockylinux9-ppc64le
