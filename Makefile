.PHONY: all
all: cli-pipeline-akeneo-to-sylius

.PHONY: cli-pipeline-akeneo-to-sylius
cli-pipeline-akeneo-to-sylius:
	bin/satellite build src/cli-pipeline-akeneo-to-sylius/satellite.yaml
