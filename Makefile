start:
	docker-compose up -d

stop:
	docker-compose down

clean:
	docker rmi nginx-reverse-proxy