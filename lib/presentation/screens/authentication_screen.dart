import 'package:easy_commerce/logic/bloc/auth/auth_bloc.dart';
import 'package:easy_commerce/presentation/widgets/alertDialogWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/customer.dart';
import '../widgets/customAppBar.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool _isLoginForm = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void toggleFormMode() {
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Easy Commerce", inApp: false),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset('assets/images/cart_icon.png',
                      height: MediaQuery.of(context).size.height * 0.15),
                ),
                !_isLoginForm
                    ? Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Name';
                              }
                              return null;
                            },
                            controller: _nameController,
                            decoration: InputDecoration(labelText: 'Name'),
                          ),
                          SizedBox(height: 12.0),
                        ],
                      )
                    : const SizedBox(),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Email';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    // TODO: implement listener}
                    if (state is AuthUserSuccess) {
                      Navigator.of(context).pushReplacementNamed('/home');
                    } else if (state is AuthAdminSuccess) {
                      Navigator.of(context).pushReplacementNamed('/adminhome');
                    } else if (state is AuthFailure) {
                      alertDialogWidget(
                          title: 'Authentication Problem',
                          content: state.errorMessage,
                          context: context);
                    }
                  },
                  child: MaterialButton(
                    child: Text(_isLoginForm ? 'Login' : 'Sign Up',
                        style: TextStyle(fontFamily: 'Avenir')),
                    color: Colors.black,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Customer customer = Customer(
                          name: _nameController.text,
                          password: _passwordController.text,
                          email: _emailController.text,
                        );
                        if (!_isLoginForm) {
                          BlocProvider.of<AuthBloc>(context)
                              .add(SignUpEvent(customer: customer));
                        } else if (_isLoginForm) {
                          BlocProvider.of<AuthBloc>(context)
                              .add(LoginEvent(user: customer));
                        }
                      }
                    },
                  ),
                ),
                MaterialButton(
                  child: Text(_isLoginForm
                      ? 'Create an account'
                      : 'Have an account? Sign in'),
                  onPressed: toggleFormMode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
