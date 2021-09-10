#!/bin/bash

tmp_weather="$HOME/init_bspwm/openapiweather"

if [ ! -d $tmp_weather ]; then
        mkdir -p $tmp_weather
fi

# Put in your api and stuff link here 
# If you dunno, head to openweathermap.org, and make and account 
#(completely free I swear, and then get your API Key and  your City ID)
# I wish I was smart enough to do it like Elena, but this is the top I could do lol
KEY="API_KEY"
ID="CITY_ID"
UNIT="metric" #Options are 'metric' and 'imperial'
weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?APPID="$KEY"&id="$ID"&units="$UNIT"")
# echo $weather
if [ ! -z "$weather" ]; then
        weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
        weather_icon_code=$(echo "$weather" | jq -r ".weather[].icon" | head -1)
	weather_description=$(echo "$weather" | jq -r ".weather[].description" | head -1 | sed -e "s/\b\(.\)/\u\1/g")

	#Big long if statement of doom
	if [ "$weather_icon_code" == "50d"  ]; then
		weather_icon=" "
    elif [ "$weather_icon_code" == "50n"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "01d"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "01n"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "02d"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "02n"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "03d"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "03n"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "04d"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "04n"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "09d"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "09n"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "10d"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "10n"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "11d"  ]; then
        weather_icon=""
    elif [ "$weather_icon_code" == "11n"  ]; then
        weather_icon=""
    elif [ "$weather_icon_code" == "13d"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "13n"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "40d"  ]; then
        weather_icon=" "
    elif [ "$weather_icon_code" == "40n"  ]; then
        weather_icon=" "
    else 
        weather_icon=" "
    fi
 else
 echo "Weather Unavailable" > $tmp_weather/weather-fail
fi

echo "$weather_icon"" ""$weather_temp""°C" > $tmp_weather/m_weather 
echo "$weather_icon"" ""$weather_temp""°C" 
