import 'package:bloc/bloc.dart';
import 'package:easy_commerce/data/local/userServices.dart';

import 'package:easy_commerce/data/models/customer.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


import '../../../data/models/user.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoading()) {
    on<AuthEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is SignUpEvent) {
        emit(AuthLoading());
        try {
          String message = await event.customer.signUp(event.customer.email,
              event.customer.password, event.customer.name);
          if (message.isEmpty) {
            emit(AuthUserSuccess());
            await UserServices.authenticationSuccess(event.customer);
            //UsersRepository.addUser(event.user);
          } else if (message.isNotEmpty) {
            emit(AuthFailure(errorMessage: message));
          }
        } catch (e) {
          emit(AuthFailure(errorMessage: e.toString()));
          throw Exception(e);
        }
      } else if (event is LoginEvent) {
        emit(AuthLoading());
        try {
          var returnedData =
              await event.user.signIn(event.user.email, event.user.password);
          if (returnedData is String) {
            emit(AuthFailure(errorMessage: returnedData));
          } else if (returnedData is UserModel) {
            if (returnedData.role == 'admin') {
              emit(AuthAdminSuccess());
              await UserServices.authenticationSuccess(returnedData);
            } else if (returnedData.role == 'customer') {
              emit(AuthUserSuccess());
              await UserServices.authenticationSuccess(returnedData);
            }
          }
        } catch (e) {
          emit(AuthFailure(errorMessage: e.toString()));
          throw Exception(e);
        }
      } else if (event is LogoutEvent) {
        emit(AuthLoading());
        try {
          await UserServices.logout();
          emit(AuthLoggedout());
        } catch (e) {
          throw Exception(e);
        }
      } else if (event is CheckAuthStatus) {
        try {
          String status = await UserServices.getAuthStatus();
          if (status == 'admin') {
            emit(AuthAdminSuccess());
          } else if (status == 'customer') {
            emit(AuthUserSuccess());
          } else {
            emit(AuthLoggedout());
          }
        } catch (e) {
          throw Exception(e);
        }
      }
    });
  }
}
