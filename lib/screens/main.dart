import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kirtasite/Custom/color.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {

   
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.arrow_left_24),
            color: CustomColors().baseBlack,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Text( "sa " * 2000)
          ),
        ),
      ),
    );
  }
}
