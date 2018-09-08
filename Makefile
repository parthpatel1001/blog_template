.PHONY: guard-% init serve

guard-%:
	@if [ "${${*}}" = "" ]; then echo "Environment variable $* not set"; exit 1; fi


init: guard-NAME
init:
	mkdir -p ../$(NAME)
	cp -R ../blog_template/* ../$(NAME)
	rm -rf ../$(NAME)/.git
	cp ../blog_template/.gitignore ../$(NAME)
	git init ../$(NAME)
	cd ../$(NAME) && git add .
	cd ../$(NAME) && git commit -m "Initial commit."
	echo "$(NAME) blog created at ../$(NAME)"

serve:
	jekyll serve --config _config.yml,_config_dev.yml

post: guard-date
post: guard-title
post:
	@cp _posts/template.md _posts/$(date)-$(title).md
	@sed -i.bak 's,DATE,$(date),g' _posts/$(date)-$(title).md
	@sed -i.bak 's,TITLE,$(title),g' _posts/$(date)-$(title).md
	@rm _posts/$(date)-$(title).md.bak
	@echo "created post: _posts/$(date)-$(title).md"