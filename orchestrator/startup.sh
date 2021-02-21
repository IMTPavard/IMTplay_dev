find /etc/nginx/sites-enabled/* | while read -r line ; do rm $line; done
#cat nginx_conf.conf > /etc/nginx/sites-available/myconf
cat nginx_conf.conf > /etc/nginx/nginx.conf
#ln -s /etc/nginx/sites-available/myconf /etc/nginx/sites-enabled
if [ ! -d /var/www/app ]; then
    mkdir /var/www/app
fi
#gunicorn --workers 3 --bind unix:myproject.sock -m 007 wsgi:app --daemon
#/etc/init.d/nginx start
#chown webuser *
#/etc/init.d/nginx start