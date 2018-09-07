.PHONY: guard-% init serve

guard-%:
	@if [ "${${*}}" = "" ]; then echo "Environment variable $* not set"; exit 1; fi


init: guard-NAME
init:
	cd ../
	cp -R blog_template $(NAME)
	rm -rf .git
	cd $(NAME)
	git init
	git add .
	git commit -m "Initial commit."

serve:
	jekyll serve --config _config.yml,_config_dev.yml