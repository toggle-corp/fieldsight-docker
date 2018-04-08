## Requirements

* [docker](https://docs.docker.com/install/)
* [docker-compose (v3)](https://docs.docker.com/compose/install/)

### Clone repo

kobocat

```bash
    git clone https://github.com/toggle-corp/fieldsight kobocat
```

kpi

```bash
    git clone https://github.com/toggle-corp/form-builder kpi
```

kobocat-template

```bash
    git clone https://github.com/toggle-corp/kobocat-template
```

### kobocat setup

- Copy sample file

    ```bash
    cp ./kobocat/onadata/settings/local_settings.sample.py ./kobocat/onadata/settings/local_settings.py
    ```

- Set `FCM_API_KEY` to proper value in the `local_settings.py` file

    ```json
    ....
    FCM_API_KEY = "<YOUR_FCM_API_KEY>"
    ....
    ```

### kpi setup

- Copy sample file

    ```bash
    cp ./kpi/kobo_playground/local_settings.sample.py  ./kpi/kobo_playground/local_settings.py
    ```

- Create database `kobocat1` (one time or after postgres database wipe)

    ```bash
    docker-compose exec db bash
    # Inside container
    psql -U postgres
    # Inside psql shell
    CREATE DATABASE kobocat1;
    ```

## Run

Build docker images and start project

```bash
docker-compose build
docker-compose up
```
