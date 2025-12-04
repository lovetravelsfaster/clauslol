# Create, manage, and deploy the Claus LOL website
#
# Author: lovetravelsfaster
# Date: 2025-11-26
# License: MIT

SHELL := bash

.PHONY: help
help:
	@echo 'make build         default target, builds the site into ./_site'
	@echo 'make check-deps    check to ensure needed dependencies are installed'
	@echo 'make check         check tools syntax using shellcheck'
	@echo 'make serve         serve site locally out of ./_site'
	@echo 'make deploy        deploy the site (using rsync)'
	@echo 'make all           build and deploy the site'
	@echo 'make clean         remove any generated files'

.PHONY: build
build: static/favicon.ico static/favicon.png
	# create necessary folders
	mkdir -p _site _site/contact _site/static _site/j _site/resources _site/images
	# copy static files
	cat static/favicon.ico > _site/favicon.ico
	cat static/favicon.png > _site/static/favicon.png
	cat static/style.css > _site/static/style.css
	cat static/ansi.css > _site/static/ansi.css
	cat static/index.html > _site/index.html
	cat static/contact.html > _site/contact/index.html
	cat static/resources.html > _site/resources/index.html
	cat static/journal.html > _site/j/index.html
	# copy images
	cp -a images/. _site/images
	# make /ping endpoint (nginx handles this for me, but just in case)
	echo 'pong' > _site/ping
	# create all journal entry pages and journal index table
	# for journal.html
	./make-journal JOURNAL > _site/static/journal.js

.PHONY: serve
serve:
	python3 -mhttp.server -d _site


.PHONY: check-deps
check-deps:
	./check-deps

.PHONY: check
check:
	shellcheck -x check-* make-*

.PHONY: clean
clean:
	rm -rf _site

.PHONY: deploy
deploy:
	./deploy "$(desc)"


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
