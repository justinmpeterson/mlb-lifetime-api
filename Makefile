VERSION_NUMBER=1.1.0

build:
	docker build -t yoda/mlb-lifetime-api:${VERSION_NUMBER} .
start:
	docker run -d --network coruscant --name mlb-lifetime-api --publish 8085:5000/tcp yoda/mlb-lifetime-api:${VERSION_NUMBER}

