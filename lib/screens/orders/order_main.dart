import 'package:flutter/material.dart';
import 'package:kirtasite/Custom/color.dart';
import 'package:kirtasite/Custom/size.dart';

class OrderMain extends StatefulWidget {
  const OrderMain({super.key});

  @override
  State<OrderMain> createState() => _OrderMainState();
}

class _OrderMainState extends State<OrderMain> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors().rubberDuckyYellow,
          centerTitle: true,
          title: Text("Siparişlerim", style: Theme.of(context).textTheme.titleLarge),
        ),
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
      padding: CustomSize().paddingHorizontal.copyWith(bottom:100),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Card(
                color: CustomColors().porsche,
                elevation: 20,
                child: Row(children: [
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Demir",
                                style: Theme.of(context).textTheme.headline6),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text("Durum", style: Theme.of(context).textTheme.bodyLarge)
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_8X0hnOLjna6qNBLStmEsls-VpZwNs8APK8bbZAiCSWF4XIyekxoe5dU5b_Se6amAlNU&usqp=CAU",
                          fit: BoxFit.fitWidth,
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text("Sagopa Kajmer",
                              style: Theme.of(context).textTheme.headline6?.copyWith(backgroundColor: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
