import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valentine/pages/aboutUs.dart';
import 'package:valentine/pages/details.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 190, 203),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 234, 94, 141),
        title: Text("Sweet Birds"),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsPage()),
              );
            },
          )
        ],
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
    String valentineLink =
        "https://www.cadburysilk.com/?utm_medium=cpc&utm_source=google-ads&utm_campaign=chc_cadbury-dairy-milk-silk_in_janfeb_2024_inr_eng_vday-perf_est-123_in24cd10_std_core&utm_term=broad&utm_content=perfmax&gclid=EAIaIQobChMIrd7P69KVhAMVk6NmAh0HgwxsEAAYASAAEgIzevD_BwE";
//ANkit 
    return Container(
      width: 150,
      height: 120,
      margin: EdgeInsets.all(10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ElevatedButton(
          onPressed: () {
            if (buttonText == 'Valentine') {
              _launchURL(valentineLink);
            } else {
              _launchURL('https://tinder.com/');
            }
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
        },
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
    {
      "day": "10 Teddy Day",
      "event": "Gift a cute teddy bear to your loved one",
      "additionalInfo": {
        "Teddy day": {
          "Myntra": "https://www.myntra.com/teddy-bear",
          "firstcry":
              "https://www.firstcry.com/soft-toys/teddy-bears?cid=5&scid=101&sub-type=t1-1797",
          "amazon": "https://www.amazon.in/Soft-Toys/b?ie=UTF8&node=1378445031",
          "gogift": "https://www.gogift.in/gift/by-type/teddy-bear"
        }
      }
    },
    {
      "day": "11 Promise Day",
      "event": "Make a promise to your loved one",
      "additionalInfo": {
        "Promise day": {
          "quotes":
              "https://indianexpress.com/article/lifestyle/life-style/happy-promise-day-2023-wishes-status-images-quotes-sms-whatsapp-messages-shayari-photos-8401202/",
          "gifts": {
            "FNP":
                "https://www.fnp.com/gifts/promise-day-lp?utm_source=Google&utm_medium=cpc&utm_campaign=165874490&utm_adgroup=135962747001&utm_keyword=promise%20day%20gifts&utm_device=c&utm_placement=&utm_network=g&gad_source=1&gclid=CjwKCAiAq4KuBhA6EiwArMAw1InKfeeUoOR6PkThQskXfP6nZQpAmgO5aFHzP4yJrtmgA7sGkk-m9BoCAm0QAvD_BwE",
            "amazon":
                "https://www.amazon.in/s?k=promise+day+gifts&adgrpid=58936767356&ext_vrnc=hi&gclid=CjwKCAiAq4KuBhA6EiwArMAw1MtSl7zKvGDSNeBEBJEOiy0HMyYgJqFhimxyxtbdz2WixAgxpZ947RoCxr0QAvD_BwE&hvadid=590750011401&hvdev=c&hvlocphy=9061699&hvnetw=g&hvqmt=e&hvrand=7573430211416962338&hvtargid=kwd-355610419334&hydadcr=10525_2130650&tag=googinhydr1-21&ref=pd_sl_8oelvq17mf_e"
          }
        }
      }
    },
    {
      "day": "12 Hug Day",
      "event": "Show your love with a warm hug",
      "additionalInfo": {
        "Hug day": {
          "perfect places": [
            "THE GARDEN OF FIVE SENSES: https://maps.app.goo.gl/RyNymnLyazyCyZvZ7",
            "JHEEL PARK: https://maps.app.goo.gl/y8eHYnydGyGxcgpm7",
            "ROSE CAFE: https://maps.app.goo.gl/HZ5Fjc2Ci4hGNemk7",
            "PACIFIC MALL: https://maps.app.goo.gl/bctka8u2kZwvqvbM9",
            "VEGAS MALL: https://maps.app.goo.gl/vHsEsPs5VVxvGxZ87"
          ],
          "gifts": {
            "amazon": "https://www.amazon.in/Hug-Day-Gift/s?k=Hug+Day+Gift",
            "FNP":
                "https://www.fnp.com/gifts/hug-day-lp?utm_source=Google&utm_medium=cpc&utm_campaign=165874490&utm_adgroup=135962746761&utm_keyword=hug%20day%20gifts&utm_device=c&utm_placement=&utm_network=g&gad_source=1&gclid=CjwKCAiAq4KuBhA6EiwArMAw1IViRSo2Fi32bsMM-ddZLfgumbnj8rD6iP5AHmXY8wzMVU9oYjjoBhoC9IoQAvD_BwE",
            "Flower aura":
                "https://www.floweraura.com/hug-day?gclid=CjwKCAiAq4KuBhA6EiwArMAw1OsxwBkYXDKLQGV8Cz_BfUgvxvpCQVxyIIfz6BS3W52LfKmnGy6CHBoCcp4QAvD_BwE:G:s&keyword=happy+hug+day+gift&fa-matchtype=p&fa-adid=645965398254&fa-network=g&fa-device=c&fa-devicemodel=&fa-physicallocation=9061699&fa-geointent=&gad_source=1",
          }
        }
      }
    },
    {
      "day": "13 Kiss Day",
      "event": "Seal your love with a sweet kiss",
      "additionalInfo": {
        "Kiss day": {
          "BOOK MOVIE": {
            "BOOK MY SHOW":
                "https://in.bookmyshow.com/explore/home/national-capital-region-ncr",
            "PVR": "https://www.pvrcinemas.com/",
            "JUST DIAL": "https://www.justdial.com/Delhi/PVR-INOX/"
          },
          'perfect places': [
            "THE GARDEN OF FIVE SENSES: https://goo.gl/maps/YnQZSngkNU2dfNwPA",
            "JHEEL PARK: https://goo.gl/maps/y8eHYnydGyGxcgpm7",
            "ROSE CAFE: https://goo.gl/maps/HZ5Fjc2Ci4hGNemk7",
            "PACIFIC MALL: https://goo.gl/maps/bctka8u2kZwvqvbM9",
            "VEGAS MALL: https://goo.gl/maps/vHsEsPs5VVxvGxZ87"
          ]
        }
      }
    },
    {
      "day": "14 Valentine's Day",
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
        },
      }
    },
  ];
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
