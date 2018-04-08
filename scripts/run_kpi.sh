cd /code/kpi
cp ../fonts jsapp/ -r
npm run build
. /venv/kpi/bin/activate
python manage.py migrate --noinput
python manage.py collectstatic --noinput
python manage.py runserver 0.0.0.0:8000
