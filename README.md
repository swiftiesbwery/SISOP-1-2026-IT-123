# **Soal 1**

## **Penjelasan**

Pada praktikum ini, dilakukan analisis data penumpang kereta Argo Ngawi Jesgejes (KANJ) yang tersimpan dalam file passenger.csv. Analisis dilakukan menggunakan command Linux dengan bantuan bash script dan AWK.

Program dibuat dalam bentuk menu interaktif yang memungkinkan pengguna memilih jenis analisis yang ingin dilakukan, mulai dari menghitung total penumpang hingga menganalisis data berdasarkan kelas dan usia.
Implementasi Program

### **1. Pengecekan File Input**

Langkah awal program adalah memastikan bahwa file CSV yang diberikan benar-benar ada.
<img width="433" height="128" alt="image" src="https://github.com/user-attachments/assets/b9fa994f-3020-4121-a28c-b146b3426c68" />

Jika file tidak ditemukan, program akan berhenti untuk menghindari error saat pemrosesan data.
Program menggunakan perulangan while true untuk menampilkan menu secara terus-menerus hingga user memilih keluar.

### **2. Menu Interaktif**

Program menggunakan perulangan while true untuk menampilkan menu secara terus-menerus hingga user memilih keluar.

Menu yang tersedia:

a → Total penumpang

b → Jumlah gerbong

c → Penumpang tertua

d → Rata-rata usia

e → Business class

q → Keluar

### **3. Pemrosesan Data dengan AWK**

Program menggunakan AWK untuk membaca file CSV dengan delimiter koma:
<img width="338" height="50" alt="image" src="https://github.com/user-attachments/assets/c4b88451-d0cb-4f18-8374-02ae46911215" />

Baris pertama (header) dilewati dengan:

<img width="227" height="49" alt="image" src="https://github.com/user-attachments/assets/7a56831b-4442-43d4-b489-52cad9cef9b4" />

## **Pembahasan Tiap Sub-Soal**

### **a. Total Penumpang**

Program menghitung jumlah seluruh penumpang dengan menghitung jumlah baris data.

<img width="290" height="61" alt="image" src="https://github.com/user-attachments/assets/36666696-f599-43e7-a5e7-9028df60ac35" />

Output:

Jumlah seluruh penumpang KANJ adalah X orang

<img width="716" height="282" alt="image" src="https://github.com/user-attachments/assets/5d1d9871-6a5a-4ac6-843c-bd1d7ad1363d" />


### **b. Jumlah Gerbong**

Untuk mengetahui jumlah gerbong unik, digunakan array:

<img width="419" height="52" alt="image" src="https://github.com/user-attachments/assets/2bfc6d02-fed1-4f59-9361-beb8976f0f32" />

Setiap nomor gerbong disimpan sebagai key, sehingga tidak terjadi duplikasi.

### **c. Penumpang Tertua**

Program membandingkan usia tiap penumpang dan menyimpan usia terbesar.
<img width="327" height="134" alt="image" src="https://github.com/user-attachments/assets/f325e5b9-6bf5-4bf0-be55-4c0404b448af" />

Hasilnya berupa nama penumpang dengan usia tertinggi.

### **d. Rata-rata Usia**

Program menjumlahkan seluruh usia dan membaginya dengan jumlah penumpang.

<img width="284" height="137" alt="image" src="https://github.com/user-attachments/assets/6ee8214e-fb8c-4c31-847f-840db9825680" />


Hasil dibulatkan menggunakan:

int(total_age/total)

### **e. Penumpang Business Class**

Program memfilter data berdasarkan kolom kelas:

<img width="580" height="87" alt="image" src="https://github.com/user-attachments/assets/0001e58f-9db9-4e6d-8bd8-932e67cdc1d1" />

Hanya penumpang dengan kelas "Business" yang dihitung.

## **4. Output dan Validasi Input**

Jika user memasukkan pilihan selain a/b/c/d/e, maka program akan menampilkan pesan error:

