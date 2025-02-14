import 'package:flutter/material.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Controller for handling search input
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose(); // Dispose controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search")), // App bar with title
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adds padding around the content
        child: Column(
          children: [
            // Search input field
            TextField(
              controller:
                  _searchController, // Connects controller to input field
              decoration: InputDecoration(
                hintText: "Search...", // Placeholder text
                prefixIcon: Icon(Icons.search), // Search icon on the left
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                            Icons.clear), // Clear button when text is present
                        onPressed: () {
                          _searchController.clear(); // Clears search text
                          setState(() {}); // Refresh UI
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  borderSide: BorderSide(), // Default border style
                ),
              ),
              onChanged: (value) {
                setState(() {}); // Updates UI on text change
              },
            ),
          ],
        ),
      ),
    );
  }
}
