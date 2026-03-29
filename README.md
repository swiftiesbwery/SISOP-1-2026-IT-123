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
