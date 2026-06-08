.PHONY: deb

deb:
	@set -eu; \
	trap 'rm -rf debian' EXIT; \
	rm -rf debian; \
	cp -a packaging/debian debian; \
	dpkg-buildpackage -us -uc -b
