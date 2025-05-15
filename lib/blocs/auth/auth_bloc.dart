import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/services/auth_service.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if(event is AuthCheckEmail){
        try{
          emit(AuthLoading());
          final result = await AuthService().checkEmail(event.email);
          if(!result){
            emit(AuthCheckEmailSuccess());
          }else{
            emit(const AuthFailed("Email already taken"));
          }
        }
        catch(e){
          emit(AuthFailed(e.toString()));
        }
      }

      if(event is AuthRegister){
        try {
          emit(AuthLoading());
          final user = await AuthService().register(event.data);
          emit(AuthSuccess(user));

        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
