cd /code/kobocat
. /venv/kobocat/bin/activate

python manage.py createdate
python manage.py create_days
python manage.py create_timezones
python manage.py create_groups
python manage.py create_organization_type
python manage.py create_project_type

echo "from django.contrib.auth.models import User; User.objects.filter(email='root@test.com').delete(); User.objects.create_superuser('root', 'root@test.com', 'admin123')" | python manage.py shell

python manage.py create_superuser root@test.com

