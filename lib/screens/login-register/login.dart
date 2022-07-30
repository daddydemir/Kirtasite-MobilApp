import 'package:flutter/material.dart';
import 'package:kirtasite/Custom/content.dart';
import 'package:kirtasite/Custom/size.dart';

import '../../Custom/button.dart';
import '../../Custom/color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final _pageController = PageController();

  bool secureText = true;
  
  void changeSecureText() {
    setState(() {
      secureText = !secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.amber)),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: CustomSize().paddingHorizontal,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(CustomContent().login,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: CustomColors().rubberDuckyYellow)),
              const SizedBox(
                height: 50,
              ),
              
              const SizedBox(
                height: 50,
              ),
              _userLogin(),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(CustomContent().forgot),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {},
                style: CustomButton().buttonStyle,
                child: Text(CustomContent().login,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: CustomColors().baseBlack,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _userLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: CustomContent().username,
          ),
        ),
        TextField(
          textInputAction: TextInputAction.done,
          obscureText: secureText,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            hintText: CustomContent().password,
            suffix: IconButton(
                onPressed: () {
                  changeSecureText();
                },
                icon: Icon(secureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined)),
          ),
        ),
      ],
    );
  }

}
