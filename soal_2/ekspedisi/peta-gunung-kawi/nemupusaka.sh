#!/bin/bash

# ambil titik 1 (baris 1)
lat1=$(sed -n '1p' titik-penting.txt | awk -F',' '{print $3}')
lon1=$(sed -n '1p' titik-penting.txt | awk -F',' '{print $4}')

# ambil titik 3 (baris 3) → diagonal
lat2=$(sed -n '3p' titik-penting.txt | awk -F',' '{print $3}')
lon2=$(sed -n '3p' titik-penting.txt | awk -F',' '{print $4}')

# hitung titik tengah diagonal
lat=$(awk "BEGIN {printf \"%.5f\", ($lat1+$lat2)/2}")
lon=$(awk "BEGIN {printf \"%.5f\", ($lon1+$lon2)/2}")

# output ke file
echo "$lat,$lon" > posisipusaka.txt

# tampilkan hasil
echo "Koordinat pusat:"
echo "Latitude  : $lat"
echo "Longitude : $lon"
