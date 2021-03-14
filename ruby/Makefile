.PHONY: build
build:
	docker build --tag=neta/ruby .

.PHONY: run
run:
	docker run -it -v $(PWD):/var/www/html neta/ruby ruby /var/www/html/index.rb
