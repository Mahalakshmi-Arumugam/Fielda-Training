import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchBoxState();
  }
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _searchController = TextEditingController();
  List<String> allNames = [
    'chennai',
    'Bangalore',
    'Coimbatore',
    'Pune',
    'Noida',
    'Mumbai',
    'Delhi',
    'Hyderabad',
    'patna',
    'Kanpur'
  ];
  
  List<Widget> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: const InputDecoration(
                    hintText: 'Search address',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        if (searchResults.isNotEmpty)
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: const BoxDecoration(
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: searchResults
                    .map((result) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: result,
                        ))
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 10),
const Padding(
  padding: EdgeInsets.only(right: 80.0), 
  child: Row(
    children: [
      Icon(
         Icons.place, 
        color: Colors.blue, 
      ),
      SizedBox(width: 8), 
      Text(
        'Use current location',
        style: TextStyle(
          color: Colors.blue, 
          fontWeight: FontWeight.bold, 
        ),
      ),
    ],
  ),
),
      ],
    );
  }

  void _onSearchChanged(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        searchResults.clear();
      } else {
        searchResults = allNames
            .where((name) =>
                name.toLowerCase().startsWith(searchText.toLowerCase()))
            .map((matchedName) {
          final startIndex =
              matchedName.toLowerCase().indexOf(searchText.toLowerCase());
          final endIndex = startIndex + searchText.length;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                text: matchedName.substring(0, startIndex),
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: matchedName.substring(startIndex, endIndex),
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: matchedName.substring(endIndex),
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        }).toList();
      }
      if (searchText.isNotEmpty && searchResults.isEmpty) {
        searchResults.add(
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'No results found',
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      }
    });
  }
}
