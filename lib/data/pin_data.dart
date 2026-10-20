// Model dan data dummy untuk pin.
import 'package:flutter/foundation.dart';

class Pin {
  final int id;
  final String title;
  final String author;
  final String category;
  final String description;
  final double ratio; // tinggi / lebar

  const Pin({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.ratio,
  });

  String get imageUrl => 'assets/images/$id.png';
}

const List<String> categories = [
  'Semua',
  'Alam',
  'Makanan',
  'Interior',
  'Fashion',
  'Seni',
];

const List<Pin> pins = [
  Pin(id: 1, title: 'Pemandangan Gunung', author: 'rina', category: 'Alam', description: 'Suasana pagi di pegunungan yang tenang.', ratio: 1.4),
  Pin(id: 2, title: 'Sarapan Pancake', author: 'budi', category: 'Makanan', description: 'Resep pancake lembut untuk akhir pekan.', ratio: 1.0),
  Pin(id: 3, title: 'Ruang Tamu Minimalis', author: 'sari', category: 'Interior', description: 'Inspirasi ruang tamu simpel dan nyaman.', ratio: 1.6),
  Pin(id: 4, title: 'Outfit Kasual', author: 'dina', category: 'Fashion', description: 'Padu padan outfit santai sehari-hari.', ratio: 1.3),
  Pin(id: 5, title: 'Lukisan Abstrak', author: 'andi', category: 'Seni', description: 'Warna-warna berani pada kanvas abstrak.', ratio: 1.2),
  Pin(id: 6, title: 'Pantai Senja', author: 'rina', category: 'Alam', description: 'Matahari terbenam di tepi pantai.', ratio: 0.8),
  Pin(id: 7, title: 'Ramen Hangat', author: 'budi', category: 'Makanan', description: 'Semangkuk ramen untuk hari hujan.', ratio: 1.5),
  Pin(id: 8, title: 'Kamar Tidur Cozy', author: 'sari', category: 'Interior', description: 'Ide dekorasi kamar tidur yang hangat.', ratio: 1.1),
  Pin(id: 9, title: 'Sepatu Sneakers', author: 'dina', category: 'Fashion', description: 'Koleksi sneakers untuk gaya urban.', ratio: 0.9),
  Pin(id: 10, title: 'Sketsa Pensil', author: 'andi', category: 'Seni', description: 'Sketsa sederhana dengan pensil 2B.', ratio: 1.45),
  Pin(id: 11, title: 'Hutan Berkabut', author: 'rina', category: 'Alam', description: 'Kabut tipis menyelimuti hutan pinus.', ratio: 1.25),
  Pin(id: 12, title: 'Salad Segar', author: 'budi', category: 'Makanan', description: 'Salad sayur dan buah yang menyegarkan.', ratio: 0.85),
  Pin(id: 13, title: 'Rak Buku Kayu', author: 'sari', category: 'Interior', description: 'Rak buku kayu untuk sudut baca.', ratio: 1.55),
  Pin(id: 14, title: 'Jaket Denim', author: 'dina', category: 'Fashion', description: 'Jaket denim klasik yang selalu cocok.', ratio: 1.15),
  Pin(id: 15, title: 'Poster Ilustrasi', author: 'andi', category: 'Seni', description: 'Ilustrasi poster bergaya retro.', ratio: 1.35),
  Pin(id: 16, title: 'Air Terjun', author: 'rina', category: 'Alam', description: 'Air terjun tersembunyi di tengah hutan.', ratio: 1.5),
];

// ID pin yang disimpan. Dipakai bersama oleh Detail (tombol Simpan)
// dan Profil (tab Disimpan), jadi keduanya selalu sinkron.
// Diisi beberapa pin awal supaya tab Disimpan tidak kosong saat demo.
final ValueNotifier<Set<int>> savedIds = ValueNotifier<Set<int>>({6, 7, 9, 12});

void toggleSaved(int id) {
  final next = Set<int>.from(savedIds.value);
  if (!next.remove(id)) next.add(id);
  savedIds.value = next;
}
