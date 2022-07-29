import 'package:flutter/material.dart';
import 'package:kirtasite/Custom/color.dart';
import 'package:kirtasite/Image/png_image.dart';

import '../data/custom_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: PngImage(
                    name: ImageItems().beyazZemin,
                  ),
                ),
              ),
              const SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(CustomContent().kitasiteInfo, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center,)
              ),
              const SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(CustomContent().login,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: CustomColors().baseBlack, fontSize: 25),),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(CustomColors().baseColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    CustomContent().register,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: CustomColors().baseBlack, fontSize: 25,),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      CustomColors().baseColor,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
