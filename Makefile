DOCKER-COMPOSE=docker-compose -p unlock-hackathon-sylius
ifndef COMPOSER
COMPOSER=composer
endif

.PHONY: all
all: cli-pipeline-akeneo-to-sylius

.PHONY: cli-pipeline-akeneo-to-sylius
cli-pipeline-akeneo-to-sylius:
	bin/satellite build src/cli-pipeline-akeneo-to-sylius/satellite.yaml

sylius:
	$(COMPOSER) create-project sylius/sylius-standard sylius "~1.8.0" --ignore-platform-reqs

.PHONY: sylius-install
sylius-install: sylius
	cd sylius \
		&& $(DOCKER-COMPOSE) up -d mysql nodejs mailhog \
		&& $(DOCKER-COMPOSE) run --rm php composer update \
		&& $(DOCKER-COMPOSE) run --rm php bin/console sylius:install \
		&& $(DOCKER-COMPOSE) up -d

.PHONY: sylius-token
sylius-token: sylius
	cd sylius \
		&& $(DOCKER-COMPOSE) run --rm php php bin/console sylius:oauth-server:create-client \
			--grant-type="password" \
			--grant-type="refresh_token" \
			--grant-type="token"
