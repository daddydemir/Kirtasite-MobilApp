import 'package:flutter/material.dart';
import 'package:kirtasite/Custom/content.dart';
import 'package:kirtasite/models/responseModels/city.dart';
import 'package:kirtasite/models/responseModels/district.dart';
import 'package:kirtasite/services/locateService.dart';

import '../../Custom/button.dart';
import '../../Custom/color.dart';
import '../../Custom/duration.dart';
import '../../Custom/size.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _pageController = PageController();
  int _index = 0;
  bool _secureText = true;
  List<String> items = <String>[];
  List<String> ilceler = <String>["seçiniz"];
  String _dopDownValue = "";
  String _ilceValue = "seçiniz";
  var service = LocateService();


  void _changeSecureText() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  void _getLocationData() async {
    List city = await service.getCities();
    for (var i in city) {
      CityModel cm = i;
      items.add(cm.name ?? "");
    }
    _dopDownValue = items.first;
    setState(() {});
  }

  void _getDistricts(String cityId) async {
    List district = await service.getDistrictByCityId(cityId);
    ilceler.clear();
    for(var i in district){
      DistrictModel md = i;
      ilceler.add(md.name ?? ""); 
    }
    _ilceValue = ilceler.first;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              color: CustomColors().rubberDuckyYellow)),
      body: Padding(
        padding: CustomSize().paddingHorizontal,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                CustomContent().register,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: CustomColors().rubberDuckyYellow,
                    ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 450,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0 ? _userRegister() : _kirasiteRegister();
                  },
                  onPageChanged: (int index) {
                    setState(() {
                      _index = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              const SizedBox(height: 50),
              TextButton(
                onPressed: () {},
                style: CustomButton().buttonStyle,
                child: Text(
                  CustomContent().register,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: CustomColors().baseBlack,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 2; i++) {
      list.add(i == _index ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: CustomDuration().ms150,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: isActive ? 10 : 8,
        width: isActive ? 12 : 8,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: CustomColors().brightGold.withOpacity(0.72),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(0, 0),
                  )
                : const BoxShadow(
                    color: Colors.transparent,
                  ),
          ],
          shape: BoxShape.circle,
          color:
              isActive ? CustomColors().brightGold : CustomColors().quillGrey,
        ),
      ),
    );
  }

  Column _userRegister() {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: 50,
          child: Card(
            elevation: 2,
            color: CustomColors().brightGold,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(CustomContent().kullanici,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
        ),
        Padding(
          padding: CustomSize().padingOnlyBottomx13,
          child: TextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: CustomContent().mail,
            ),
          ),
        ),
        TextField(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: CustomContent().username,
          ),
        ),
        Padding(
          padding: CustomSize().padingOnlyBottomx13,
          child: TextField(
            obscureText: _secureText,
            obscuringCharacter: "*",
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: CustomContent().password,
              suffix: IconButton(
                onPressed: () {
                  _changeSecureText();
                },
                icon: Icon(_secureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
              ),
            ),
          ),
        ),
        TextField(
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              hintText: CustomContent().telNo,
              prefix: Text(CustomContent().telNoStart)),
        ),
      ],
    );
  }

  Widget _kirasiteRegister() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 50,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: CustomColors().brightGold,
              elevation: 2,
              child: Center(
                child: Text(CustomContent().kirtasite,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
          ),
          Padding(
            padding: CustomSize().padingOnlyBottomx13,
            child: TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: CustomContent().mail,
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: CustomContent().marka,
            ),
          ),
          Padding(
            padding: CustomSize().padingOnlyBottomx13,
            child: TextField(
              obscureText: _secureText,
              obscuringCharacter: "*",
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: CustomContent().password,
                suffix: IconButton(
                  onPressed: () {
                    _changeSecureText();
                  },
                  icon: Icon(_secureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                ),
              ),
            ),
          ),
          Padding(
            padding: CustomSize().padingOnlyBottomx13,
            child: TextField(
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  hintText: CustomContent().telNo,
                  prefix: Text(CustomContent().telNoStart)),
            ),
          ),
          Padding(
            padding: CustomSize().padingOnlyBottomx13,
            child: TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: CustomContent().adresHeader,
              ),
            ),
          ),
          Padding(
            padding: CustomSize().padingOnlyBottomx13,
            child: Center(
              child: DropdownButton<String>(
                value: _dopDownValue,
                onChanged: (String? value,) {
                  int sayac = 0;
                  for(var i in items){
                    sayac++;
                    if(i == value){
                      _getDistricts(sayac.toString());
                      break;
                    }
                  }
                  setState(() {
                    _dopDownValue = value!;
                  });
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value));
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: CustomSize().padingOnlyBottomx13,
            child: Center(
              child: DropdownButton<String>(
                value: _ilceValue,
                onChanged: (String? value,) {
                  setState(() {
                    _ilceValue = value!;
                  });
                },
                items: ilceler.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value));
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: CustomSize().padingOnlyBottomx13,
            child: Center(child:Text("Harita üzerinden seçim yapması sağlanacak"),),
          ),
        ],
      ),
    );
  }
}
