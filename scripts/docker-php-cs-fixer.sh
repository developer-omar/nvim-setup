#!/bin/bash
docker exec -i php-fpm php-cs-fixer "$@"
