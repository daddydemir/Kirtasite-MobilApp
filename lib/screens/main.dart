// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kirtasite/Custom/color.dart';
import 'package:kirtasite/components/blurEffect.dart';
import 'package:kirtasite/models/responseModels/stationery.dart';
import 'package:kirtasite/services/stationeryService.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  var service = StationeryService();
  var liste = <StationeryModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataGetir();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.arrow_left_24),
            color: CustomColors().baseBlack,
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 300,
            child: _test(),
          ),
        ),
      ),
    );
  }

  Widget _test() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: liste.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: liste.isEmpty
              ? const CircularProgressIndicator()
              : Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image.network(
                      liste[index].user!.imagePath.toString(),
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    BlurEffect(
                      body: Text(
                        liste[index].companyName.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: CustomColors().beyaz),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: BlurEffect(
                        body: Text(
                          liste[index].score.toString(),
                          style: Theme.of(context).textTheme.headline6!.copyWith(color:CustomColors().baseBlack)
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  _dataGetir() async {
    liste = await service.getAllStationeries() as List<StationeryModel>;
    print("Data1 : " + liste[0].companyName.toString());
    setState(() {});
  }
}
