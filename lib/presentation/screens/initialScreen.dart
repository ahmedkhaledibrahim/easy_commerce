import 'package:easy_commerce/logic/bloc/auth/auth_bloc.dart';

import 'package:easy_commerce/presentation/screens/authentication_screen.dart';
import 'package:easy_commerce/presentation/screens/home_screen.dart';
import 'package:easy_commerce/presentation/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'adminHome_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(CheckAuthStatus());
    // BlocProvider.of<WearsBloc>(context).add(RetrieveWearsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        Future.delayed(Duration(seconds: 2)).then((value) => {
              if (BlocProvider.of<AuthBloc>(context).state is AuthUserSuccess)
                {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ))
                }
              else if (BlocProvider.of<AuthBloc>(context).state
                  is AuthAdminSuccess)
                {
                  {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminHomeScreen(),
                        ))
                  }
                }
              else
                {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthenticationScreen(),
                      ))
                }
            });
      },
      child: Scaffold(
        appBar: CustomAppBar(title: 'Easy Commerce', inApp: false),
        body: const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
