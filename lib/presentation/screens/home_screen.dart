import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_commerce/data/models/product.dart';
import 'package:easy_commerce/data/repositories/products_repo.dart';
import 'package:easy_commerce/logic/bloc/auth/auth_bloc.dart';
import 'package:easy_commerce/logic/bloc/products/product_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bottomNavBar.dart';
import '../widgets/customAppBar.dart';
import '../widgets/customCarouselSlider.dart';
import '../widgets/customProductCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ProductBloc>(context).add(RetrieveProductsEvent());

    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      BlocProvider.of<ProductBloc>(context).add(RetrieveProductsEvent());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Easy Commerce',
        inApp: true,
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomCarouselSlider(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Card(
                      elevation: 5,
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/vegetable.png')),
                    ),
                    const Text('Vegetables'),
                  ],
                ),
                Column(
                  children: [
                    Card(
                      elevation: 5,
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/gadgets.png')),
                    ),
                    const Text('Electronics'),
                  ],
                ),
                Column(
                  children: [
                    Card(
                      elevation: 5,
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/male-clothes.png')),
                    ),
                    const Text('Clothes'),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0, top: 10.0),
                  child: Text(
                    "See All",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black54),
                  ),
                ),
              ),
            ),
            Container(

              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width,

              ),
              child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (MediaQuery.sizeOf(context).width /2) / (MediaQuery.sizeOf(context).height /3)
                      ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state.listOfProducts.length,
                          itemBuilder: (context, index) {
                            if (state is ProductLoaded &&
                                state.listOfProducts.isNotEmpty) {
                              return CustomProductCard(
                                  product: state.listOfProducts[index]);
                            } else if (state is ProductLoaded &&
                                state.listOfProducts.isEmpty) {
                              return const Text("No Products");
                            } else if (state is ProductLoading) {
                              return const CircularProgressIndicator();
                            } else if (state is ProductFailed) {
                              return const Text("No Products");
                            }
                          },
                        ),
              ),
            ),
            BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              return MaterialButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                  Navigator.pushReplacementNamed(context, '/authentication');
                },
                child: Text(
                    "${BlocProvider.of<AuthBloc>(context).state} + ${BlocProvider.of<ProductBloc>(context).state}"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
