import 'package:flutter/material.dart';
import 'package:tabbar/widgets/tab_bar_section.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Watchlist',
            style: TextStyle(
              color: Colors.white, // Sets the text color to white
              fontSize: 30, // Sets the font size
              letterSpacing: 2.0, // Adds spacing between letters
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0), // Adds padding around the icon
              child: Icon(Icons.push_pin_outlined), // Displays a pin icon
            )
          ],
        ),
        body: SizedBox(
          height: 800, // Sets a fixed height
          width: 500, // Sets a fixed width
          child: Column(
            children: [
              Expanded(child: TabBarSection()), // Displays the tab bar section

             // SearchBox(), // Widget for search functionality
              // WatchlistView(), // Widget to display watchlist items
              // Expanded(child: StocksList()), // Widget to display stock list

              ElevatedButton.icon(
                  onPressed: () {
                    // Functionality for editing watchlist
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Colors.greenAccent, // Sets the icon color to green
                  ),
                  label: Text(
                    "Edit Watchlist",
                    style: TextStyle(color: Colors.white), // Sets text color to white
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(221, 43, 43, 43), // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7), // Rounds button corners
                    ),
                  ))
            ],
          ),
        ));
  }
}
