import 'package:flutter/material.dart';
import 'package:kirtasite/Custom/content.dart';

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
  bool _selectedIndex = false;
  bool _secureText = true;

  void _changeIndex() {
    setState(() {
      _selectedIndex = !_selectedIndex;
    });
  }
  void _changeSecureText(){
    setState(() {
      _secureText = !_secureText;
    });
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
              const SizedBox(height: 50),
              Row(
                children: [
                  _optionsSelectUser(CustomContent().user),
                  _optionsSelectKirtasiye(CustomContent().kirtasite),
                ],
              ),
              const SizedBox(height:20),
              SizedBox(
                height: 300,
                child: PageView(
                  controller: _pageController,
                  children: [
                    _userRegister(),
                    const Center(
                        child: Text("Önce Adres eklememiz gerekiyor.")),
                  ],
                ),
              ),
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

  Column _userRegister() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
                icon:Icon(
                  _secureText ? Icons.visibility_outlined : Icons.visibility_off_outlined
                ),
              ),
            ),
          ),
        ),
        TextField(
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: CustomContent().telNo,
            prefix: Text(CustomContent().telNoStart)
          ),
        ),
      ],
    );
  }

  Widget _optionsSelectUser(String optionName) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: InkWell(
          onTap: () {
            _pageController.previousPage(
                duration: CustomDuration().ms500, curve: Curves.slowMiddle);
            _changeIndex();
          },
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: Card(
            color: !_selectedIndex
                ? CustomColors().rubberDuckyYellow
                : CustomColors().beyaz,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 15,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                optionName,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _optionsSelectKirtasiye(String optionName) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: InkWell(
          onTap: () {
            _pageController.nextPage(
                duration: CustomDuration().ms500, curve: Curves.slowMiddle);
            _changeIndex();
          },
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: Card(
              color: _selectedIndex
                  ? CustomColors().rubberDuckyYellow
                  : CustomColors().beyaz,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 15,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  optionName,
                ),
              )),
        ),
      ),
    );
  }
}
