import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../data/pin_data.dart';
import '../screens/detail_screen.dart';

class PinCard extends StatelessWidget {
  final Pin pin;
  final String heroPrefix; // supaya tag Hero unik antar halaman

  const PinCard({super.key, required this.pin, required this.heroPrefix});

  @override
  Widget build(BuildContext context) {
    final heroTag = '$heroPrefix-${pin.id}';

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailScreen(pin: pin, heroTag: heroTag),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 1 / pin.ratio,
                  child: PinImage(url: pin.imageUrl),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 6, 4, 0),
              child: Text(
                pin.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Gambar dari folder assets, dengan placeholder kalau file tidak ditemukan.
class PinImage extends StatelessWidget {
  final String url;
  const PinImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stack) => Container(
        color: AppColors.grey,
        child: const Icon(Icons.image_not_supported, color: AppColors.textGrey),
      ),
    );
  }
}
