bash /code/scripts/run_fixes.sh

cd /code/kobocat
. /venv/kobocat/bin/activate
python manage.py migrate --noinput
python manage.py collectstatic --noinput
python manage.py runserver 0.0.0.0:8001
