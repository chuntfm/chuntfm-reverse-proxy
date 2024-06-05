start:
	docker network create chuntfm-liquidsoap
	docker-compose up -d

stop:
	docker-compose down
	docker network rm chuntfm-liquidsoap
clean:
	docker rmi nginx:alpine