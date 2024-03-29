import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Text(
                  "English",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(children: [
            InkWell(
              onTap: () {},
              child: const Text(
                "Arabic",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
