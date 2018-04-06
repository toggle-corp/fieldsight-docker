### Clone repo
kobocat
```bash
    git clone https://github.com/fieldsight/fieldsight kobocat
```
kpi
```bash
    git clone https://github.com/fieldsight/form-builder kpi
```

### kobocat local settings
- Copy sample file
    ```bash
    cp ./kobocat/onadata/settings/local_settings.sample.py ./kobocat/onadata/settings/local_settings.py
    ```
- Change host to 'db'
    ```json
    ....
        'HOST': 'db',
    ....
    ```

### kpi local settings
- Copy sample file
    ```bash
    cp ./kpi/kobo_playground/local_settings.sample.py  ./kpi/kobo_playground/local_settings.py
    ```
- Change host to 'db'
- Create database `kobocat1` (one time or after postgres database wipe)
    ```bash
    docker-compose exec db bash
    # Inside container
    psql -U postgres
    # Inside psql shell
    CREATE DATABASE kobocat1;
    ```

### Docker
Build docker images and start project
```bash
docker-compose build
docker-compose up
```
