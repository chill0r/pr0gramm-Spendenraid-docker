<?php
/**
 * config.php
 * 
 * Konfiguration für den pr0gramm-apiCall
 */

/**
 * Speicherort der Cookiedatei
 * 
 * @var string
 */
$cookiefile = __DIR__.DIRECTORY_SEPARATOR."cookies.txt";

/**
 * Die IPv4-Adresse oder das Interface das für die ausgehende Verbindung genutzt werden soll.
 * Das Interface kann per Shell mit "sudo ifconfig" herausgefunden werden.
 * Wird das Script im Heimnetzwerk ausgeführt, so muss die interne Netzwerkadresse angegeben werden.
 * 
 * Beispielwerte:
 * - 1.2.3.4
 * - eth0
 * - 192.168.178.20 (nur lokaler PC / Heimnetzwerk)
 * 
 * @var string
 */
$bindTo = "eth0";

/**
 * Der Useragent der gesendet wird.
 * 
 * Beispielwerte:
 * - Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0
 * - Heinrichs lustige Datenkrake
 * 
 * @var string
 */
$useragent = "pr0gramm-apiCall";

/**
 * Pr0gramm Zugangsdaten
 * 
 * @var string
 * @var string
 */
$pr0Username = "";
$pr0Password = "";
?>