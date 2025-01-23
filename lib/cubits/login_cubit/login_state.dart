part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  String message;
  LoginFailure(this.message);
}

final class LoginSuccess extends LoginState {}
