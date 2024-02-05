// details.dart
import 'dart:js' as js;

import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 234, 94, 141),
        title: Text(day),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Here are some ideas for you",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _buildAdditionalInfo(context, additionalInfo),
          ],
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(
                category,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      );

      if (details is Map) {
        details.forEach((subCategory, subDetails) {
          if (subDetails is List) {
            // Handle the case where subDetails is a list (e.g., "perfect places")
            List<Widget> placeWidgets = [];
            for (var place in subDetails) {
              placeWidgets.add(
                Expanded(
                  child: ListTile(
                    title: Text(place),
                    onTap: () {
                      if (place.startsWith("http")) {
                        _launchURL(place);
                      }
                    },
                  ),
                ),
              );
            }
            widgets.addAll(placeWidgets);
          } else if (subDetails is Map) {
            subDetails.forEach((nestedCategory, nestedDetails) {
              widgets.add(
                Expanded(
                  child: ListTile(
                    title: Text("$subCategory - $nestedCategory"),
                    subtitle:
                        nestedDetails is String ? Text(nestedDetails) : null,
                    onTap: () {
                      if (nestedDetails is String &&
                          nestedDetails.startsWith("http")) {
                        _launchURL(nestedDetails);
                      }
                    },
                  ),
                ),
              );
            });
          } else {
            widgets.add(
              Expanded(
                child: ListTile(
                  title: Text(subCategory),
                  subtitle: subDetails is String ? Text(subDetails) : null,
                  onTap: () {
                    if (subDetails is String && subDetails.startsWith("http")) {
                      _launchURL(subDetails);
                    }
                  },
                ),
              ),
            );
          }
        });
      } else if (details is String) {
        widgets.add(
          Expanded(
            child: ListTile(
              title: Text(details),
              onTap: () {
                if (details.startsWith("http")) {
                  _launchURL(details);
                }
              },
            ),
          ),
        );
      }
    });

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }

  void _launchURL(String url) {
    js.context.callMethod('open', [url]);
  }
}
