import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend_app/src/api/api_client.dart';
import 'package:frontend_app/src/constants/api_constants.dart';
import 'package:frontend_app/src/data/user.dart';
import 'package:frontend_app/src/screens/user_list.dart';

class UserScreen extends StatelessWidget{
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: FutureBuilder<List<User>>(
        future: Future.microtask(_fetchUsers),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }

          if(snapshot.hasError){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('${snapshot.error}'),
              ),
            );
          }

          if(snapshot.hasData){
            return UserList(users: snapshot.data?? <User>[]);
          }
          return SizedBox();
        },
      ),
    );
  }

  FutureOr<List<User>> _fetchUsers() async{
    var response = await ApiClient.getApi(usersPath);
    List<User> userList = (jsonDecode(response.body)['users'] as List)
        .map((userJson) => User.fromJson(userJson))
        .toList();
    return userList;
  }
}