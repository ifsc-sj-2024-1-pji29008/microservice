# Microsserviços

Neste repositório estão contidos os arquivos de Dockerfile e um arquivo [`docker-compose.yml`](docker-compose.yml) para a instanciação do servidor com a API e do cliente Web, que utiliza o Streamlit para compor toda a interface.

## Uso

Para executar o servidor, basta executar o comando:

```bash
docker compose up -d
```

Serão criados dois contêineres, um chamado `api` e outro chamado `client`, além de uma rede interna `jiga_teste`.

O contêiner `api`:

- é executado em modo privilegiado;
- possui acesso ao diretório `/sys/bus/w1/devices`;
- é responsável por servir a API, que é acessível através da porta 5000;
- escreve o banco de dados em `/home/containers/api/database` no hospeiro. Tal diretório é montado em `/app/instance` no contêiner;
- uma vez criado, inicia junto o serviço do Docker;
- utiliza a imagem `jpmsb/pji29008-api`.

O contêiner `client`:

- é responsável por servir a interface Web, que é acessível através da porta 8501;
- lê as variáveis de ambiente `API_ADDRESS` e `API_PORT` para acessar a API;
- uma vez criado, inicia junto o serviço do Docker;
- utiliza a imagem `jpmsb/pji29008-client`.

Caso as imagens não estejam presentes no sistema e não estejam disponíveis em repositórios remotos, as mesmas serão construídas a partir dos arquivos de Dockerfile presentes neste repositório.