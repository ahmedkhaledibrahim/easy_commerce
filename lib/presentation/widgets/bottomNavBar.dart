import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: (){
            Navigator.of(context).pushReplacementNamed('/home');
          }, icon: const Icon(Icons.home),iconSize: 30,color: Colors.white,),
          IconButton(onPressed: (){
            Navigator.of(context).pushReplacementNamed('/cart');
          }, icon: const Icon(Icons.shopping_cart),iconSize: 30,color: Colors.white,),
          IconButton(onPressed: (){
            Navigator.of(context).pushReplacementNamed('/profile');
          }, icon: const Icon( Icons.person),iconSize: 30,color: Colors.white,),
        ],
      )
    );
  }
}
