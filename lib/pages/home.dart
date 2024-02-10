import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text("Valentine Special",
            style: GoogleFonts.loveLight(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold)),
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
          SizedBox(height: 20),
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
        "How to select Roses": {
          "site you can visit":
              "https://indianexpress.com/article/what-is/rose-day-2024-from-date-to-significance-everything-you-need-to-know-9146639/"
        },
        "Roses you can Buy": {
          "flower bouquet":
              "https://www.amazon.in/s?k=flower+bouquet&crid=9VWYNLX3SBXH&sprefix=flowe+bouque%2Caps%2C309&ref=nb_sb_noss_2",
          "couple watches":
              "https://www.amazon.in/s?k=couple+watches+titan+1639&crid=FS8CRVMGVTJQ&sprefix=couple+watches+titan+163%2Caps%2C254&ref=nb_sb_noss",
          "explore more":
              "https://www.amazon.in/s?k=couple+gifts+valentine&crid=31D6EILYKLCFE&sprefix=couple+gifts+valentines%2Caps%2C293&ref=nb_sb_noss"
        },
        "Places you can Explore": {
          "Lodhi Garden":
              "https://www.google.com/maps/dir/NSUT,+Azad+Hind+Fauj+Marg,+Dwarka+Sector-3,+Dwarka,+Delhi/Lodhi+Rd,+Lodhi+Gardens,+Lodhi+Estate,+New+Delhi,+Delhi+110003/@28.588883,77.0454204,12z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x390d05dd375e5a13:0x108adaa3abe4bd07!2m2!1d77.0379647!2d28.6100216!1m5!1m1!1s0x390ce2ececc92e35:0x86c0764b1c0d4bea!2m2!1d77.2196794!2d28.5930959?entry=ttu",
          "Sunder Nursery":
              "https://www.google.com/maps/dir/NSUT,+Azad+Hind+Fauj+Marg,+Dwarka+Sector-3,+Dwarka,+Delhi/Sunder+Nursery,+Bharat+Scouts+and+Guides+Marg,+Opposite+%E0%A4%B9%E0%A5%81%E0%A4%AE%E0%A4%BE%E0%A4%AF%E0%A5%82%E0%A4%82+%E0%A4%9F%E0%A5%89%E0%A4%AE%E0%A5%8D%E0%A4%AC+%E0%A4%AA%E0%A4%BE%E0%A4%B0%E0%A5%8D%E0%A4%95,+Nizamuddin,+National+Zoological+Park,+Sundar+Nagar,+New+Delhi,+Delhi/@28.588883,77.0578673,12z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x390d05dd375e5a13:0x108adaa3abe4bd07!2m2!1d77.0379647!2d28.6100216!1m5!1m1!1s0x390ce31c00aad2d5:0x5c0ec58c756cec82!2m2!1d77.2451691!2d28.5956467?entry=ttu",
          "More you can exlore":
              "https://www.tripadvisor.in/Attractions-g304551-Activities-c57-t58-New_Delhi_National_Capital_Territory_of_Delhi.html"
        },
      }
    },
    {
      "day": "8 Propose Day",
      "event": "Take the next step in your relationship",
      "additionalInfo": {
        "Gifts you can offer while proposing": {
          "explore more":
              "https://www.amazon.in/Om-Jewells-Illuminating-Adjustable-FR1000922/dp/B07B9D83QM/ref=sr_1_7?crid=FLUSTMLWJK09&keywords=rings&qid=1707562224&sprefix=ring%2Caps%2C205&sr=8-7",
          "special gifts":
              "https://www.amazon.in/Okos-Adjustable-Bracelet-Decorated-BROK1000009/dp/B08LKCLRY6/ref=sr_1_5?crid=26VBMBSYVR8Y2&keywords=bracelet+for+woman&qid=1707562256&sprefix=brace%2Caps%2C208&sr=8-5"
        },
        "Places For a Date with partner": {
          "Guftagu Cafe":
              "https://www.google.com/maps/dir/NSUT,+Azad+Hind+Fauj+Marg,+Dwarka+Sector-3,+Dwarka,+Delhi/Guftagu+Cafe,+34+Main+Road,+DLF+Phase+2,+Sector+25,+Gurugram,+Haryana/@28.5468379,76.9809903,12z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x390d05dd375e5a13:0x108adaa3abe4bd07!2m2!1d77.0379647!2d28.6100216!1m5!1m1!1s0x390d192e241cf5ff:0xe07747ba5a08dbf0!2m2!1d77.094825!2d28.4852699?entry=ttu",
          "Big tree Cafe":
              "https://www.google.com/maps/dir/NSUT,+Azad+Hind+Fauj+Marg,+Dwarka+Sector-3,+Dwarka,+Delhi/The+Big+Tree+Cafe,+opposite+Paras+Quartier,+Gwal+Pahari,+Gurugram,+Haryana/@28.5223577,76.9992864,12z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x390d05dd375e5a13:0x108adaa3abe4bd07!2m2!1d77.0379647!2d28.6100216!1m5!1m1!1s0x390d19f50603f797:0x58d281926f5de632!2m2!1d77.1323344!2d28.4364957?entry=ttu",
        },
        "Proposing Quotes": {
          "Propose using these beautiful quotes":
              "https://awbi.in/happy-propose-day-2024-wishes-quotes-messages/"
        }
      }
    },
    {
      "day": "9 Chocolate Day",
      "event": "Spread love with chocolates",
      "additionalInfo": {
        "Buy Chocolates for loved Ones": {
          "chocolate":
              "https://www.fnp.com/chocolates-lp?promo=redirectionsearch-chocolate",
          "Kitkat": "https://www.kitkat.in/",
          "Cadbury":
              "https://cadburygifting.in/occasions/valentines-day-gifts.html?utm_campaign=&tm_medium=cpc&utm_source=google&utm_content=Valentine24&gad_source=1&gclid=CjwKCAiA2pyuBhBKEiwApLaIOxs72I-N6ZPw1WChY8wY9iZOMV3YFY0KUpX2PgrpsD-encp7fe25JxoC45YQAvD_BwE"
        },
        "BOOK MOVIE": {
          "BOOK MY SHOW":
              "https://in.bookmyshow.com/explore/home/national-capital-region-ncr",
          "PVR": "https://www.pvrcinemas.com/",
          "JUST DIAL": "https://www.justdial.com/Delhi/PVR-INOX/"
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
        "Perfect places to visit": {
          "Perfect places for the day": [
            "THE GARDEN OF FIVE SENSES ",
            "JHEEL PARK",
            "ROSE CAFE ",
            "PACIFIC MALL",
          ],
        },
        "Things to make the day special": {
          "Gifts": "https://www.amazon.in/Hug-Day-Gift/s?k=Hug+Day+Gift",
          "FNP":
              "https://www.fnp.com/gifts/hug-day-lp?utm_source=Google&utm_medium=cpc&utm_campaign=165874490&utm_adgroup=135962746761&utm_keyword=hug%20day%20gifts&utm_device=c&utm_placement=&utm_network=g&gad_source=1&gclid=CjwKCAiAq4KuBhA6EiwArMAw1IViRSo2Fi32bsMM-ddZLfgumbnj8rD6iP5AHmXY8wzMVU9oYjjoBhoC9IoQAvD_BwE",
          "Memories":
              "https://www.floweraura.com/hug-day?gclid=CjwKCAiAq4KuBhA6EiwArMAw1OsxwBkYXDKLQGV8Cz_BfUgvxvpCQVxyIIfz6BS3W52LfKmnGy6CHBoCcp4QAvD_BwE:G:s&keyword=happy+hug+day+gift&fa-matchtype=p&fa-adid=645965398254&fa-network=g&fa-device=c&fa-devicemodel=&fa-physicallocation=9061699&fa-geointent=&gad_source=1",
        },
      }
    },
    {
      "day": "13 Kiss Day",
      "event": "Seal your love with a sweet kiss",
      "additionalInfo": {
        "Best locations For the day": {
          "Perfect place for the day": {
            "JHEEL PARK":
                "https://www.google.com/maps/dir/Netaji+Subhas+University+of+Technology,+Azad+Hind+Fauj+Marg,+Dwarka+Sector-3,+Dwarka,+Delhi/269,+Manak+Vihar,+Tihar+Village,+New+Delhi,+Delhi,+110018/@28.6202743,77.0508286,14z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x390d05dd375e5a13:0x108adaa3abe4bd07!2m2!1d77.0379647!2d28.6100216!1m5!1m1!1s0x390d035eb91789c7:0x5adc9b62d1e8a3c6!2m2!1d77.107031!2d28.6309688?entry=ttu",
            "ROSE CAFE":
                "https://www.google.com/maps/dir/Netaji+Subhas+University+of+Technology,+Azad+Hind+Fauj+Marg,+Dwarka+Sector-3,+Dwarka,+Delhi/Rose+Cafe,+Westend+Marg,+Butterfly+Park,+Saiyad+Ul+Ajaib+Extension,+Saket,+New+Delhi,+Delhi/@28.5639961,77.0369939,12z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x390d05dd375e5a13:0x108adaa3abe4bd07!2m2!1d77.0379647!2d28.6100216!1m5!1m1!1s0x390ce1e407a7bc3f:0xe4daa7dba1c7f579!2m2!1d77.1982881!2d28.517792?entry=ttu",
            "VEGAS MALL":
                "https://www.google.com/maps/dir/Netaji+Subhas+University+of+Technology,+Azad+Hind+Fauj+Marg,+Dwarka+Sector-3,+Dwarka,+Delhi/Vegas+Mall,+Pocket+1,+Sector+14+Dwarka,+Dwarka,+Delhi/@28.6046357,77.0285702,16z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x390d05dd375e5a13:0x108adaa3abe4bd07!2m2!1d77.0379647!2d28.6100216!1m5!1m1!1s0x390d1dd61eb460af:0xe89377d97456bc5e!2m2!1d77.029572!2d28.6007474?entry=ttu",
          },
        },
        "Get you corner tickets fast": {
          "BOOK MOVIE": {
            "BOOK MY SHOW":
                "https://in.bookmyshow.com/explore/home/national-capital-region-ncr",
            "PVR": "https://www.pvrcinemas.com/",
            "JUST DIAL": "https://www.justdial.com/Delhi/PVR-INOX/"
          },
        }
      }
    },
    {
      "day": "14 Valentine's Day",
      "event": "The Day Only Made for Spreading love",
      "additionalInfo": {
        "For you Valentine": {
          "flower bouquet":
              "https://www.amazon.in/s?k=flower+bouquet&crid=9VWYNLX3SBXH&sprefix=flowe+bouque%2Caps%2C309&ref=nb_sb_noss_2",
          "couple watches":
              "https://www.amazon.in/s?k=couple+watches+titan+1639&crid=FS8CRVMGVTJQ&sprefix=couple+watches+titan+163%2Caps%2C254&ref=nb_sb_noss",
          "explore more":
              "https://www.amazon.in/s?k=couple+gifts+valentine&crid=31D6EILYKLCFE&sprefix=couple+gifts+valentines%2Caps%2C293&ref=nb_sb_noss"
        },
        "BOOK MOVIE": {
          "BOOK MY SHOW":
              "https://in.bookmyshow.com/explore/home/national-capital-region-ncr",
          "PVR": "https://www.pvrcinemas.com/",
          "JUST DIAL": "https://www.justdial.com/Delhi/PVR-INOX/"
        },
        "Last but not the Least": {
          "Spend Time Together": "https://www.oyorooms.com/"
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
