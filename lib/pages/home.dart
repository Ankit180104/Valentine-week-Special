import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valentine/pages/details.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 190, 203),
      appBar: AppBar(
        centerTitle: true,
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
                return _buildDayButton(
                  dayData["day"]!,
                  dayData["event"],
                  dayData["additionalInfo"],
                );
              } else {
                return Container(); // Empty container for dates beyond Valentine's Day
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDayButton(
      String day, String? event, Map<String, dynamic> additionalInfo) {
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
                Get.to(() => DetailsPage(
                      day: formattedDate,
                      event: event,
                      additionalInfo: additionalInfo,
                    ));
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

  List<Map<String, dynamic>> calendarDays = [
    {
      "day": "7 Rose Day",
      "event": "Express your love with roses",
      "additionalInfo": {
        "gifts": {
          "flower bouquet":
              "https://www.amazon.in/s?k=flower+bouquet&crid=9VWYNLX3SBXH&sprefix=flowe+bouque%2Caps%2C309&ref=nb_sb_noss_2",
          "couple watches":
              "https://www.amazon.in/s?k=couple+watches+titan+1639&crid=FS8CRVMGVTJQ&sprefix=couple+watches+titan+163%2Caps%2C254&ref=nb_sb_noss",
          "explore more":
              "https://www.amazon.in/s?k=couple+gifts+valentine&crid=31D6EILYKLCFE&sprefix=couple+gifts+valentines%2Caps%2C293&ref=nb_sb_noss"
        },
        "book hotels": "https://www.oyorooms.com/",
        "BOOK MOVIE": {
          "BOOK MY SHOW":
              "https://in.bookmyshow.com/explore/home/national-capital-region-ncr",
          "PVR": "https://www.pvrcinemas.com/",
          "JUST DIAL": "https://www.justdial.com/Delhi/PVR-INOX/"
        }
      }
    },
    {
      "day": "8 Propose Day",
      "event": "Take the next step in your relationship",
      "additionalInfo": {
        "rose day": {
          "explore more":
              "https://www.amazon.in/s?k=couple+gifts+valentine&crid=31D6EILYKLCFE&sprefix=couple+gifts+valentines%2Caps%2C293&ref=nb_sb_noss",
          "special gifts":
              "https://www.amazon.in/s?k=rose+day+gift&crid=1RULYOZTPWD5I&sprefix=rose+day+%2Caps%2C325&ref=nb_sb_ss_ts-doa-p_1_9"
        }
      }
    },
    {
      "day": "9 Chocolate Day",
      "event": "Indulge in sweet moments together",
      "additionalInfo": {
        "Propose day": {
          "chocolate":
              "https://www.fnp.com/chocolates-lp?promo=redirectionsearch-chocolate",
          "rose": "https://www.fnp.com/roses-lp?promo=redirectionsearch",
          "perfect places": [
            "THE GARDEN OF FIVE SENSES: https://maps.app.goo.gl/RyNymnLyazyCyZvZ7",
            "JHEEL PARK: https://maps.app.goo.gl/y8eHYnydGyGxcgpm7",
            "ROSE CAFE: https://maps.app.goo.gl/HZ5Fjc2Ci4hGNemk7",
            "PACIFIC MALL: https://maps.app.goo.gl/bctka8u2kZwvqvbM9",
            "VEGAS MALL: https://maps.app.goo.gl/vHsEsPs5VVxvGxZ87"
          ],
          "BOOK MOVIE": {
            "BOOK MY SHOW":
                "https://in.bookmyshow.com/explore/home/national-capital-region-ncr",
            "PVR": "https://www.pvrcinemas.com/",
            "JUST DIAL": "https://www.justdial.com/Delhi/PVR-INOX/"
          }
        }
      }
    },
    // Add entries for other days similarly
  ];
}
