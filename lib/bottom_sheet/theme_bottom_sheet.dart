import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: const Text(
                  "Light",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: const Text(
                  "Dark",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
