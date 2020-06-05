

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incrementbloc/login_event.dart';
import 'package:incrementbloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  @override
  // TODO: implement initialState
  LoginState get initialState => Initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async*{
    if(event is LogginButtonPressed){
       if(event.username== "jhoan" && event.password == "hehe"){
         yield SuccessLogin();
       }else{
         yield FailedLogin();
       }
    }
  }

}