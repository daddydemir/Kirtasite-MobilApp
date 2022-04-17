// ignore_for_file: use_key_in_widget_constructors, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/loginService.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _loginPageState();
}

class _loginPageState extends State{

  var username = TextEditingController();
  var password = TextEditingController();
  var service = LoginService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAEAEA),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:20),
                child: Image.network(
                  "https://raw.githubusercontent.com/daddydemir/images/main/freelancer-market/PNG-4x/icon.png",
                  width:200,
                  height:200,
                  fit:BoxFit.fitWidth
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller:username,
                  decoration: const InputDecoration(
                    border:OutlineInputBorder(),
                    labelText: "Username",
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller:password,
                  decoration:const InputDecoration(
                    border:OutlineInputBorder(),
                    labelText: "Password",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: GestureDetector(
                onTap: ()async{
                  if (await canLaunch("https://github.com/daddydemir")) launch("https://github.com/daddydemir");
                  
                },
                child:const Text("Hesabın yok mu?" , style:TextStyle(decoration: TextDecoration.underline, fontSize:16,color:Color(0xff2FCEF1)))
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: ()async{
                    await service.login(username.text, password.text);
                  },
                  child:const Text("Giriş Yap" , style:TextStyle(fontSize:20))
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}