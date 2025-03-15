import 'package:flutter/material.dart';
import 'package:frontend_app/src/data/user.dart' show User;

/// [UserList]
class UserList extends StatelessWidget {
  const UserList({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            leading: CircleAvatar(
              radius: 24.0,
              backgroundImage: (user.avatar?? '').isNotEmpty?
                NetworkImage(
                  '${user.avatar}'
                ): null,
            ),
            title: Text('${user.firstName} ${user.lastName}', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${user.email}'),
            onTap: () {
              print('Tapped on ${user.firstName}');
            },
          ),
        );
      },
    );
  }
}
