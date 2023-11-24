// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(15, 50, 15, 20),
        children: [
          ClipOval(
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.purpleAccent,
              child: Image.network(
                'https://cdn2.iconfinder.com/data/icons/avatars-60/5985/12-Delivery_Man-512.png',
                fit: BoxFit
                    .cover, // Use BoxFit.cover to fit the image within the CircleAvatar
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 10),
            child: const Center(
                child: Text(
              "Hey Sinan CP!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Center(
              child: Text(
            "What a wonderful day!!",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
          )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Account Info"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("My Subscription Info"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("All of my habits"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About This App"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          Center(
            child: TextButton(
              onPressed: (() {
                print("User logged out");
              }),
              child: Text(
                "Log Out",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
