### Run in Docker
If you'd like to test/preview this neovim without affecting your existing configuration, you run this is a docker-container.
By default the container name is `nvim-config-V2` and the service name `machine`.
You can change these if you want in the `docker-compose.yml` file.

To start the docker container run these commands:
   -  Build and start he container
      ```sh
      docker-compose up -d
      ```
   -  Start the `neovim` instance inside the container.
      ```sh
      docker-compose exec machine nvim
      ```
   -  Alternatively, you start a bash shell instead, then run `nvim`
      ```sh
      docker-compose exec machine bash
      ```
**Note that any changes made to the config files within the docker container will be reflected to real file in you local machine**
