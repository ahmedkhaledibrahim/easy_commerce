import 'package:easy_commerce/logic/bloc/wears/wears_bloc.dart';
import 'package:easy_commerce/presentation/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/auth/auth_bloc.dart';


class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Easy Commerce', inApp: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Admin"),
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
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/adminaddproduct');
                  },
                  child: const Card(
                    elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 34),
                        Text(
                          "Add Product",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                const Card(
                  elevation: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 34),
                      Text("Users", style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
                const Card(
                  elevation: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.show_chart, size: 34),
                      Center(
                          child: Text("Most Popular",
                              style: TextStyle(fontSize: 20)))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
