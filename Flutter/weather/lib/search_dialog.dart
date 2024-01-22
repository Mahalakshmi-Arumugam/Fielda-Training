import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;

  const SearchDialog({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Search Location'),
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 60.0,
            width: 200.0,
            child: TextField(
              controller: searchController,
              style: const TextStyle(fontSize: 14.0),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.purple,
                ),
                labelText: 'Search by City',
                fillColor: Colors.purple.withOpacity(0.1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            String enteredCity = searchController.text;
            if (enteredCity.isNotEmpty) {
              onSearch(enteredCity);
            }
          },
          child: const Text(
            'Search',
            style: TextStyle(fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 18,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
