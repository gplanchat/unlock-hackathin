Akeneo Unlock 2021 Hackathon - Hippopotamus team
===

![Akeneo unlock Hackathon](https://images-eur.cvent.com/pr53/165ffc0d284045dab580da063641702b/pix/a60c7c22613f43e38875064f4759b552!_!abb05495467427f405fa9b85e0efd759.png?f=webp)

This project aims at building a connector between Akeneo and Sylius using
Middleware pipelines micro-services/lambda functions.

Installation
---

### Start the Middleware stack

The middleware stack is a composition of tools used by the middleware for
storing logs, rejected lines and execution statuses.

```shell
docker-compose up -d 
```

### Start the Sylius stack

During the hackathon, we are using an Akeneo Serenity demo instance and need 
a clean sylius instance.

```shell
make sylius-install
```

Compilation
---

Pipelines are compiled code built from configuration, a makefile is present 
to build them all in once.

### Build the pipelines

```shell
make all
```

Usage
---

How to run all the pipelines locally.

### Run the pipelines

```shell
php src/cli-pipeline-akeneo-to-sylius/build/function.php
```
