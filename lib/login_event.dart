

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable{

  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LogginButtonPressed extends LoginEvent{
  final String username;
  final String password;

  LogginButtonPressed({@required this.username,@required this.password});

  @override
  List<Object> get props {
    return [username, password];
  }
}