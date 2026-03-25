#!/bin/bash

file=$1

# cek file ada
if [ ! -f "$file" ]; then
    echo "File tidak ditemukan!"
    exit 1
fi

while true
do
    echo ""
    echo "===== MENU KANJ ====="
    echo "a. Total penumpang"
    echo "b. Jumlah gerbong"
    echo "c. Penumpang tertua"
    echo "d. Rata-rata usia"
    echo "e. Business class"
    echo "q. Keluar"
    echo -n "Pilih (a/b/c/d/e/q): "
    read mode

    if [ "$mode" == "q" ]; then
        echo "Keluar program..."
        break
    fi

    awk -F',' -v mode="$mode" '

    NR==1 { next }

    mode=="a" { count++ }

    mode=="b" { carriage[$4]=1 }

    mode=="c" {
        if ($2 > max_age) {
            max_age=$2
            oldest=$1
        }
    }

    mode=="d" {
        total_age+=$2
        total++
    }

    mode=="e" && $3=="Business" { business++ }

    END {
    if (mode=="a")
        print "Jumlah seluruh penumpang KANJ adalah " count " orang"

    else if (mode=="b") {
        for (c in carriage) total_carriage++
        print "Jumlah gerbong penumpang KANJ adalah " total_carriage
    }

    else if (mode=="c")
        print oldest " adalah penumpang kereta tertua dengan usia " max_age " tahun"

    else if (mode=="d")
        print "Rata-rata usia penumpang adalah " int(total_age/total) " tahun"

    else if (mode=="e")
        print "Jumlah penumpang business class ada " business " orang"

    else {
        print "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
        print "Contoh penggunaan: awk -f file.sh data.csv a"
    }
}

    ' "$file"

done
