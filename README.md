Config Nginx https://www.jenkins.io/doc/book/system-administration/reverse-proxy-configuration-nginx/

# Jenkins

### Configuração inicial

Inicie o container com o comando:

```
docker compose up -d
```

Acesse o Jenkins em `localhost:8080`. Na tela de configuração inicial vai pedir uma senha, para pegá-la execute o comando:

```
docker compose exec jenkins bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"
```

E cole o valor retornado na tela. Na seção de instalação de plugins, escolha "Select plugins to install" e depois clique em "None".  Cadastre o usuário admin e finalize a configuração inicial.
