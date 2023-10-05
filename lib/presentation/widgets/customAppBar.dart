import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool inApp;
  CustomAppBar({required this.title,required this.inApp});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        color: Colors.black,
        child:  Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black, size: 32),
       actions: [inApp ? IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)) : const SizedBox()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}
