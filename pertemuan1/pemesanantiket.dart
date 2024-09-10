class TiketBioskop {
  int jumlahTiket;
  String tipeTiket; // 'dewasa' atau 'anak'

  // Harga tiket
  static const int hargaDewasa = 50000;
  static const int hargaAnak = 30000;

  TiketBioskop(this.jumlahTiket, this.tipeTiket) {
    if (jumlahTiket <= 0) {
      throw Exception("Jumlah tiket tidak boleh negatif atau nol.");
    }
    if (tipeTiket != 'dewasa' && tipeTiket != 'anak') {
      throw Exception("Tipe tiket tidak valid. Harus 'dewasa' atau 'anak'.");
    }
  }

  // Fungsi untuk menghitung total harga tiket
  int hitungTotal() {
    if (tipeTiket == 'dewasa') {
      return jumlahTiket * hargaDewasa;
    } else {
      return jumlahTiket * hargaAnak;
    }
  }

  // Fungsi untuk menghitung diskon jika memesan lebih dari 5 tiket
  double hitungDiskon() {
    int totalHarga = hitungTotal();
    if (jumlahTiket > 5) {
      return totalHarga * 0.1; // Diskon 10%
    }
    return 0;
  }
}

void main() {
  try {
    TiketBioskop pesanan1 = TiketBioskop(6, 'dewasa');
    int totalHarga = pesanan1.hitungTotal();
    double diskon = pesanan1.hitungDiskon();

    print("Jumlah tiket yang dipesan: ${pesanan1.jumlahTiket}");
    print("Total harga tiket: Rp$totalHarga");
    if (diskon > 0) {
      print("Diskon: Rp$diskon");
      print("Total setelah diskon: Rp${totalHarga - diskon}");
    } else {
      print("Tidak ada diskon yang diterapkan.");
    }

  } catch (e) {
    print("Terjadi kesalahan: $e");
  }

  // Contoh pesanan yang tidak valid
  try {
    TiketBioskop pesanan2 = TiketBioskop(-3, 'dewasa'); // Nilai negatif
    pesanan2.hitungTotal();
  } catch (e) {
    print("Kesalahan pada pesanan: $e");
  }

  // Contoh pesanan dengan tipe tiket tidak valid
  try {
    TiketBioskop pesanan3 = TiketBioskop(3, 'senior'); // Tipe tiket tidak valid
    pesanan3.hitungTotal();
  } catch (e) {
    print("Kesalahan pada pesanan: $e");
  }
}
