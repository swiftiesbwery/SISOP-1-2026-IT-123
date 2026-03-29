#!/bin/bash

grep -E '"id"|"site_name"|"latitude"|"longitude"' gsxtrack.json | \
awk -F': ' '
/"id"/ {id=$2; gsub(/[",]/,"",id)}
/"site_name"/ {name=$2; gsub(/[",]/,"",name)}
/"latitude"/ {lat=$2; gsub(/[",]/,"",lat)}
/"longitude"/ {
    lon=$2; gsub(/[",]/,"",lon)
    print id "," name "," lat "," lon
}
' > titik-penting.txt

echo "Parsing selesai! Data disimpan di titik-penting.txt"
