import 'package:flutter/material.dart';

import '../widgets/bottomNavBar.dart';
import '../widgets/customAppBar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart',inApp: true),
      bottomNavigationBar: BottomNavBar(),
      body: Center(child: Text('Cart'),),
    );
  }
}
