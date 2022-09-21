import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:kirtasite/Custom/color.dart';
import 'package:kirtasite/Custom/content.dart';
import 'package:kirtasite/Custom/size.dart';
import 'package:kirtasite/models/responseModels/stationery.dart';

class StationeryDetail extends StatefulWidget {
  const StationeryDetail({Key? key, required this.stationery})
      : super(key: key);

  final StationeryModel stationery;
  @override
  State<StationeryDetail> createState() => _StationeryDetailState();
}

class _StationeryDetailState extends State<StationeryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Iconsax.arrow_left_24,
          color: CustomColors().baseBlack,
        ),
        title: Text(widget.stationery.companyName.toString(),
            style: Theme.of(context).textTheme.titleLarge),
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
          ],
        ),
      ),
    );
  }
}
