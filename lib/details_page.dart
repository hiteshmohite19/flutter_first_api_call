import 'package:api_call_1/userService.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final User user;
  DetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 128, 58, 144),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.email),
            SizedBox(
              height: 20,
            ),
            Image.network(user.picture)
          ],
        ),
      ),
    );
  }
}


// {color: Colors.white, title: Center(Text(user.name))}