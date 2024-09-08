import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lithabit/screens/profile/sections/bio_section.dart';
import 'package:lithabit/widgets/keep_reading_section.dart';
import 'package:lithabit/screens/profile/sections/level_progress_section.dart';
import 'package:lithabit/screens/profile/sections/statis_section.dart';

import '../../widgets/alart.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () async {
                    MyAlertDilaog.showMyDialog(
                      context: context,
                      title: 'Log Out',
                      content: 'Are you sure you want to log out?',
                      tabNo: () {
                        Navigator.pop(context);
                      },
                      tabYes: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    );
                  },
                  child: Icon(Icons.logout),
          )
        ],
        title: Text(
          "Khalid Hossen 🐫",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              BioSection(),
              SizedBox(height: 16.0),
              LevelProgressSection(),
              SizedBox(height: 16.0),
              StatisSection(),
              SizedBox(height: 16.0),
              KeepReadingSection(),
            ],
          ),
        ),
      ),
    );
  }
}