<img width="698" height="93" alt="image" src="https://github.com/user-attachments/assets/374aeb0f-3b62-4d43-8f0e-aa8dc3a968d5" />

Hal ini menunjukkan bahwa program memiliki validasi input sederhana.

# **Soal 2**

## **Penjelasan**

Pada soal ini, dilakukan simulasi ekspedisi pencarian lokasi pusaka berdasarkan data koordinat. Data diperoleh dari file JSON (gsxtrack.json) yang berisi beberapa titik lokasi hasil ekspedisi sebelumnya.

Berdasarkan petunjuk, lokasi pusaka berada di titik tengah dari semua titik koordinat, yang secara visual membentuk sebuah persegi. Oleh karena itu, pendekatan yang digunakan adalah mencari titik tengah diagonal dari dua titik yang saling berseberangan.

Untuk menyelesaikan permasalahan ini, dibuat dua script:

- parserkoordinat.sh → untuk mengekstrak data dari JSON
- nemupusaka.sh → untuk menghitung titik pusat

## **Implementasi Program**

### **1. Ekstraksi Data Koordinat (parserkoordinat.sh)**

Script ini bertujuan untuk mengambil data penting dari file gsxtrack.json, yaitu:

- id
- site_name
- latitude
- longitude

Data diambil menggunakan tools seperti:

- grep
- sed
- awk

Kemudian disusun dalam format:

<img width="442" height="49" alt="image" src="https://github.com/user-attachments/assets/21da3b38-6394-47eb-9e41-93d3717a3a48" />

Dan disimpan ke file:

<img width="262" height="32" alt="image" src="https://github.com/user-attachments/assets/646d635b-ead8-40a5-b6bd-5452cea08002" />

### **2. Perhitungan Titik Pusat (nemupusaka.sh)**

Script ini digunakan untuk mencari lokasi pusaka berdasarkan titik tengah diagonal.

**Analisis Kode**

**Mengambil Koordinat Titik Pertama**

<img width="766" height="84" alt="image" src="https://github.com/user-attachments/assets/f666a876-5542-4d01-85f4-e69fb0c8f2d7" />

Penjelasan:

- sed -n '1p' → mengambil baris ke-1
- awk -F',' → memisahkan berdasarkan koma
- $3 → latitude
- $4 → longitude

**Mengambil Koordinat Titik Ketiga (Diagonal)**

<img width="752" height="82" alt="image" src="https://github.com/user-attachments/assets/709026e5-8f90-4228-a0b4-408ff6518c54" />

Penjelasan:

- Mengambil baris ke-3 sebagai titik diagonal
- Diasumsikan titik 1 dan 3 saling berseberangan

**Menghitung Titik Tengah**

<img width="686" height="94" alt="image" src="https://github.com/user-attachments/assets/c1413657-0236-4a86-9ec0-1498b7653145" />

Penjelasan:

- Menggunakan rumus titik tengah:

<img width="931" height="204" alt="image" src="https://github.com/user-attachments/assets/576e939f-e9c2-4852-946e-23d3ac08a093" />

- printf "%.5f" → membatasi 5 angka di belakang koma

hasilnya adalah titik koordinat pusat.

**Menyimpan Hasil**

<img width="427" height="59" alt="image" src="https://github.com/user-attachments/assets/33a2733f-371e-4548-bbf8-fc47cf645206" />

- Menyimpan hasil koordinat ke file
- Format: latitude,longitude

**Menampilkan Output**

<img width="345" height="117" alt="image" src="https://github.com/user-attachments/assets/da6e456b-ccf4-4c72-92e8-2c8e4c8d1474" />

menampilkan hasil ke terminal agar user dapat melihat langsung
Hasil Program

Program menghasilkan:

- File titik-penting.txt → berisi data koordinat
- File posisipusaka.txt → berisi titik pusat

Output :

<img width="327" height="91" alt="image" src="https://github.com/user-attachments/assets/42b393a4-f7a4-4c1b-be19-fd5ef7807c42" />
