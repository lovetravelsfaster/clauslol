# Create, manage, and deploy the Claus LOL website
#
# Author: Claus
# Date: 2025-11-26
# License: MIT

SHELL := bash

# .PHONY: help
# help:
# 	@echo 'make build         default target, builds the site into ./_site'
# 	@echo 'make check-deps    check to ensure needed dependencies are installed'
# 	@echo 'make check         check tools syntax using shellcheck'
# 	@echo 'make serve         serve site locally out of ./_site'
# 	@echo 'make deploy        deploy the site (using rsync)'
# 	@echo 'make all           build and deploy the site'
# 	@echo 'make clean         remove any generated files'

.PHONY: build
build:
	mkdir -p _site _site/contact _site/static _site/j _site/resources
	# copy static files
	cat static/style.css > _site/static/style.css
	cat static/ansi.css > _site/static/ansi.css
	cat static/index.html > _site/index.html
	cat static/contact.html > _site/contact/index.html
	cat static/resources.html > _site/resources/index.html
	cat static/journal.html > _site/j/index.html
	# make /ping endpoint (nginx handles this for me, but just in case)
	echo 'pong' > _site/ping

	./make-journal JOURNAL > _site/static/journal.js
	


.PHONY: serve
serve:
	python3 -mhttp.server -d _site


.PHONY: check-deps
check-deps:
	./check-deps

.PHONY: clean
clean:
	rm -rf _site

# static/favicon.ico:
# 	curl -o $@ https://files.daveeddy.com/ysap/favicon.ico
# 
# static/favicon.jpg:
# 	curl -o $@ https://files.daveeddy.com/ysap/favicon.jpg
# 
# static/ysap.png:
# 	curl -o $@ https://files.daveeddy.com/ysap/ysap.png
# 
# .PHONY: all
# all: build deploy
# 
# .PHONY: serve
# serve:
# 	python3 -mhttp.server -d _site
# 
# .PHONY: check-deps
# check-deps:
# 	./check-deps
# 
# .PHONY: check
# check:
# 	shellcheck -x check-* make-* tools/*
# 
# .PHONY: clean
# clean:
# 	rm -rf _site
# 	rm -f static/favicon.{ico,jpg}
# 	rm -f static/ysap.png
# 
# .PHONY: deploy
# deploy:
# 	rsync -avh --delete ./_site/ web:/var/www/ysap.sh/
