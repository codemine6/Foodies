import 'package:flutter/material.dart';

class ReviewForm extends StatefulWidget {
  final Function(String name, String review) onSubmit;

  const ReviewForm({super.key, required this.onSubmit});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  var nameController = TextEditingController();
  var reviewController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                filled: true,
                fillColor: Theme.of(context).highlightColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: reviewController,
              decoration: InputDecoration(
                hintText: 'Message',
                contentPadding: const EdgeInsets.all(16),
                filled: true,
                fillColor: Theme.of(context).highlightColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                widget.onSubmit(nameController.text, reviewController.text);
                nameController.clear();
                reviewController.clear();
              },
              borderRadius: BorderRadius.circular(8),
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Send',
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
