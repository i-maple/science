import 'package:flutter/material.dart';
import 'package:science/utils/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Our Team',
            style: kTitleTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          MemberCard(
              memberName: 'Nishant Pokhrel',
              onTap: () {},
              position: 'Software Engineer'),
          const SizedBox(
            height: 20,
          ),
          MemberCard(
            memberName: 'Laxmi Dhungel',
            onTap: () {},
            position: 'Science Teacher',
          ),
          const SizedBox(
            height: 20,
          ),
          MemberCard(
            memberName: 'Laxmi Dhungel',
            onTap: () {},
            position: 'Science Teacher',
          ),
          const SizedBox(
            height: 20,
          ),
          MemberCard(
            memberName: 'Laxmi Dhungel',
            onTap: () {},
            position: 'Science Teacher',
          ),
        ],
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard(
      {Key? key,
      this.imageLink = 'assets/images/science.jpg',
      required this.memberName,
      required this.onTap,
      required this.position})
      : super(key: key);

  final String memberName;
  final String position;
  final VoidCallback onTap;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(imageLink),
          ),
          Column(
            children: [
              Text(
                memberName.toUpperCase(),
                style: kAppbarTitleTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(position),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'Contact',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
