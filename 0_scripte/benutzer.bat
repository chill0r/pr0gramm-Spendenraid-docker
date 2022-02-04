@echo off

:start
set auswahl=""
set benutzer=""
set pw=""
title Benutzerverwaltung
cls
echo [1] Benutzer anlegen
echo [2] Benutzer loeschen
echo [3] Passwort aendern
echo .
echo [0] Beenden
echo .
set /p auswahl=

if %auswahl%==1 goto anlegen
if %auswahl%==2 goto loeschen
if %auswahl%==3 goto aendern
if %auswahl%==0 goto ende
goto start

:anlegen
title Benutzer anlegen
cls
echo Bitte Benutzernamen eingeben (leer lassen zum abbrechen):
set /p benutzer=
if %benutzer%=="" goto start
docker exec -ti pr0-webserver sh -c "php /var/www/html/pr0gramm-Spendenraid/cli_scripts/addUser.php %benutzer% >> /data/user.txt"
echo "Passwort in daten/user.txt"
pause
goto start

:loeschen
title Benutzer loeschen
cls
echo Bitte Benutzernamen eingeben (leer lassen zum abbrechen):
set /p benutzer=
if %benutzer%=="" goto start
docker exec -ti pr0-webserver sh -c "php /var/www/html/pr0gramm-Spendenraid/cli_scripts/delUser.php %benutzer%"
pause
goto start

:aendern
title Passwort aendern
cls
echo Bitte Benutzernamen eingeben (leer lassen zum abbrechen):
set /p benutzer=
if %benutzer%=="" goto start
echo Bitte neues eingeben (leer lassen zum abbrechen):
set /p pw=
if %pw%=="" goto start
docker exec -ti pr0-webserver sh -c "php /var/www/html/pr0gramm-Spendenraid/cli_scripts/passwd.php %benutzer% %pw%"
pause
goto start

:ende

