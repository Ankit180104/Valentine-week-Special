import 'package:flutter/material.dart';
import 'package:valentine/pages/about_details.dart';

class AboutUsPage extends StatelessWidget {
  final List<Contributor> contributors = [
    Contributor(
        name: 'Anmol Singh',
        image: 'lib/images/anmol.jpg', // Replace with the path to your image
        details:
            'Role: Mobile App and Web Developer\n Skills: Proficient in Flutter for app development and building websites.\n Currently pursuing a BTech degree in Instrumentation and Control Engineering from NSUT.\n Many more are already planned and will be executed with time.\n \n Co-Contributor\n Co-Founder',
        link: 'https://github.com/anmolIC03'),
    Contributor(
        name: 'Ankit Kumar Sharma',
        image: 'images/ankit.jpg', // Replace with the path to your image
        details:
            'Role: Web Developer\n Skills: Specializing in web development.\n Currently pursuing a BTech degree in Instrumentation and Control Engineering from NSUT. Co-founder\n Aims to help others celebrate special occasions through the website.\n \n Co-Contributor\n Co-Founder of this project.',
        link: 'https://github.com/Ankit180104'),
    Contributor(
        name: 'Vishal',
        image: 'images/vishal.jpg', // Replace with the path to your image
        details:
            'Role: Freelance Developer\n Skills: Pursuing a BTech degree in Instrumentation and Control Engineering from NSUT, contributes freelancing skills to create a fun website for special occasions.\n Actively participates in planning and executing future projects.\n \n Co-Contributor',
        link: 'https://github.com/Vishukaneki'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('About Us'),
        shadowColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.purple,
                Colors.pink,
                Colors.orange,
                Colors.yellow,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.purple,
              Colors.pink,
              Colors.orange,
              Colors.yellow,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: contributors.map((contributor) {
                  return GestureDetector(
                    onTap: () {
                      _showContributorDetails(context, contributor);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 200),
                          BouncingAvatar(
                            image: AssetImage(contributor.image),
                          ),
                          SizedBox(width: 50),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showContributorDetails(
      BuildContext context, Contributor contributor) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContributorDetailsPage(
          contributor: contributor,
        ),
      ),
    );
  }
}

class Contributor {
  final String name;
  final String image;
  final String details;
  final String link;

  Contributor({
    required this.link,
    required this.name,
    required this.image,
    required this.details,
  });
}

class BouncingAvatar extends StatefulWidget {
  final ImageProvider image;

  BouncingAvatar({required this.image});

  @override
  _BouncingAvatarState createState() => _BouncingAvatarState();
}

class _BouncingAvatarState extends State<BouncingAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return ScaleTransition(
            scale: _animation,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: widget.image,
            ),
          );
        },
      ),
    );
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
      if (_isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
