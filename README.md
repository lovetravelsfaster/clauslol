Claus LOL Website
=================

https://claus.lol

These docs are mostly made for myself so I can remember how to make new journal entries, build and deploy the site, etc.

Usage
-----

```
$ make help
make build         default target, builds the site into ./_site
make check-deps    check to ensure needed dependencies are installed
make check         check tools syntax using shellcheck
make serve         serve site locally out of ./_site
make deploy        deploy the site (using rsync)
make all           build and deploy the site
make clean         remove any generated files
```

Journal
-------
Journal entries must follow these rules for the Journal part of the website to work.

1. Written in MARKDOWN
2. Contain YAML Front Matter metadata, at least `title`, `description` and `number`.
3. Be located in `journal_entries/`
4. Follow the naming pattern `YYYY-MM-DD-<title-of-entry>.md`, example: `2025-11-26-First-entry.md` 

Based On
--------
Entirely stolen from [ysap.sh](https://github.com/bahamas10/ysap) :raised_hands:

License
-------
MIT