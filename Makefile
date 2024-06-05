start:
	if [ -z "`docker network ls | grep chuntfm-liquidsoap`" ]; then \
		docker network create chuntfm-liquidsoap; \
	else \
		echo "Network chuntfm-liquidsoap already exists"; \
	fi
	docker-compose up -d
	

stop:
	docker-compose down
	
clean:
	docker rmi nginx:alpine