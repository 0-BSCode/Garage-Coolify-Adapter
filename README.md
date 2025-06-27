# Garage Adapter for Coolify

This codebase serves as a basic template for deploying Garage on Coolify.

## Motivation

[Garage](https://garagehq.deuxfleurs.fr/) is an open-source, self-hostable object storage service. It's self-contained, performant, and lightweight. 
Getting this running locally is straightforward enough thanks to their [documentation](https://garagehq.deuxfleurs.fr/documentation/quick-start/). This management is made smoother when combined with [garage-webui](https://github.com/khairul169/garage-webui), which provides a web interface to manage your storage nodes.

However, this setup is not easily deployable to self-hosting solutions like [Coolify](https://coolify.io/). This is because running Garage via Docker requires an external configuration file that mounts to the container. This makes the docker deploy pipelines on Coolify unviable since they require all the dependencies to be self-contained. As a result, I turned to the Github deploy pipeline. 

However, we can't just commit the configuration files to a repository since they contain secret configuration options like `rpc_secret`. As a workaround, we can embed environment variables in the TOML file and use `envsubst` to replace the variables with their actual values during runtime. All of this is managed in the `docker-compose.yml` file, making it possible to deploy Garage to Coolify easily.

> [!note] Customizing the Configuration
> If you want to customize your configuration, you must edit the `garage.tmpl.toml` file provided. See [here](https://garagehq.deuxfleurs.fr/documentation/reference-manual/configuration) for the configuration options.

> [!note] Generating secrets
> To generate the secrets, use `openssl rand -base64 32`

## Coolify Deploy

To deploy this on Coolify:
1. Create a new Coolify resource
2. Select the "Public Repository" option
3. Paste the URL of this repository in the input field: https://github.com/0-BSCode/Garage-Coolify-Adapter
4. Select the "Docker Compose" build pack option
5. For the "Garage" domain, place your custom domain appended with the port `3900`
6. For the "Webui" domain, place your custom domain appended with the port `3909`
7. Head to the "Environment Variables" tab and fill in the required variables
8. Deploy the service

> [!warning]
> The web ui currently isn't password protected, so anyone can access it if they know the URL. My current workaround for this is using [Cloudflare Access](https://www.cloudflare.com/zero-trust/products/access/) to protect this domain (it's free).
