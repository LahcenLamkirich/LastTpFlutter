import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:tp_flutter/pages/UserPage.dart';
import 'dart:convert';
import '../Models/User.dart';

class homePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<homePage> {

  Future<List<User>> _getUsers() async {


    var data = await http.get(Uri.https('randomuser.me', "api",{"results": "20"}));

    var jsonData = json.decode(data.body);

    List<User> users = [];

    var results = jsonData["results"]; 
    // print(results);

    for(var u in results){  
      print("**************** here ") ;
      User user = User(u["name"]["first"],u["name"]["last"], u["email"], u["phone"], u["picture"]['large']);
      users.add(user);
      print(users.length);
    }
    return users;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data == null) {
                return CircularProgressIndicator();
              }
              else {
                return ListView.builder(
        
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.grey[400],
                          elevation: 4,
                          margin: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UserPage(
                                    FirstName: snapshot.data[index].firstName,
                                    LastName: snapshot.data[index].lastName,
                                    email : snapshot.data[index].email,
                                    phone: snapshot.data[index].phone,
                                    picture: snapshot.data[index].picture)),
                              );
                            },
                            child: ListTile(
                               leading: CircleAvatar(backgroundImage:
                                NetworkImage(snapshot.data[index].picture)),
                              title: Text(snapshot.data[index].firstName + " " + snapshot.data[index].lastName,
                                    style: TextStyle(fontFamily: "Brand BOld"),
                              ),
                              subtitle: Text(snapshot.data[index].email),
                              trailing: Text(snapshot.data[index].phone),
                              ),
                          ),
                        );
                      }
                    );
                      }
                    }
                ),
              )
        );
  }
}

