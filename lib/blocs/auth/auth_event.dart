part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;
  const AuthCheckEmail(this.email);
  @override
  List<Object> get props => [email];
}


class AuthRegister extends AuthEvent{
  final SignUpFormModel data;
  const AuthRegister(this.data);
  @override
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent{
  final SignInFormModel data;
  const AuthLogin(this.data);
  @override
  List<Object> get props => [data]; 
}

class AuthGetCurrentUser extends AuthEvent{}

class AuthUpdateuser extends AuthEvent{
  final UserEditFormModel data;
  const AuthUpdateuser(this.data);
  @override
  List<Object> get props => [data]; 
}

class AuthUpdatePin extends AuthEvent{
  final String oldPin;
  final String newPin;

  const AuthUpdatePin(this.oldPin,this.newPin);
  @override
  List<Object> get props => [oldPin,newPin]; 
}

class AuthLogout extends AuthEvent{}