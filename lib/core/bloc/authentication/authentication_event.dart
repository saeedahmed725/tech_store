part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}
class CheckFirstRunEvent extends AuthenticationEvent {

  @override
  List<Object?> get props => [];
}
