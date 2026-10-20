import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../data/pin_data.dart';
import '../widgets/masonry_grid.dart';

// Tampilan 4: Profil
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _tab = 0; // 0 = Dibuat, 1 = Disimpan

  @override
  Widget build(BuildContext context) {
    final items =
        _tab == 0 ? pins.take(6).toList() : pins.skip(6).take(8).toList();

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CircleAvatar(
              radius: 48,
              backgroundColor: AppColors.grey,
              child: Icon(Icons.person, size: 48, color: AppColors.textGrey),
            ),
            const SizedBox(height: 12),
            const Text(
              'Feliza Mutiara',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('@2317051067',
                style: TextStyle(color: AppColors.textGrey)),
            const SizedBox(height: 8),
            const Text(
              '120 pengikut  •  85 mengikuti',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('Bagikan'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('Edit profil'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _tabButton('Dibuat', 0),
                const SizedBox(width: 24),
                _tabButton('Disimpan', 1),
              ],
            ),
            const SizedBox(height: 12),
            MasonryGrid(items: items, heroPrefix: 'profile$_tab'),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String label, int index) {
    final active = _tab == index;
    return GestureDetector(
      onTap: () => setState(() => _tab = index),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 3,
            width: 48,
            color: active ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
