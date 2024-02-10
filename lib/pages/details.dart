import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  final String day;
  final String event;
  final Map<String, dynamic> additionalInfo;

  DetailsPage({
    required this.day,
    required this.event,
    required this.additionalInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 190, 203),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 234, 94, 141),
        title: Text(day),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Here are some ideas for you",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildAdditionalInfo(context, additionalInfo),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo(
    BuildContext context,
    Map<String, dynamic> additionalInfo,
  ) {
    List<Widget> widgets = [];

    additionalInfo.forEach((category, details) {
      widgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              category,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
          ],
        ),
      );

      if (details is Map) {
        details.forEach((subCategory, subDetails) {
          if (subDetails is List) {
            List<Widget> placeWidgets = [];
            for (var place in subDetails) {
              placeWidgets.add(
                ListTile(
                  title: Text(
                    place,
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    if (place.startsWith("http")) {
                      _launchURL(place);
                    }
                  },
                ),
              );
            }
            widgets.addAll(placeWidgets);
          } else if (subDetails is Map) {
            subDetails.forEach((nestedCategory, nestedDetails) {
              widgets.add(
                ListTile(
                  title: Text(
                    "$subCategory - $nestedCategory",
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: nestedDetails is String
                      ? Text(
                          nestedDetails,
                          style: TextStyle(fontSize: 14),
                        )
                      : null,
                  onTap: () {
                    if (nestedDetails is String &&
                        nestedDetails.startsWith("http")) {
                      _launchURL(nestedDetails);
                    }
                  },
                ),
              );
            });
          } else {
            widgets.add(
              ListTile(
                title: Text(
                  subCategory,
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: subDetails is String
                    ? Text(
                        subDetails,
                        style: TextStyle(fontSize: 14),
                      )
                    : null,
                onTap: () {
                  if (subDetails is String && subDetails.startsWith("http")) {
                    _launchURL(subDetails);
                  }
                },
              ),
            );
          }
        });
      } else if (details is String) {
        widgets.add(
          ListTile(
            title: Text(
              details,
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              if (details.startsWith("http")) {
                _launchURL(details);
              }
            },
          ),
        );
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
