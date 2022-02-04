@echo off
docker exec -ti pr0-webserver sh -c "php /var/www/apiCall/captchaLogin.php > /dev/null && mv /var/www/apiCall/__captcha.* /data/"
echo Bitte Captchaloesung in daten/__captcha.txt eintragen und mit Enter bestaetigen
pause
docker exec -ti pr0-webserver sh -c "mv /data/__* /var/www/apiCall/ && php /var/www/apiCall/captchaLogin.php"

