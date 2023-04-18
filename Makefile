build:
	@sh ./helpers/builder.sh

clean:
	@sh ./helpers/cleaner.sh

deploy:
	@sam deploy

destroy:
	@sam delete

start/local:
	@sam local start-api
