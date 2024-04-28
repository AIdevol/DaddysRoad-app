// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // final _formKey = GlobalKey<FormState>();
  AuthBloc() : super(AuthInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // Simulate network delay
      await Future.delayed(Duration(seconds: 2));
      // Here you should call your authentication API
      if (event.mobileNumber == '1234567890' && event.password == 'password') {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(error: 'Invalid credentials'));
      }
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}
