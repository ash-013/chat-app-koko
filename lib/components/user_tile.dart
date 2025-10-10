import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(Icons.person, color: Theme.of(context).colorScheme.surface),
            const SizedBox(width: 16.0),
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
