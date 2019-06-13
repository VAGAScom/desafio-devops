#!/usr/bin/env bash

iniciar_unicorn(){
  unicorn -c /opt/vagas/devops/unicorn.rb -E development -D
}

iniciar_nginx(){
  nginx -g 'daemon off;'
}

iniciar_aplicacao(){
  iniciar_unicorn &&
  iniciar_nginx
}

iniciar_aplicacao