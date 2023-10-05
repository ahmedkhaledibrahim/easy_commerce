import 'package:flutter/material.dart';

import '../widgets/bottomNavBar.dart';
import '../widgets/customAppBar.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: CustomAppBar(title: 'Profile',inApp: true,),
     bottomNavigationBar: BottomNavBar(),
     body: Center(child: Text('Profile'),),
   );
  }
}
