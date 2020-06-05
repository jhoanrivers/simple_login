

import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable{
  const LoginState();

  @override
  List<Object> get props => [];
}


class Initial extends LoginState{}

class SuccessLogin extends LoginState{}

class FailedLogin extends LoginState{}