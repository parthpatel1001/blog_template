# Creating a new blog
```sh
make init NAME=name-of_blog
```
# Posts
New posts go in `_posts` & have to follow the naming convention `YYYY-MM-DD-fdsa-dfsa-fdsa.md`. 

## New post helper
```sh
make post date=2017-08-09 title=test_post
```
*note can not have spaces in title*

# Assets
Add images in `assets/`.

# Serving locally
```sh 
jekyll serve --config _config.yml,_config_dev.yml`.# blog_template
```
