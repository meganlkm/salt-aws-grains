TAG_NAME = "salt-sandbox"
DOCKER_IMAGE = "simplyadrian/allsalt:ubuntu_master_2017.7.2"


sandbox:
	docker pull $(DOCKER_IMAGE)
	docker run --rm -d \
		-v ${PWD}/_grains:/srv/salt/_grains \
		-v ${PWD}:/opt/aws-grains \
		-e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
		-e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
		-e "AWS_REGION=${AWS_REGION}" \
		-h $(TAG_NAME) \
		--name $(TAG_NAME) \
		$(DOCKER_IMAGE)
	# docker exec -it $(TAG_NAME) bash

dead:
	docker kill $(TAG_NAME)
