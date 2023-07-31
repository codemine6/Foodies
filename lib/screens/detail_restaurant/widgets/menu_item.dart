import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String menu;

  const MenuItem({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 100,
      child: Column(
        children: [
          SizedBox(
            width: 60,
            child: Image.asset('assets/food.png'),
          ),
          const Spacer(),
          Text(
            menu,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          Text(
            'Rp.25000',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
