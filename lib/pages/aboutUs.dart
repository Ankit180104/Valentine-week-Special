import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  final List<Contributor> contributors = [
    Contributor(
      name: 'Anmol',
      image: 'lib/images/anmol.jpg', // Replace with the path to your image
      details: 'Details about Contributor 1.',
    ),
    Contributor(
      name: 'Contributor 2',
      image: 'assets/contributor2.jpg', // Replace with the path to your image
      details: 'Details about Contributor 2.',
    ),
    Contributor(
      name: 'Contributor 3',
      image: 'assets/contributor3.jpg', // Replace with the path to your image
      details: 'Details about Contributor 3.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
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
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(contributors[index].image),
                // You can also use NetworkImage for images from the internet
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
