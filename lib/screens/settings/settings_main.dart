import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsMain extends StatefulWidget {
  const SettingsMain({super.key});

  @override
  State<SettingsMain> createState() => _SettinsHomeState();
}

class _SettinsHomeState extends State<SettingsMain> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Iconsax.arrow1),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Text(
            "Settings " * 2000,
          ),
        ),
      ),
    );
  }
}
