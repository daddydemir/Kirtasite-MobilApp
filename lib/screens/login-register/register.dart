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
  int _index = 0;
  bool _selectedIndex = false;
  bool _secureText = true;

  void _changeIndex() {
    setState(() {
      _selectedIndex = !_selectedIndex;
    });
  }

  void _changeSecureText() {
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
              const SizedBox(height: 20),
              SizedBox(
                height: 450,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return _userRegister();
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
          color: isActive ? CustomColors().brightGold : CustomColors().quillGrey,
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
}
