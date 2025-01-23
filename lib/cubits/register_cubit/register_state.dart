part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterFailure extends RegisterState {
  String errorMessage;
  RegisterFailure(this.errorMessage);
}

final class RegisterSuccess extends RegisterState {}
