import 'package:flutter/material.dart';
import 'package:tabbar/screens/search_screan.dart';


// ignore: camel_case_types
class search_boxx extends StatelessWidget {
  const search_boxx({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search & Add',
          hintStyle: TextStyle(color: Colors.white54), // Dimmed hint text
          filled: true,
          fillColor: Colors.black, // Background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
            borderSide: BorderSide.none, // Remove default border
          ),
          prefixIcon: Icon(Icons.search, color: Colors.white),
          suffixIcon: SizedBox(
            width: 70, // Set width for proper alignment
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // Align icons properly
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.grid_view, color: Colors.greenAccent),
                SizedBox(width: 10),
                Icon(Icons.tune, color: Colors.greenAccent),
              ],
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10), // Adjust padding
        ),
        style: TextStyle(color: Colors.white), // Ensure text is visible
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchScreen()),
        ),
      ),
    );
  }
}
