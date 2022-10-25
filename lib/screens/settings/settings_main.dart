import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kirtasite/Custom/color.dart';
import 'package:kirtasite/Custom/size.dart';

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
        backgroundColor: CustomColors().beyaz,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: _view(),
          ),
        ),
      ),
    );
  }

  _view() {
    return Padding(
      padding: CustomSize().paddingHorizontal.copyWith(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: CustomColors().rubberDuckyYellow,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 85,
                  width: 85,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://avatars.githubusercontent.com/u/42716195?v=4"),
                        ),
                        shape: BoxShape.circle),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text("Mehmet ÇAKMAKTAŞI" , style: Theme.of(context).textTheme.titleLarge),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                const Expanded(
                  child: Icon(Iconsax.personalcard4,
                      size: 35, color: Colors.amber),
                ),
                Expanded(
                  child: Text(
                    "Profilim",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                  child: Icon(Iconsax.arrow_right4, size: 35),
                ),
              ],
            ),
          ),
          const SizedBox(height:20),
          InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              children: [
                const Expanded(
                  child: Icon(
                    Iconsax.activity4,
                    size: 35,
                    color: Colors.green,
                  ),
                ),

                Expanded(
                  child: Text("Siparişlerim", style:  Theme.of(context).textTheme.titleLarge,),
                ),
                const Expanded(
                  child: Icon(
                    Iconsax.arrow_right4,
                    size:35
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height:20),
          InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              children: [
                const Expanded(
                  child: Icon(
                    Iconsax.book,
                    size: 35,
                    color: Colors.purpleAccent,
                  ),
                ),

                Expanded(
                  child: Text("Dosyalarım", style:  Theme.of(context).textTheme.titleLarge,),
                ),
                const Expanded(
                  child: Icon(
                    Iconsax.arrow_right4,
                    size:35
                  ),
                ),
                
              ],
            ),
          ),
          const SizedBox(height:20),
          InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              children: [
                const Expanded(
                  child: Icon(
                    Iconsax.logout4,
                    size: 35,
                    color: Colors.red,
                  ),
                ),

                Expanded(
                  child: Text("Çıkış yap", style:  Theme.of(context).textTheme.titleLarge,),
                ),
                const Expanded(
                  child: Icon(
                    Iconsax.arrow_right4,
                    size:35
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
