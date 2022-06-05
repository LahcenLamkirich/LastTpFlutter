import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tp_flutter/pages/homePage.dart';


class UserPage extends StatelessWidget {
  // la declaration de constructeur :
  const UserPage({Key? key, required this.FirstName,
    required this.LastName,
    required this.email,
    required this.phone,
    required this.picture}) : super(key: key);
  // la declaration des variables :
  final String FirstName ;
  final String LastName ;
  final String email ;
  final String phone ;
  final String picture ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showCustomDialog(context, FirstName, LastName, email, phone, picture),
    );
  }
}


showCustomDialog(BuildContext context, String firstName, String lastName, String email, String phone, String imageUrl) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 300.0,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Image(
                            image: NetworkImage(imageUrl),
                            width:400,
                            height: 450,
                            // fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              iconSize: 30.0,
                              onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => homePage())),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    firstName + "  " + lastName,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[100],
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: 15 ,
                        color: Colors.grey[500]
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    phone,
                    style: TextStyle(
                        fontSize: 18 ,
                        color: Colors.grey[600]
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }
  );
}
