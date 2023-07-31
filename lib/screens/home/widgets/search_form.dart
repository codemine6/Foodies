import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchForm extends StatefulWidget {
  final Function(String query) onSearch;

  const SearchForm({super.key, required this.onSearch});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  var queryController = TextEditingController();

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: queryController,
              decoration: InputDecoration(
                hintText: 'Search..',
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                filled: true,
                fillColor: Theme.of(context).canvasColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                widget.onSearch(queryController.text);
              },
            ),
          ),
          const SizedBox(width: 18),
          InkWell(
            onTap: () {
              widget.onSearch(queryController.text);
            },
            borderRadius: BorderRadius.circular(8),
            child: Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 48,
              height: 48,
              child: const Icon(Ionicons.search),
            ),
          ),
        ],
      ),
    );
  }
}
