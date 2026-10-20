import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../data/pin_data.dart';
import '../widgets/masonry_grid.dart';

// Tampilan 1: Beranda
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selected = 'Semua';

  @override
  Widget build(BuildContext context) {
    final filtered = _selected == 'Semua'
        ? pins
        : pins.where((p) => p.category == _selected).toList();

    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final c = categories[i];
                final active = c == _selected;
                return GestureDetector(
                  onTap: () => setState(() => _selected = c),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: active ? Colors.black : AppColors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      c,
                      style: TextStyle(
                        color: active ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: MasonryGrid(items: filtered, heroPrefix: 'home'),
            ),
          ),
        ],
      ),
    );
  }
}
