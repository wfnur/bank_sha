import 'package:bank_sha/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // TODO: implement event handler
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
    });
  }
}
