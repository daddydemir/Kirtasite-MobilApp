// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kirtasite/Custom/color.dart';
import 'package:kirtasite/Custom/size.dart';
import 'package:kirtasite/models/responseModels/stationery.dart';
import 'package:kirtasite/screens/home/stationery_detail.dart';
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
            height: MediaQuery.of(context).size.height,
            child: _test(),
          ),
        ),
      ),
    );
  }

  Widget _test() {
    return Padding(
      padding: CustomSize().paddingHorizontal.copyWith(bottom: 80, top: 0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: liste.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => StationeryDetail(stationery: liste[index],)));
            },
            child: Container(
              margin: CustomSize().paddingAllx8,
              padding: CustomSize().paddingHorizontal,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                    liste[index].user!.imagePath.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: liste.isEmpty
                  ? const CircularProgressIndicator()
                  : Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Card(
                            color: CustomColors().rubberDuckyYellow,
                            child: Padding(
                              padding: CustomSize().textPadding,
                              child: Text(
                                liste[index].companyName.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: CustomColors().baseBlack),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Iconsax.star1,
                                  color: CustomColors().rubberDuckyYellow),
                              Card(
                                color: Colors
                                    .transparent, //CustomColors().rubberDuckyYellow,
                                child: Padding(
                                  padding: CustomSize().textPadding,
                                  child: Text(
                                    liste[index].score.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          color:
                                              CustomColors().rubberDuckyYellow,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: CustomSize().paddingAllx8,
                            child: Text(
                              liste[index].address!.city!.name.toString() +
                                  "/" +
                                  liste[index]
                                      .address!
                                      .district!
                                      .name
                                      .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: CustomColors().beyaz,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  _dataGetir() async {
    liste = await service.getAllStationeries() as List<StationeryModel>;
    liste.add(liste[1]);
    liste.add(liste[0]);
    print("Data1 : " + liste[0].companyName.toString());
    setState(() {});
  }
}
