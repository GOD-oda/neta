.PHONY: import
import:
	ruby copy-issue.rb $(ID)

.PHONY: deploy
deploy:
	sh deploy.sh

.PHONY: cwebp
cwebp:
	cwebp $(FROM) -o $(TO)
	rm $(FROM)
