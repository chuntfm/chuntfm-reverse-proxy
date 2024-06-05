start:
	@docker network inspect chuntfm-liquidsoap_default >/dev/null 2>&1 || docker network create chuntfm-liquidsoap_default
	docker-compose up -d

stop:
	docker-compose down
	@docker network inspect chuntfm-liquidsoap_default --format '{{ json .Containers }}' | grep -q '{}' && docker network rm chuntfm-liquidsoap_default || true

clean:
	docker rmi nginx:alpine