# UTP Mobile Lanjut - Pinterest UI

## Cara pakai (disarankan)
1. Buat project baru: `flutter create prakmola_nama`
2. Hapus isi folder `lib/` bawaan, lalu salin seluruh isi folder `lib/` dari zip ini.
3. Jalankan `flutter run` (Chrome / emulator). Butuh internet untuk memuat gambar.

## Alternatif
Di dalam folder zip ini jalankan `flutter create .` lalu `flutter run`.

## Struktur
lib/
- main.dart                  -> hanya menyambungkan ke MainPage
- main_page.dart             -> bottom navigation
- constants/app_colors.dart  -> warna
- data/pin_data.dart         -> model + data dummy
- screens/                   -> home, search, detail, profile (4 tampilan)
- widgets/                   -> pin_card, masonry_grid
