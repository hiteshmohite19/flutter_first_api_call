import 'package:api_call_1/details_page.dart';
import 'package:api_call_1/userService.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> user_data;

  @override
  void initState() {
    super.initState();
    user_data = UserService().userData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            var refresh_data = await UserService().userData();
            setState(() {
              user_data = Future.value(refresh_data);
            });
          },
          child: FutureBuilder(
              future: user_data,
              builder: ((context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        User user = snapshot.data?[index];
                        return ListTile(
                          title: Text(user.name),
                          subtitle: Text(user.email),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                          onTap: () => onTap(context, user),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(color: Colors.black26);
                      },
                      itemCount: snapshot.data!.length);
                } else {
                  return const Center(
                    child: Text("No data found !!"),
                  );
                }
              }))),
    );
  }

  onTap(context, user) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  user: user,
                )));
  }
}
