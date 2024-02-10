import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  final List<Contributor> contributors = [
    Contributor(
      name: 'Anmol Singh Sokhi',
      image: 'lib/images/anmol.jpg', // Replace with the path to your image
      details:
          'Hi there! My name is Anmol Singh Sokhi and I am currently pursuing a BTech degree in Instrumentation and Control Engineering from NSUT 🎓. I am proficient in the making Apps and build the website using flutter web with the help of other contributers. Many more are already planned and will be executed with time.',
    ),
    Contributor(
      name: 'Ankit Kumar Sharma',
      image: 'images/ankit.jpg', // Replace with the path to your image
      details:
          'Hi there! My name is Ankit Kumar Sharma and I am currently pursuing a BTech degree in Instrumentation and Control Engineering from NSUT 🎓. While learning web development got the idea to explore more in this field so with the help of my classmates we started to build this website for this special week of february. The basic purpose of this website is to just help out others on how to celebrate their week. Many more are already planned and will be executed with time. ',
    ),
    Contributor(
      name: 'Vishal Kaneki',
      image: 'images/vishal.jpg', // Replace with the path to your image
      details:
          'Hi there! My name is Vishal Kaneki and I am currently pursuing a BTech degree in Instrumentation and Control Engineering from NSUT 🎓. With a keen interest in freelancing i helped others in making this fun website for this special week. Many more are already planned and will be executed with time.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us', style: GoogleFonts.happyMonkey(
                  fontSize: 70,
    
                  color:Colors.black), ), 
      ),
      body: ListView.builder(
        itemCount: contributors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showContributorDetails(context, contributors[index]);
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(contributors[index].image),
                  ),
                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  void _showContributorDetails(BuildContext context, Contributor contributor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContributorDetailsPage(contributor: contributor),
      ),
    );
  }
}

class Contributor {
  final String name;
  final String image;
  final String details;

  Contributor({
    required this.name,
    required this.image,
    required this.details,
  });
}

class ContributorDetailsPage extends StatelessWidget {
  final Contributor contributor;

  ContributorDetailsPage({required this.contributor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contributor.name),
      ),
      body: Padding(
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
            Text(
              contributor.details,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
