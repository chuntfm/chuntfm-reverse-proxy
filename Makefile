start:
	docker network create chuntfm-liquidsoap_default
	docker-compose up -d

stop:
	docker-compose down

clean:
	docker rmi nginx:alpine