import 'package:easy_commerce/data/local/userServices.dart';
import 'package:easy_commerce/data/repositories/wears_repo.dart';
import 'package:easy_commerce/logic/bloc/auth/auth_bloc.dart';
import 'package:easy_commerce/presentation/routes.dart';
import 'package:easy_commerce/presentation/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


import 'logic/bloc/wears/wears_bloc.dart';
import 'logic/cubit/imagepicker_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(UserServices()),
        ),
        BlocProvider(
          create: (context) => WearsBloc(WearsRepository()),
        ),
        BlocProvider(
          create: (context) => ImagepickerCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: apptheme(),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
