#!/bin/bash

METEO=$(curl http://meteostanice.knih-pi.cz/xml.xml 2>/dev/null)
WPI_TEMP=$(echo $METEO | xmllint --format - | grep -i 1006 -A 4 | grep value | cut -d "<" -f 2 | cut -d ">" -f 2)
WPI_HUMIDITY=$(echo $METEO | xmllint --format - | grep -i 1007 -A 4 | grep value | cut -d "<" -f 2 | cut -d ">" -f 2)
echo "Temp: $WPI_TEMP, Humidity: $WPI_HUMIDITY"
