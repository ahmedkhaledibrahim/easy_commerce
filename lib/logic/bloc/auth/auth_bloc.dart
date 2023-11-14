import 'package:bloc/bloc.dart';
import 'package:easy_commerce/data/local/userServices.dart';

import 'package:easy_commerce/data/models/customer.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/user.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserServices userServices;

  AuthBloc(this.userServices) : super(AuthLoading()) {
    on<SignUpEvent>(_handleSignupEvent);
    on<LoginEvent>(_handleLoginEvent);
    on<LogoutEvent>(_handleLogoutEvent);
    on<CheckAuthStatus>(_handleCheckAuthStatusEvent);
  }

  Future<void> _handleSignupEvent(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      String message = await event.customer.signUp(
          event.customer.email, event.customer.password, event.customer.name);
      if (message.isEmpty) {
        emit(AuthUserSuccess());
        await userServices.authenticationSuccess(event.customer);
      } else if (message.isNotEmpty) {
        emit(AuthFailure(errorMessage: message));
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
      throw Exception(e);
    }
  }

  Future<void> _handleLoginEvent(
      LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      var returnedData =
          await event.user.signIn(event.user.email, event.user.password);
      if (returnedData is String) {
        emit(AuthFailure(errorMessage: returnedData));
      } else if (returnedData is UserModel) {
        if (returnedData.role == 'admin') {
          emit(AuthAdminSuccess());
          await userServices.authenticationSuccess(returnedData);
        } else if (returnedData.role == 'customer') {
          emit(AuthUserSuccess());
          await userServices.authenticationSuccess(returnedData);
        }
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
      throw Exception(e);
    }
  }

  Future<void> _handleLogoutEvent(
      LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await userServices.logout();
      emit(AuthLoggedout());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _handleCheckAuthStatusEvent(
      CheckAuthStatus event, Emitter<AuthState> emit) async {
    try {
      String status = await userServices.getAuthStatus();
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
}
