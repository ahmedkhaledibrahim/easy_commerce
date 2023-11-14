import 'package:easy_commerce/logic/bloc/auth/auth_bloc.dart';
import 'package:easy_commerce/logic/bloc/wears/wears_bloc.dart';


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
    BlocProvider.of<WearsBloc>(context).add(RetrieveWearsEvent());
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      BlocProvider.of<WearsBloc>(context).add(RetrieveWearsEvent());
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
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 10.0),
                  child: Text(
                    "Male Clothes",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.blueAccent),
                  ),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.9,
              ),
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: BlocBuilder<WearsBloc, WearsState>(
                builder: (context, state) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemCount: BlocProvider.of<WearsBloc>(context)
                      .listOfMaleWears
                      .length,
                  itemBuilder: (context, index) {
                    if (state is WearsLoaded &&
                        BlocProvider.of<WearsBloc>(context)
                            .listOfMaleWears
                            .isNotEmpty) {
                      return ClipRect(
                        child: Hero(
                          tag:
                          "${BlocProvider.of<WearsBloc>(context).listOfMaleWears[index].id}",
                          child: CustomProductCard(
                              product: BlocProvider.of<WearsBloc>(context)
                                  .listOfMaleWears[index]),
                        ),
                      );
                    } else if (state is WearsLoaded &&
                        BlocProvider.of<WearsBloc>(context)
                            .listOfMaleWears
                            .isEmpty) {
                      return const Text("No Products");
                    } else if (state is WearsLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is WearsFailed) {
                      return const Text("No Products");
                    }
                    return null;
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 10.0),
                  child: Text(
                    "Female Clothes",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.blueAccent),
                  ),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.9,
              ),
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: BlocBuilder<WearsBloc, WearsState>(
                builder: (context, state) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemCount: BlocProvider.of<WearsBloc>(context)
                      .listOfFemaleWears
                      .length,
                  itemBuilder: (context, index) {
                    if (state is WearsLoaded &&
                        BlocProvider.of<WearsBloc>(context)
                            .listOfFemaleWears
                            .isNotEmpty) {
                      return ClipRect(
                        child: Hero(
                          tag:
                              "${BlocProvider.of<WearsBloc>(context).listOfFemaleWears[index].id}",
                          child: CustomProductCard(
                              product: BlocProvider.of<WearsBloc>(context)
                                  .listOfFemaleWears[index]),
                        ),
                      );
                    } else if (state is WearsLoaded &&
                        BlocProvider.of<WearsBloc>(context)
                            .listOfFemaleWears
                            .isEmpty) {
                      return const Text("No Products");
                    } else if (state is WearsLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is WearsFailed) {
                      return const Text("No Products");
                    }
                    return const Text("No Products");
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
                    "${BlocProvider.of<AuthBloc>(context).state} + ${BlocProvider.of<WearsBloc>(context).state}"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
