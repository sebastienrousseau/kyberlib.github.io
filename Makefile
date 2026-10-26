# SPDX-License-Identifier: Apache-2.0 OR MIT
.PHONY: all build serve screenshot clean help

all: build

help:
	@echo "make build  - build the site into docs/ and run every check"
	@echo "make serve  - build, then serve docs/ on http://127.0.0.1:8000"
	@echo "make screenshot - render static/images/screenshot.png from the build"
	@echo "make clean  - remove build output"

# contrast.py gates the colour tokens (WCAG AAA text, 3:1 UI); ssg's own
# quality gate runs inside post-build.py; `ssg audit` then checks
# the final files (WCAG, JSON-LD, CSP/SRI, links, metadata, feeds...).
build:
	rm -rf docs
	python3 scripts/contrast.py
	ssg build -f ssg.toml -q
	python3 scripts/anchor_headings.py docs
	python3 scripts/post-build.py
	python3 scripts/og_images.py
	ssg audit -o docs -f ssg.toml --skip-network

serve: build
	python3 -m http.server 8000 --bind 127.0.0.1 --directory docs

screenshot: build
	scripts/screenshot.sh

clean:
	rm -rf docs public .cache
