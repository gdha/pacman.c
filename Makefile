.PHONY: clean deb

clean:
	rm -rf debian
	rm -f ../pacman-c_*.build ../pacman-c_*.buildinfo ../pacman-c_*.changes ../pacman-c_*.deb ../pacman-c-dbgsym_*.deb

deb:
	@set -eu; \
	trap 'rm -rf debian' EXIT; \
	rm -rf debian; \
	cp -a packaging/debian debian; \
	dpkg-buildpackage -us -uc -b || { \
		echo "Debian build failed. Ensure packaging dependencies are installed (see README.md)."; \
		exit 1; \
	}
