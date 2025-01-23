import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailure("Weak-password"));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailure("email failure"));
      }
    } catch (e) {
      emit(RegisterFailure("Something went wrong"));
    }
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailure("user went wrong"));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailure("password went wrong"));
      }
    } catch (e) {
      emit(LoginFailure("Something went wrong "));
    }
  }
}
