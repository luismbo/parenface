all: parenface

VER=1.3

parenface: parenface.el parenface-pkg.el LICENSE README.md
	git archive --format=tar --verbose --output=/tmp/parenface-$(VER).tar master

clean:
	rm /tmp/parenface-$(VER).tar
