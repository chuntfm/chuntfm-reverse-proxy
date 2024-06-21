start:
    # if .htpasswd does not exist, create it with admin:admin
	if [ ! -f .htpasswd ]; then \
		echo -n 'admin:' >> .htpasswd; \
		mkpasswd -m sha-512 admin >> .htpasswd; \
	fi

	# check for network directory shared between liquidsoap and nginx
	if [ -z "`docker network ls | grep chuntfm-liquidsoap`" ]; then \
		docker network create chuntfm-liquidsoap; \
	else \
		echo "Network chuntfm-liquidsoap already exists"; \
	fi

	# check for archive directory shared between liquidsoap and nginx
	if [ ! -d ~/chuntfm-archive ]; then \
		mkdir ~/chuntfm-archive; \
	fi
	# check for prerec directory shared between liquidsoap and nginx
	if [ ! -d ~/chuntfm-prerec ]; then \
		mkdir ~/chuntfm-prerec; \
	fi
	docker-compose up -d
	

stop:
	docker-compose down

restart:
	docker-compose down
	docker-compose up -d
	
clean:
	docker rmi nginx:alpine