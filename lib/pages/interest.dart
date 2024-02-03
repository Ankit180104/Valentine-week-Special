// interest_list_screen.dart
import 'package:flutter/material.dart';

class InterestListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 234, 94, 141),
        title: Text("Select Your Interests"),
      ),
      body: ListView(
        children: [
          _buildInterestItem(context, "Interest 1"),
          _buildInterestItem(context, "Interest 2"),
          _buildInterestItem(context, "Interest 3"),
          // Add more interests as needed
        ],
      ),
    );
  }

  Widget _buildInterestItem(BuildContext context, String interest) {
    return GestureDetector(
      onTap: () {
        print("Selected Interest: $interest");
        Navigator.of(context).pop(); // Close the interest list screen
      },
      child: ListTile(
        title: Text(interest),
      ),
    );
  }
}
