import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../data/pin_data.dart';
import '../widgets/pin_card.dart';

// Tampilan 3: Detail Pin
class DetailScreen extends StatefulWidget {
  final Pin pin;
  final String heroTag;

  const DetailScreen({super.key, required this.pin, required this.heroTag});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _saved = false;
  bool _liked = false;
  bool _following = false;

  @override
  Widget build(BuildContext context) {
    final pin = widget.pin;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Hero(
            tag: widget.heroTag,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: AspectRatio(
                aspectRatio: 1 / pin.ratio,
                child: PinImage(url: pin.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              IconButton(
                onPressed: () => setState(() => _liked = !_liked),
                icon: Icon(
                  _liked ? Icons.favorite : Icons.favorite_border,
                  color: _liked ? AppColors.red : Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() => _saved = !_saved);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_saved ? 'Pin disimpan' : 'Pin dihapus dari simpanan'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _saved ? Colors.black : AppColors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                child: Text(_saved ? 'Tersimpan' : 'Simpan'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            pin.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(pin.description, style: const TextStyle(fontSize: 15)),
          const SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.grey,
                child: Text(
                  pin.author[0].toUpperCase(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  pin.author,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              OutlinedButton(
                onPressed: () => setState(() => _following = !_following),
                child: Text(_following ? 'Mengikuti' : 'Ikuti'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
