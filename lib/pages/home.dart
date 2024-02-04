import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 190, 203),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 234, 94, 141),
        title: Text("Valentine Week Special"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCalendar(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton("Single", "Find a single friend"),
              SizedBox(width: 20),
              _buildButton("Valentine", "Celebrate with your valentine"),
            ],
          ),
        ],
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

  Widget _buildCalendar() {
    return Table(
      children: List.generate(
        3, // Number of rows
        (index) => TableRow(
          children: List.generate(
            4, // Number of columns
            (subIndex) {
              final dayIndex = index * 4 + subIndex + 1;
              if (dayIndex <= calendarDays.length) {
                final dayData = calendarDays[dayIndex - 1];
                return _buildDayButton(dayData["day"]!, dayData["event"]);
              } else {
                return Container(); // Empty container for dates beyond Valentine's Day
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDayButton(String day, String? event) {
    DateTime today = DateTime.now();
    DateTime valentineDate =
        DateTime(today.year, 2, int.parse(day.split(" ")[0]));

    String formattedDate = "${valentineDate.day}th Feb";

    return Container(
      margin: EdgeInsets.all(5),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Tooltip(
          message: event ?? "", // Display event text when hovering
          child: ElevatedButton(
            onPressed: () {
              if (event != null && event.isNotEmpty) {
                print("$formattedDate: $event");
                // Add specific actions for each day here
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 234, 94, 141),
              minimumSize: Size(80, 80), // Adjust the size as needed
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formattedDate,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Map<String, String>> calendarDays = [
    {"day": "7 Rose Day", "event": "Express your love with roses"},
    {
      "day": "8 Propose Day",
      "event": "Take the next step in your relationship"
    },
    {"day": "9 Chocolate Day", "event": "Indulge in sweet moments together"},
    {"day": "10 Teddy Day", "event": "Gift a cute teddy as a symbol of love"},
    {
      "day": "11 Promise Day",
      "event": "Make promises for a lasting relationship"
    },
    {"day": "12 Hug Day", "event": "Show your affection with warm hugs"},
    {"day": "13 Kiss Day", "event": "Seal your love with a sweet kiss"},
    {"day": "14 Valentine's Day", "event": "Celebrate your love together"},
  ];
}
