import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valentine/pages/interest.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 190, 203),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 234, 94, 141),
        title: Text("Valentine"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton("Single", "Find a single friend"),
            _buildButton("Valentine", "Celebrate with your valentine"),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText, String description) {
    return Container(
      width: 150,
      height: 120,
      margin: EdgeInsets.all(10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ElevatedButton(
          onPressed: () {
            Get.to(InterestListScreen());
            print("$buttonText button pressed");
          },
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 234, 94, 141),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
