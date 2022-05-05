.PHONY: create
create:
	@ruby create_post.rb $(id)

.PHONY: import_post_meta
import_post_meta:
	@ruby import_post_meta.rb $(id)

.PHONY: deploy
deploy:
	sh deploy.sh

.PHONY: cwebp
cwebp:
	cwebp $(FROM) -o $(TO)
	rm $(FROM)
