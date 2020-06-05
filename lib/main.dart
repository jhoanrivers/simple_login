import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:incrementbloc/login_bloc.dart';
import 'package:incrementbloc/login_event.dart';
import 'package:incrementbloc/login_state.dart';
import 'package:toast/toast.dart';




void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: HomeScreen(),
      )

    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  LoginBloc loginBloc;
  var username = TextEditingController();
  var password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc,LoginState>(
      child: BlocBuilder<LoginBloc,LoginState>(
        builder: (BuildContext context, state) {

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'username'),
                  controller: username,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'username'),
                  controller: password,
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: _onButtonPressed,
                  child: Text('Go'),
                )
              ],
            ),
          );
        },

      ), listener: (BuildContext context, state) {
      if(state is SuccessLogin){
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Success'),
            backgroundColor: Colors.red,
          ),
        );
      }
      if(state is FailedLogin){
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed'),
            backgroundColor: Colors.red,
          ),
        );
      }

    },
    );
  }


  void _onButtonPressed(){
    loginBloc.add(LogginButtonPressed(
      username: username.text,
      password: password.text,
    ));
  }


}
