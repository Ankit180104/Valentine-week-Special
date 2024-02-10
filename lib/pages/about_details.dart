import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valentine/pages/aboutUs.dart';

class ContributorDetailsPage extends StatelessWidget {
  final Contributor contributor;

  ContributorDetailsPage({required this.contributor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //change
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 228, 75, 180),
              Color.fromARGB(255, 186, 70, 151),
              Color(0xFFD54AA5),
              Color(0xFFE687C3),
              Color(0xFFE1C0F0),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  contributor.image,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBulletPoint(
                        'Name: ${contributor.name}',
                      ),
                      _buildBulletPoint('Details:'),
                      _buildBulletPoint('- ${contributor.details}'),
                      _buildBulletPoint(
                        'Checkout my Github here:',
                        url: contributor.link,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text, {String? url}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.arrow_right),
        title: url != null
            ? _buildLinkText(text: text, url: url)
            : Text(
                text,
                style: GoogleFonts.eczar(fontSize: 18, color: Colors.white),
              ),
      ),
    );
  }

  Widget _buildLinkText({required String text, required String url}) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.eczar(color: Colors.white, fontSize: 18),
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              color: Colors.blueAccent,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch(url);
              },
          ),
        ],
      ),
    );
  }
}
