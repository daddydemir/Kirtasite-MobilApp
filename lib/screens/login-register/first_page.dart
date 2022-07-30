import 'package:flutter/material.dart';
import 'package:kirtasite/Custom/button.dart';
import 'package:kirtasite/Custom/color.dart';
import 'package:kirtasite/Custom/size.dart';
import 'package:kirtasite/Image/png_image.dart';
import 'package:kirtasite/screens/login-register/login.dart';
import 'package:kirtasite/screens/login-register/register.dart';

import '../../Custom/content.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: CustomSize().paddingAllx8,
                child: SizedBox(
                  child: PngImage(
                    name: ImageItems().beyazZemin,
                  ),
                ),
              ),
              const SizedBox(height: 100,),
              Padding(
                padding: CustomSize().paddingHorizontal,
                child: Text(CustomContent().kitasiteInfo, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center,)
              ),
              const SizedBox(height: 100,),
              Padding(
                padding: CustomSize().paddingHorizontal,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                  child: Text(CustomContent().login,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: CustomColors().baseBlack, fontSize: 25),),
                  style: CustomButton().buttonStyle,
                ),
              ),
              const SizedBox(height:10),
              Padding(
                padding: CustomSize().paddingHorizontal,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    CustomContent().register,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: CustomColors().baseBlack, fontSize: 25,),
                  ),
                  style: CustomButton().buttonStyle,
                ),
              ),
            ]),
      ),
    );
  }
}
