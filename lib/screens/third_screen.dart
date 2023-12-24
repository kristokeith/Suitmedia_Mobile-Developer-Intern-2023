import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobiledevintern2023_1/model.dart';
import 'package:http/http.dart' as http;

class third_screen extends StatefulWidget {
  const third_screen({Key? key}) : super(key: key);

  @override
  State<third_screen> createState() => _third_screenState();
}

class _third_screenState extends State<third_screen> {
  Future<List<User>> getUsers() async {
    const url = "https://reqres.in/api/users?page=1&per_page=10";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    var jsonArray = jsonData["data"];

    List<User> users = [];
    for (var jsonUser in jsonArray) {
      User user = User(
        id: jsonUser["id"],
        email: jsonUser["email"],
        first_name: jsonUser["first_name"],
        last_name: jsonUser["last_name"],
        avatar: jsonUser["avatar"],
      );

      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Third Screen",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            fontFamily: "Poppins",
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<User>>(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<User> users = snapshot.data!;

              return ListView.builder(
                cacheExtent: 10,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  User user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                      radius: 49,
                    ),
                    title: Text(
                      user.first_name + " " + user.last_name,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      user.email.toUpperCase(),
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(
                          context, user.first_name + " " + user.last_name);
                    },
                  );
                },
              );
            }
          }),
    );
  }
}