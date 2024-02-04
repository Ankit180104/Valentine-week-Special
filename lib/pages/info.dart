import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  final String date;
  final String event;

  InformationScreen({required this.date, required this.event});

  String getEventDetails() {
    switch (date) {
      case "7th Feb":
        return "Rose Day - Express your love with roses. It's a day to convey your feelings through the language of flowers.";
      case "8th Feb":
        return "Propose Day - Take the next step in your relationship. Make it special by expressing your love and commitment.";
      case "9th Feb":
        return "Chocolate Day - Indulge in sweet moments together. Share the sweetness of chocolates and create lasting memories.";
      // Add details for other days as needed
      default:
        return "No details available.";
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
