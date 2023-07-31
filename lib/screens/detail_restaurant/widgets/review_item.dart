import 'package:flutter/material.dart';
import 'package:foodies/data/models/review.dart';

class ReviewItem extends StatelessWidget {
  final Review review;

  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              width: 48,
              height: 48,
              child: Text(
                review.name != '' ? review.name![0] : 'N',
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${review.name}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${review.date}',
                    style: TextStyle(
                      color: Theme.of(context).disabledColor,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${review.review}',
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
