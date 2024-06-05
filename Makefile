start:
	if ! docker network ls | grep -q chuntfm-liquidsoap; then docker network create chuntfm-liquidsoap; fi
	docker-compose up -d

stop:
	docker-compose down
	if docker network ls | grep -q chuntfm-liquidsoap; then docker network rm chuntfm-liquidsoap; fi
clean:
	docker rmi nginx:alpine