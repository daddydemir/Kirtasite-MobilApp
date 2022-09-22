import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:kirtasite/Custom/color.dart';
import 'package:kirtasite/Custom/content.dart';
import 'package:kirtasite/Custom/size.dart';
import 'package:kirtasite/models/responseModels/price.dart';
import 'package:kirtasite/models/responseModels/stationery.dart';
import 'package:kirtasite/services/priceService.dart';

class StationeryDetail extends StatefulWidget {
  const StationeryDetail({Key? key, required this.stationery})
      : super(key: key);

  final StationeryModel stationery;
  @override
  State<StationeryDetail> createState() => _StationeryDetailState();
}

class _StationeryDetailState extends State<StationeryDetail> {
  List<PriceModel> fiyatlar = <PriceModel>[];
  var service = PriceService();

  void _dataSet() async {
    fiyatlar = await service.getPricesByStationeryId(widget.stationery.userId)
        as List<PriceModel>;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _dataSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Iconsax.arrow_left_24,
          color: CustomColors().baseBlack,
        ),
        title: Text(
          widget.stationery.companyName.toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    widget.stationery.user!.imagePath.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: CustomSize().textPadding,
                      child: Icon(
                        Iconsax.star,
                        color: CustomColors().rubberDuckyYellow,
                      ),
                    ),
                    Padding(
                      padding: CustomSize().textPadding,
                      child: Text(
                        widget.stationery.score.toString(),
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: CustomColors().rubberDuckyYellow),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: CustomSize().paddingHorizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      padding: CustomSize().paddingx10,
                      decoration: BoxDecoration(
                        color: CustomColors().purpleHeart,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 75,
                            height: 75,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                size: 30,
                                Iconsax.bag_tick4,
                                color: CustomColors().purpleHeart,
                              ),
                            ),
                          ),
                          Text(
                            CustomContent().siparisVer,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: CustomColors().beyaz,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: CustomSize().paddingx10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: CustomColors().topaz,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 75,
                            height: 75,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(
                                Iconsax.archive_tick,
                                size: 30,
                                color: CustomColors().topaz,
                              ),
                            ),
                          ),
                          Text(
                            CustomContent().yorumOku,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: CustomColors().beyaz,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            fiyatlar.isEmpty
                ? const CircularProgressIndicator()
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: PageView.builder(
                      itemCount: fiyatlar.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: CustomSize().paddingHorizontal,
                          child: _body(index),
                        );
                      },
                    ),
                  ),
            const Text("ADDRESS ADD TODO:"),
          ],
        ),
      ),
    );
  }

  Widget _body(int id) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColors().topaz,
            CustomColors().baseBlack,
          ],
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: CustomSize().paddingx10,
              child: Text(
                fiyatlar[id].info.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: CustomSize().paddingx10,
              child: Text(
                fiyatlar[id].price.toString() + " ₺",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: CustomColors().beyaz),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
