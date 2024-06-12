start:
	if [ ! -f .htpasswd ]; then \
		echo -n 'admin:' >> .htpasswd; \
		mkpasswd -m sha-512 admin >> .htpasswd; \
	fi

	if [ -z "`docker network ls | grep chuntfm-liquidsoap`" ]; then \
		docker network create chuntfm-liquidsoap; \
	else \
		echo "Network chuntfm-liquidsoap already exists"; \
	fi
	docker-compose up -d
	

stop:
	docker-compose down

restart:
	docker-compose down
	docker-compose up -d
	
clean:
	docker rmi nginx:alpine