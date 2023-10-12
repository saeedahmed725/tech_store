import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  User? user;
  late SharedPreferences prefs;
  late bool finishedOnBoarding;

  AuthenticationBloc() : super(const AuthenticationState.unauthenticated()) {
    on<CheckFirstRunEvent>((event, emit) async {
      prefs = await SharedPreferences.getInstance();
      finishedOnBoarding = prefs.getBool('finishedOnBoarding') ?? false;
      if (!finishedOnBoarding) {
        emit(const AuthenticationState.onboarding());
      } else {
        emit(const AuthenticationState.unauthenticated());
        // check if user authenticated Or unauthenticated and emit states
      }
    });
  }
}
