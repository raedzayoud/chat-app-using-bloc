import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  void SendMessage({required String message,required String email}) {
    try {} catch (e) {}
  }

  void getMessage() {
    //success
    emit(ChatSuccess());
  }
}
