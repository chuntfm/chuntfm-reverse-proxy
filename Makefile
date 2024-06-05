start:
	docker-compose up -d
	if [ -z "`docker network ls | grep chuntfm-liquidsoap`" ]; then \
		docker network create chuntfm-liquidsoap; \
	else \
		echo "Network chuntfm-liquidsoap already exists"; \
	fi

stop:
	docker-compose down
	
clean:
	docker rmi nginx:alpine