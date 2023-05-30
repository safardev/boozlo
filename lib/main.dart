import 'dart:async';

import 'package:boozlo/homepage.dart';
import 'package:boozlo/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _formfield = GlobalKey<FormState>();
final _signinformfield = GlobalKey<FormState>();
final _emailformfield = GlobalKey<FormState>();
final _formfieldboozler = GlobalKey<FormState>();
final _emailformfieldboozler = GlobalKey<FormState>();

var name;

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp(eventData: [],));
}

class MyApp extends StatelessWidget {
  final eventData;

  const MyApp({super.key,this.eventData});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Boozlo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final datas;
  final eData;

  const MyHomePage({super.key, required this.title, this.datas,this.eData});

  @override
  State<MyHomePage> createState() => _MyHomePageState(this.datas,this.eData);
}

class _MyHomePageState extends State<MyHomePage> {
  var data;
  var filter;
  final eData;

  _MyHomePageState(this.data,this.eData);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final emailSignIn = TextEditingController();
  final passwordSignIn = TextEditingController();

  final nameControllerBoozler = TextEditingController();
  final emailBoozler = TextEditingController();
  final phoneControllerBoozler = TextEditingController();

  var screenHeight;
  var screenWidth;

  bool _clicked = false;
  bool isFirstScreen = true;
  bool isSecondScreen = false;
  bool isThirdScreen = false;
  bool isFourthScreen = false;
  bool isNextButton = true;
  bool _logo = false;
  bool isWelcomeScreen = false;
  bool isAlreadySignUpScreen = false;
  bool isVendor = false;
  bool nameSubmitted = false;
  bool vendorDetailsScreen = false;
  bool vendorOTPScreen = false;

  bool boozlerScreen = false;
  bool _clickedBoozler = false;
  bool boozlerDetailsScreen = false;
  bool boozlerOTPScreen = false;

  String capitalize(String str) {
    return str
        .toLowerCase()
        .split(' ')
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1)}'
            : '')
        .join(' ');
  }

  Container boozloLogo() {
    return Container(
      child: Image.asset(
        "assets/images/img_boozlo.png",
        width: 223.33,
        height: 70,
      ),
    );
  }

  Column statePurpose() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Hello!",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          "State your purpose?",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
      ],
    );
  }

  SizedBox vendor() {
    return SizedBox(
      width: 120,
      height: 210,
      child: Image.asset(
        "assets/images/Vectary texture.png",
        height: 162,
        width: 120,
      ),
    );
  }

  Text vendorText() {
    return const Text(
      "VENDOR",
      style: TextStyle(
        color: Colors.white,
        fontFamily: "Avenir",
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Column weCallYou() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            "Great!",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w500,
              fontSize: 21.653,
            ),
          ),
        ),
        Text(
          "What should we call you?",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w500,
            fontSize: 21.653,
          ),
        ),
      ],
    );
  }

  Column readyToJoin() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            "That's a really nice name.",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w500,
              fontSize: 21.653,
            ),
          ),
        ),
        Text(
          "Ready to join?",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w500,
            fontSize: 21.653,
          ),
        ),
      ],
    );
  }

  Column moreAboutYou() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            "Awesome!",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w500,
              fontSize: 21.653,
            ),
          ),
        ),
        Text(
          "Tell us more about you!",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w500,
            fontSize: 21.653,
          ),
        ),
      ],
    );
  }

  SizedBox boozler() {
    return SizedBox(
      width: 120,
      height: 210,
      child: Image.asset(
        "assets/images/Vectary texture2.png",
        width: 120,
        height: 162,
      ),
    );
  }

  Text boozlerText() {
    return const Text(
      "BOOZLER",
      style: TextStyle(
        color: Colors.white,
        fontFamily: "Avenir",
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Form nameField() {
    return Form(
        key: _formfield,
        child: TextFormField(
          onChanged: (value) {
            nameController.value = nameController.value.copyWith(
              text: capitalize(value),
              selection:
                  TextSelection.collapsed(offset: capitalize(value).length),
            );
          },
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          controller: nameController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.indigo),
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: "VENDOR",
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Avenir',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.green))),
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter Name";
            } else if (nameController.text.length < 3) {
              return "Name should be greater than 2 characters";
            }
          },
        ));
  }

  Column nameBoxVendorDetails() {
    return Column(
      children: [
        Text(
          nameController.text,
          style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'Avenir',
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        Container(
          width: 200,
          height: 2,
          color: Colors.green,
          margin: const EdgeInsets.only(top: 5, bottom: 10),
        )
      ],
    );
  }

  Form emailField() {
    return Form(
      key: _emailformfield,
      child: Column(
        children: [
          Container(
            width: 290,
            height: 40,
            alignment: Alignment.center,
            child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Email",
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Avenir',
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.indigo))),
                validator: (value) {
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0.!#$%&'+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  for (int i = 0; i < data.length; i++) {
                    if (data[i][0] == value) {
                      filter = value;
                      break;
                    }
                  }
                  if (value!.isEmpty) {
                    return "Enter Email";
                  } else if (!emailValid) {
                    return "Enter Valid Email";
                  } else if (filter == value) {
                    return "Email Already Exist";
                  }
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 290,
            height: 40,
            alignment: Alignment.center,
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Phone Number",
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Avenir',
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Phone/Mobile no.";
                } else if (phoneController.text.length != 10) {
                  return "Phone no. should be of 10 digits";
                }
              },
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Text(
            "Quick Fix!",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20, right: 10),
                  child: Image.asset("assets/images/VectorGoogle.png")),
              Container(
                  margin: const EdgeInsets.only(top: 20, left: 10),
                  child: Image.asset("assets/images/VectorFB.png"))
            ],
          ),
        ],
      ),
    );
  }

  Container vendorOtpProfile() {
    return Container(
        width: 260,
        height: 130,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey.shade700),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          children: [
            Container(
              width: 74,
              height: 100,
              margin: const EdgeInsets.only(
                  top: 10, left: 16, right: 16, bottom: 10),
              child: Image.asset(
                "assets/images/Vectary texture.png",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameController.text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Avenir",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Age, Gender",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Avenir",
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    emailController.text,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: "Avenir",
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "+91 ${phoneController.text}",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: "Avenir",
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Form nameFieldBoozler() {
    return Form(
        key: _formfieldboozler,
        child: TextFormField(
          onChanged: (value) {
            nameControllerBoozler.value = nameControllerBoozler.value.copyWith(
              text: capitalize(value),
              selection:
                  TextSelection.collapsed(offset: capitalize(value).length),
            );
          },
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          controller: nameControllerBoozler,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: "BOOZLER",
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Avenir',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey))),
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter Name";
            } else if (nameControllerBoozler.text.length < 3) {
              return "Name should be greater than 2 characters";
            }
          },
        ));
  }

  Column nameBoxBoozlerDetails() {
    return Column(
      children: [
        Text(
          nameControllerBoozler.text,
          style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'Avenir',
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        Container(
          width: 200,
          height: 2,
          color: Colors.green,
          margin: const EdgeInsets.only(top: 5, bottom: 10),
        )
      ],
    );
  }

  Form emailFieldBoozler() {
    return Form(
      key: _emailformfieldboozler,
      child: Column(
        children: [
          Container(
            width: 290,
            height: 40,
            alignment: Alignment.center,
            child: TextFormField(
                controller: emailBoozler,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Email",
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Avenir',
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.indigo))),
                validator: (value) {
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0.!#$%&'+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  for (int i = 0; i < data.length; i++) {
                    if (data[i][0] == value) {
                      filter = value;
                      break;
                    }
                  }
                  if (value!.isEmpty) {
                    return "Enter Email";
                  } else if (!emailValid) {
                    return "Enter Valid Email";
                  } else if (filter == value) {
                    return "Email Already Exist";
                  }
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 290,
            height: 40,
            alignment: Alignment.center,
            child: TextFormField(
              controller: phoneControllerBoozler,
              keyboardType: TextInputType.number,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Phone Number",
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Avenir',
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Phone/Mobile no.";
                } else if (phoneControllerBoozler.text.length != 10) {
                  return "Phone no. should be of 10 digits";
                }
              },
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Text(
            "Quick Fix!",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20, right: 10),
                  child: Image.asset("assets/images/VectorGoogle.png")),
              Container(
                  margin: const EdgeInsets.only(top: 20, left: 10),
                  child: Image.asset("assets/images/VectorFB.png"))
            ],
          ),
        ],
      ),
    );
  }

  Container boozlerOtpProfile() {
    return Container(
        width: 260,
        height: 130,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey.shade700),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          children: [
            Container(
              width: 74,
              height: 100,
              margin: const EdgeInsets.only(
                  top: 10, left: 16, right: 16, bottom: 10),
              child: Image.asset(
                "assets/images/Vectary texture2.png",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameControllerBoozler.text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Avenir",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Age, Gender",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Avenir",
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    emailBoozler.text,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: "Avenir",
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "+91 ${phoneControllerBoozler.text}",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: "Avenir",
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    int count = 1;

    var _vendorPos = 335.00;

    return Scaffold(
        backgroundColor: Colors.black,
        body: StatefulBuilder(
          builder: (context, internalState) {
            return Stack(
              children: <Widget>[
                // First Screen Image
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 800),
                  top: 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: isFirstScreen ? 1.00 : 0,
                    child: Image.asset(
                      "assets/images/Frame 2659.png",
                      width: screenWidth,
                      height: (screenHeight * 63.54) / 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                // First Screen Headline
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 800),
                  top: (screenHeight * 63.54) / 100,
                  left: isFirstScreen ? (screenWidth * 8.26) / 100 : -100,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: isFirstScreen ? 1.00 : 0,
                    child: const UnconstrainedBox(
                      child: SizedBox(
                        width: 262.00,
                        height: 240.00,
                        child: Text(
                          "The Ultimate Party Booking and Table Reservation App.",
                          style: TextStyle(
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                ),

                // First Screen logo
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 800),
                  top: (screenHeight * 0.529),
                  left: isFirstScreen
                      ? (screenWidth / 2) - (screenWidth * 0.68) / 2
                      : (screenWidth / 2) - (screenWidth * 0.68),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: isFirstScreen ? 1.0 : 0.0,
                    child: SizedBox(
                      width: screenWidth * 0.68,
                      height: screenHeight * 0.09,
                      child: Image.asset(
                        "assets/images/img_boozlo.png",
                      ),
                    ),
                  ),
                ),

                // Second Screen Image
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: isSecondScreen ? 1.00 : 0,
                    child: Image.asset(
                      "assets/images/Frame 2660.png",
                      width: screenWidth,
                      height: (screenHeight * 63.54) / 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                // Second Screen Headline
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: screenHeight * 0.43,
                  left: isThirdScreen
                      ? -100
                      : isSecondScreen
                          ? screenWidth * 0.06
                          : screenWidth,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: isSecondScreen ? 1.00 : 0,
                    child: const UnconstrainedBox(
                      child: SizedBox(
                        width: 262.00,
                        height: 192.00,
                        child: Text(
                          "Book Tickets And Passes For Events & Live Shows",
                          style: TextStyle(
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                ),

                // Second Screen Description
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  left: isThirdScreen
                      ? -100.00
                      : isSecondScreen
                          ? screenWidth * 0.06
                          : screenWidth,
                  top: screenHeight * 0.706,
                  // right: isSecondScreen?screenWidth * 0.17: -screenWidth/2,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: isSecondScreen ? 1.00 : 0,
                    child: const UnconstrainedBox(
                      child: SizedBox(
                        width: 286.00,
                        height: 116.00,
                        child: Text(
                          "Purchase tickets and passes with ease using our secure checkout process.",
                          style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF707070),
                              fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ),

                // Third Screen Image
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: isThirdScreen ? 1.00 : 0,
                    child: Image.asset(
                      "assets/images/Frame 2661.png",
                      width: screenWidth,
                      height: (screenHeight * 63.54) / 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                // Third Screen Headline
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: screenHeight * 0.43,
                  left: isFourthScreen
                      ? -100.00
                      : isThirdScreen
                          ? screenWidth * 0.06
                          : screenWidth,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: isThirdScreen ? 1.00 : 0,
                    child: const UnconstrainedBox(
                      child: SizedBox(
                        width: 262.00,
                        height: 192.00,
                        child: Text(
                          "Discover Parties and Events Around You!",
                          style: TextStyle(
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                ),

                // Third Screen Description
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  left: isFourthScreen
                      ? -100.00
                      : isThirdScreen
                          ? screenWidth * 0.06
                          : screenWidth,
                  top: screenHeight * 0.706,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: isThirdScreen ? 1.00 : 0,
                    child: const UnconstrainedBox(
                      child: SizedBox(
                        width: 286.00,
                        height: 116.00,
                        child: Text(
                          "Gain access to exclusive events and experiences that are not available to the general public.",
                          style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF707070),
                              fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ),

                // Next_Button
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 800),
                  bottom: screenHeight * 0.067,
                  right:
                      isNextButton ? screenWidth * 0.15 : (screenWidth * 0.15),
                  child: AnimatedScale(
                    duration: const Duration(seconds: 0),
                    scale: count == 4 ? 0 : 1.0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isNextButton ? 1.0 : 0.0,
                      child: SizedBox(
                          width: 40,
                          height: 40,
                          child: GestureDetector(
                            onTap: () {
                              internalState(() {
                                switch (count) {
                                  case 1:
                                    {
                                      isFirstScreen = false;
                                      isSecondScreen = true;
                                      count++;
                                    }
                                    break;

                                  case 2:
                                    {
                                      isSecondScreen = false;
                                      isThirdScreen = true;
                                      count++;
                                    }
                                    break;

                                  case 3:
                                    {
                                      isThirdScreen = false;
                                      isFourthScreen = true;
                                      count++;
                                    }
                                    break;

                                  default:
                                    {}
                                }
                              });
                            },
                            child: Image.asset(
                                "assets/images/Next_Button_Icon.png"),
                          )),
                    ),
                  ),
                ),

                // Fourth Screen Image
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: isFourthScreen
                        ? 1.00
                        : isWelcomeScreen
                            ? 0
                            : 0,
                    child: Image.asset(
                      "assets/images/Frame 2662.png",
                      width: screenWidth,
                      height: (screenHeight * 63.54) / 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                // Fourth Screen Headline
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: screenHeight * 0.43,
                  left: isWelcomeScreen
                      ? -100.00
                      : isFourthScreen
                          ? screenWidth * 0.06
                          : screenWidth,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: isFourthScreen ? 1.00 : 0,
                    child: const UnconstrainedBox(
                      child: SizedBox(
                        width: 295.00,
                        height: 144.00,
                        child: Text(
                          "Enjoy A Complimentary Drink, On Us!",
                          style: TextStyle(
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                ),

                // Fourth Screen Description
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  left: isWelcomeScreen
                      ? -100.00
                      : isFourthScreen
                          ? screenWidth * 0.06
                          : screenWidth,
                  top: screenHeight * 0.706,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: isFourthScreen ? 1.00 : 0,
                    child: const UnconstrainedBox(
                      child: SizedBox(
                        width: 286.00,
                        height: 116.00,
                        child: Text(
                          "Simply present your booking confirmation at the venue to claim your free drink.",
                          style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF707070),
                              fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ),

                // Get Me More Button
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  bottom: isFourthScreen
                      ? screenHeight * 0.05
                      : screenHeight * 0.05,
                  left: isFourthScreen ? screenWidth / 2 - 137 : screenWidth,
                  child: GestureDetector(
                    onTap: () {
                      internalState(() {
                        isNextButton = false;
                        isFourthScreen = false;
                        isWelcomeScreen = true;
                        _logo = true;
                      });
                    },
                    child: AnimatedOpacity(
                      duration: const Duration(seconds: 0),
                      opacity: isWelcomeScreen ? 0 : 1.0,
                      child: Container(
                        height: 51.00,
                        width: 274,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Center(
                          child: Text(
                            "HELL YEAH! Get me one!",
                            style: TextStyle(
                                color: Color(0xFF323232),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: 'Avenir'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Boozlo_Logo
                AnimatedPositioned(
                  top: 40,
                  left: screenWidth / 2 - 111.665,
                  duration: const Duration(seconds: 1),
                  child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: _logo ? 1.0 : 0,
                      child: boozloLogo()),
                ),

                // StatePurpose
                AnimatedPositioned(
                  top: isWelcomeScreen
                      ? screenHeight * 0.25
                      : screenHeight * 0.23,
                  left: screenWidth * 0.12,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedOpacity(
                    opacity: isWelcomeScreen ? 1.00 : 0.00,
                    duration: const Duration(milliseconds: 500),
                    child: statePurpose(),
                  ),
                ),

                // WeCall You
                AnimatedPositioned(
                  top: !isVendor ? screenHeight * 0.25 : screenHeight * 0.26,
                  left: screenWidth * 0.12,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedOpacity(
                    opacity: !isVendor ? 0.00 : 1.00,
                    duration: const Duration(seconds: 1),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 500),
                      scale: nameController.text.length > 2 ? 0 : 1.0,
                      child: Container(child: weCallYou()),
                    ),
                  ),
                ),

                // Welcome Screen
                // Welcome Screen---->>>>Vendor
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  top: isWelcomeScreen
                      ? screenHeight * 0.42
                      : isVendor
                          ? screenHeight * 0.36
                          : screenHeight * 0.42,
                  left: isVendor ? screenWidth / 2 - 60.00 : screenWidth / 6,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 0),
                    opacity: isWelcomeScreen
                        ? 1.0
                        : isVendor
                            ? 1.0
                            : 0,
                    child: GestureDetector(
                      onTap: () {
                        _clicked
                            ? null
                            : internalState(() {
                                isVendor = !isVendor;
                                isWelcomeScreen = !isWelcomeScreen;
                                _vendorPos = 290.00;
                                _clicked = !_clicked;
                              });
                      },
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 0),
                        scale: nameSubmitted
                            ? 0
                            : isWelcomeScreen
                                ? 1.0
                                : isVendor
                                    ? 1.0
                                    : 0,
                        child: vendor(),
                      ),
                    ),
                  ),
                ),

                // Vendor Text
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: isVendor ? 505.00 : screenHeight * 0.64,
                  left: isVendor ? screenWidth / 2 + 60.00 : screenWidth / 5,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 0),
                    opacity: isWelcomeScreen ? 1.0 : 0,
                    child: AnimatedScale(
                      scale: !isVendor ? 1.0 : 0,
                      duration: const Duration(seconds: 1),
                      child: AnimatedOpacity(
                        opacity: isVendor ? 0 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: vendorText(),
                      ),
                    ),
                  ),
                ),

                // Ready to Join
                AnimatedPositioned(
                  top: nameController.text.length > 2
                      ? screenHeight * 0.25
                      : screenHeight * 0.24,
                  left: screenWidth * 0.12,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedOpacity(
                    opacity: nameController.text.length > 2 ? 1.00 : 0,
                    duration: const Duration(seconds: 1),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 500),
                      scale: nameController.text.length > 2 ? 1.0 : 0,
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 200),
                        scale: nameSubmitted ? 0 : 1.0,
                        child: readyToJoin(),
                      ),
                    ),
                  ),
                ),

                // AlreadySignedUp
                AnimatedPositioned(
                  bottom: isWelcomeScreen
                      ? screenHeight * 0.11
                      : screenHeight * 0.11,
                  left: screenWidth / 6,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedOpacity(
                    opacity: isWelcomeScreen ? 1.0 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 0),
                      scale: !isVendor ? 1 : 0,
                      child: SizedBox(
                        width: 290,
                        height: 40,
                        child: TextButton(
                          onPressed: () {
                            internalState(() {
                              isWelcomeScreen = !isWelcomeScreen;
                              isAlreadySignUpScreen = !isAlreadySignUpScreen;
                            });
                          },
                          style: TextButton.styleFrom(
                            side: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text(
                            'I’m Already Signed Up!',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // AlreadySignUp Screen
                AnimatedPositioned(
                  duration: const Duration(seconds: 0),
                  top: isAlreadySignUpScreen ? 0 : 0,
                  left: 0,
                  child: AnimatedScale(
                    scale: isAlreadySignUpScreen ? 1.0 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Column(
                      children: [
                        Container(
                          width: 295,
                          height: 72,
                          margin: EdgeInsets.only(
                              top: screenHeight * 0.184,
                              left: screenWidth * 0.128),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back!",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: "Urbanist",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                "Pick up where you left.",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: "Urbanist",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: screenHeight * 0.11,
                                  left: screenWidth * 0.12),
                              child: Form(
                                key: _signinformfield,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 290,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: TextFormField(
                                        controller: emailSignIn,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textAlign: TextAlign.center,
                                        cursorColor: Colors.white,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: "Email",
                                            hintStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontFamily: 'Avenir',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(11),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey))),
                                        validator: (value) {
                                          bool emailValid = RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0.!#$%&'+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value!);
                                          if (value!.isEmpty) {
                                            return "Enter Email";
                                          } else if (!emailValid) {
                                            return "Enter Valid Email";
                                          }
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 290,
                                      height: 40,
                                      margin: const EdgeInsets.only(top: 10),
                                      alignment: Alignment.center,
                                      child: TextFormField(
                                        controller: passwordSignIn,
                                        keyboardType: TextInputType.text,
                                        cursorColor: Colors.white,
                                        textAlign: TextAlign.center,
                                        obscureText: true,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: "Password",
                                          hintStyle: const TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Avenir',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey)),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Password";
                                          }
                                        },
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (_signinformfield.currentState!
                                            .validate()) {
                                          bool credential = false;
                                          for (var z in data) {
                                            if (z[0] == emailSignIn.text &&
                                                z[1] == passwordSignIn.text) {
                                              name = z[2];
                                              credential = true;
                                              break;
                                            }
                                          }
                                          if (credential == false) {
                                            emailSignIn.text =
                                                "Invalid Credential!!";
                                            passwordSignIn.clear();
                                          }
                                          if (credential == true) {
                                            var sharedPref =
                                                await SharedPreferences
                                                    .getInstance();
                                            sharedPref.setBool(
                                                SplashScreenState.KEYLOGIN,
                                                true);

                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage(eData)));
                                          }
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: screenHeight * 0.04),
                                        child: const Center(
                                          child: Text(
                                            "Sign In",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                fontFamily: 'Avenir'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: screenHeight * 0.12),
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Quick Fix!",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 20, right: 10),
                                                  child: Image.asset(
                                                      "assets/images/VectorGoogle.png")),
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 20, left: 10),
                                                  child: Image.asset(
                                                      "assets/images/VectorFB.png"))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: screenHeight * 0.109,
                                  left: screenWidth * 0.15),
                              child: InkWell(
                                onTap: () {
                                  internalState(() {
                                    isAlreadySignUpScreen =
                                        !isAlreadySignUpScreen;
                                    isWelcomeScreen = !isWelcomeScreen;
                                  });
                                },
                                child: const Text(
                                  "Take me to Sign Up!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Avenir',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                              width: 320,
                              height: 1,
                              margin: EdgeInsets.only(
                                  top: 10, left: screenWidth * 0.15),
                              color: Colors.grey,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                // NameInput field
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: screenHeight * 0.6,
                  left: screenWidth / 2 - 145.00,
                  child: AnimatedScale(
                    scale: isVendor ? 1.0 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      width: 290,
                      height: 40,
                      child: AnimatedOpacity(
                        opacity: isVendor ? 1.0 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 0),
                          opacity: nameSubmitted ? 0 : 1,
                          child: AnimatedScale(
                            duration: const Duration(seconds: 0),
                            scale: vendorDetailsScreen ? 0 : 1.0,
                            child: AnimatedScale(
                                duration: const Duration(seconds: 0),
                                scale: vendorOTPScreen ? 0 : 1.0,
                                child: nameField()),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // BackButton
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    top: screenHeight - 99.00,
                    left: screenWidth / 8,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: isVendor ? 1.0 : 0,
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 500),
                          scale: nameController.text.isNotEmpty ? 0 : 1,
                          child: TextButton.icon(
                            onPressed: () {
                              internalState(() {
                                isVendor = false;
                                _clicked = !_clicked;
                                isWelcomeScreen = !isWelcomeScreen;
                                _vendorPos = 335.00;
                              });
                            },
                            icon: const Icon(
                              Icons.backspace,
                              color: Colors.white,
                              size: 16,
                            ),
                            label: const Text(
                              "Back",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Avenir",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ))),

                // Vendor Details_vendor image
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  top: vendorDetailsScreen
                      ? screenHeight * 0.26
                      : screenHeight * 0.36,
                  left: vendorDetailsScreen
                      ? screenWidth * 0.4
                      : screenWidth / 2 - 74,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    width: vendorDetailsScreen ? 74.07 : 133.33,
                    height: vendorDetailsScreen ? 100.00 : 180.00,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 400),
                      scale: vendorDetailsScreen ? 1.00 : 0,
                      child: vendor(),
                    ),
                  ),
                ),

                // More About you
                AnimatedPositioned(
                  top: vendorDetailsScreen
                      ? screenHeight * 0.16
                      : screenHeight * 0.16,
                  left: 48.00,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedOpacity(
                    opacity: vendorDetailsScreen ? 1.00 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 500),
                      scale: vendorDetailsScreen ? 1.0 : 0,
                      child: moreAboutYou(),
                    ),
                  ),
                ),

                // VendorName_Submit Button
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  top: nameController.text.isNotEmpty
                      ? screenHeight * 0.88
                      : screenHeight * 1.5,
                  left: screenWidth / 2 - 80.00,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: nameSubmitted ? 0 : 1.0,
                    child: OutlinedButton(
                      onPressed: () {
                        if (_formfield.currentState!.validate()) {
                          internalState(() {
                            nameSubmitted = !nameSubmitted;
                            vendorDetailsScreen = !vendorDetailsScreen;
                          });
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        fixedSize: const Size(160, 40),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),

                // Vendor Details_Name_Box
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: vendorDetailsScreen
                      ? screenHeight * 0.41
                      : screenHeight * 0.6,
                  left: screenWidth / 2 - 100,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 500),
                    scale: vendorDetailsScreen ? 1.00 : 0,
                    child: nameBoxVendorDetails(),
                  ),
                ),

                // VendorDeatils_Email_Phone
                AnimatedPositioned(
                  duration: const Duration(seconds: 0),
                  top: screenHeight * 0.47,
                  left: screenWidth / 6,
                  child: AnimatedScale(
                    duration: const Duration(seconds: 0),
                    scale: vendorDetailsScreen ? 1.00 : 0,
                    child: emailField(),
                  ),
                ),

                // Back Button Vendor details screen
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 800),
                  top: screenHeight * 0.88,
                  left: vendorDetailsScreen ? screenWidth * 0.128 : 0,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: vendorDetailsScreen ? 1.0 : 0,
                    child: TextButton.icon(
                      onPressed: () {
                        internalState(() {
                          vendorDetailsScreen = !vendorDetailsScreen;
                          nameSubmitted = !nameSubmitted;
                        });
                      },
                      icon: const Icon(
                        Icons.backspace,
                        color: Colors.white,
                        size: 16,
                      ),
                      label: const Text(
                        "Back",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Avenir",
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),

                // Submit Button Vendor details screen
                AnimatedPositioned(
                  top: screenHeight * 0.884,
                  right: vendorDetailsScreen ? screenWidth * 0.128 : 0,
                  duration: const Duration(milliseconds: 800),
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: vendorDetailsScreen ? 1.0 : 0,
                    child: InkWell(
                      onTap: () {
                        if (_emailformfield.currentState!.validate()) {
                          internalState(() {
                            vendorDetailsScreen = !vendorDetailsScreen;
                            vendorOTPScreen = !vendorOTPScreen;
                          });
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade700,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Avenir'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // VendorOTP MoreAboutYou
                AnimatedPositioned(
                  top: vendorOTPScreen
                      ? screenHeight * 0.16
                      : screenHeight * 0.16,
                  left: screenWidth * 0.128,
                  duration: const Duration(milliseconds: 0),
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 0),
                    scale: vendorOTPScreen ? 1.0 : 0,
                    child: moreAboutYou(),
                  ),
                ),

                // VendorOTP Profile
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: vendorOTPScreen
                      ? screenHeight * 0.283
                      : screenHeight * 0.283,
                  left:
                      vendorOTPScreen ? screenWidth / 2 - 130 : screenWidth / 2,
                  child: AnimatedScale(
                    duration: const Duration(seconds: 0),
                    scale: vendorOTPScreen ? 1.00 : 0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: vendorOTPScreen ? 1 : 0,
                      child: vendorOtpProfile(),
                    ),
                  ),
                ),

                // VendorOTP wait for OTP
                AnimatedPositioned(
                  duration: const Duration(seconds: 0),
                  top: vendorOTPScreen
                      ? screenHeight * 0.495
                      : screenHeight * 0.495,
                  left: screenWidth / 2 - 44,
                  child: AnimatedScale(
                    duration: Duration(seconds: 0),
                    scale: vendorOTPScreen ? 1.00 : 0,
                    child: const SizedBox(
                      width: 88,
                      height: 116,
                      child: Text(
                        "Waiting for OTP",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Avenir",
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),

                // VendorOTP OTP Input
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: vendorOTPScreen
                      ? screenHeight * 0.525
                      : screenHeight * 0.525,
                  left: screenWidth / 2 - 145,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 500),
                    scale: vendorOTPScreen ? 1.00 : 0,
                    child: Container(
                      width: 290,
                      height: 50,
                      alignment: Alignment.center,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Colors.green)),
                        ),
                      ),
                    ),
                  ),
                ),

                // VendorOTP Cancel Button
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: screenHeight * 0.89,
                  left: vendorOTPScreen ? screenWidth / 2 - 35.5 : 0,
                  child: AnimatedScale(
                    duration: const Duration(seconds: 0),
                    scale: vendorOTPScreen ? 1.00 : 0,
                    child: TextButton.icon(
                      onPressed: () {
                        internalState(() {
                          vendorOTPScreen = !vendorOTPScreen;
                          vendorDetailsScreen = !vendorDetailsScreen;
                        });
                      },
                      icon: const Icon(
                        Icons.cancel_rounded,
                        color: Colors.red,
                        size: 16,
                      ),
                      label: const Text(
                        "Cancel",
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Avenir",
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),

                // Boozler
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: isWelcomeScreen
                      ? screenHeight * 0.42
                      : isVendor
                          ? screenHeight * 0.36
                          : boozlerScreen
                              ? screenHeight * 0.37
                              : screenHeight * 0.42,
                  left: isVendor
                      ? screenWidth
                      : boozlerScreen
                          ? screenWidth * 0.32
                          : screenWidth / 2 + 10,
                  child: AnimatedOpacity(
                    opacity: isVendor ? 0.00 : 1.00,
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedScale(
                      duration: const Duration(seconds: 0),
                      scale: isWelcomeScreen
                          ? 1.0
                          : boozlerScreen
                              ? 1
                              : boozlerDetailsScreen
                                  ? 0
                                  : 0,
                      child: GestureDetector(
                        onTap: () {
                          _clickedBoozler
                              ? null
                              : internalState(() {
                                  isWelcomeScreen = !isWelcomeScreen;
                                  boozlerScreen = !boozlerScreen;
                                  print("cdsv");
                                  _clickedBoozler = !_clickedBoozler;
                                });
                        },
                        child: boozler(),
                      ),
                    ),
                  ),
                ),

                // Boozler Text
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: isVendor ? 505.00 : screenHeight * 0.64,
                  left: isVendor ? screenWidth : screenWidth / 2 + 30,
                  child: AnimatedScale(
                    duration: const Duration(seconds: 0),
                    scale: isWelcomeScreen ? 1.0 : 0,
                    child: AnimatedOpacity(
                      opacity: isVendor ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 800),
                      child: boozlerText(),
                    ),
                  ),
                ),

                // Boozler Screen
                // WeCall You
                AnimatedPositioned(
                  top:
                      boozlerScreen ? screenHeight * 0.25 : screenHeight * 0.24,
                  left:
                      boozlerScreen ? screenWidth * 0.128 : screenWidth * 0.128,
                  duration: const Duration(milliseconds: 400),
                  child: AnimatedScale(
                    scale: boozlerScreen ? 1 : 0.00,
                    duration: const Duration(milliseconds: 400),
                    child: Container(child: weCallYou()),
                  ),
                ),

                // Name Input Field
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: screenHeight * 0.6,
                  left: screenWidth / 2 - 145.00,
                  child: AnimatedScale(
                    scale: boozlerScreen ? 1.0 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      width: 290,
                      height: 40,
                      child: AnimatedOpacity(
                        opacity: boozlerScreen ? 1.0 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 0),
                          opacity: nameSubmitted ? 0 : 1,
                          child: AnimatedScale(
                            duration: const Duration(seconds: 0),
                            scale: vendorDetailsScreen ? 0 : 1.0,
                            child: AnimatedScale(
                                duration: const Duration(seconds: 0),
                                scale: vendorOTPScreen ? 0 : 1.0,
                                child: nameFieldBoozler()),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // BackButton
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    top: boozlerScreen
                        ? screenHeight * 0.89
                        : screenHeight * 0.89,
                    left: boozlerScreen ? screenWidth * 0.12 : 0,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: boozlerScreen
                            ? 1.0
                            : isWelcomeScreen
                                ? 0
                                : 0,
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 500),
                          scale: nameControllerBoozler.text.isNotEmpty
                              ? 0
                              : isWelcomeScreen
                                  ? 0
                                  : 1,
                          child: TextButton.icon(
                            onPressed: () {
                              internalState(() {
                                boozlerScreen = !boozlerScreen;
                                isWelcomeScreen = !isWelcomeScreen;
                                _clickedBoozler = !_clickedBoozler;
                              });
                            },
                            icon: const Icon(
                              Icons.backspace,
                              color: Colors.white,
                              size: 16,
                            ),
                            label: const Text(
                              "Back",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Avenir",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ))),

                // BoozlerName_Submit Button
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  top: nameControllerBoozler.text.isNotEmpty
                      ? screenHeight * 0.88
                      : screenHeight * 1.5,
                  left: screenWidth / 2 - 80.00,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: nameSubmitted ? 0 : 1.0,
                    child: OutlinedButton(
                      onPressed: () {
                        if (_formfieldboozler.currentState!.validate()) {
                          internalState(() {
                            nameSubmitted = !nameSubmitted;
                            boozlerScreen = !boozlerScreen;
                            boozlerDetailsScreen = !boozlerDetailsScreen;
                          });
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        fixedSize: const Size(160, 40),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),

                // More About you
                AnimatedPositioned(
                  top: boozlerDetailsScreen
                      ? screenHeight * 0.16
                      : screenHeight * 0.15,
                  left: 48.00,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedOpacity(
                    opacity: boozlerDetailsScreen ? 1.00 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 500),
                      scale: boozlerDetailsScreen ? 1.0 : 0,
                      child: moreAboutYou(),
                    ),
                  ),
                ),

                // Boozler Details_boozler image
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  top: boozlerDetailsScreen
                      ? screenHeight * 0.26
                      : screenHeight * 0.36,
                  left: boozlerDetailsScreen
                      ? screenWidth * 0.4
                      : screenWidth / 2 - 74,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    width: boozlerDetailsScreen ? 74.07 : 133.33,
                    height: boozlerDetailsScreen ? 100.00 : 180.00,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 400),
                      scale: boozlerDetailsScreen ? 1.00 : 0,
                      child: boozler(),
                    ),
                  ),
                ),

                // Boozler Details_Name_Box
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: boozlerDetailsScreen
                      ? screenHeight * 0.41
                      : screenHeight * 0.6,
                  left: screenWidth / 2 - 100,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 500),
                    scale: boozlerDetailsScreen ? 1.00 : 0,
                    child: nameBoxBoozlerDetails(),
                  ),
                ),

                // BoozlerDeatils_Email_Phone
                AnimatedPositioned(
                  duration: const Duration(seconds: 0),
                  top: screenHeight * 0.47,
                  left: screenWidth / 6,
                  child: AnimatedScale(
                    duration: const Duration(seconds: 0),
                    scale: boozlerDetailsScreen ? 1.00 : 0,
                    child: emailFieldBoozler(),
                  ),
                ),

                // Back Button Boozlerr details screen
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 800),
                  top: screenHeight * 0.88,
                  left: boozlerDetailsScreen ? screenWidth * 0.128 : 0,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: boozlerDetailsScreen ? 1.0 : 0,
                    child: TextButton.icon(
                      onPressed: () {
                        internalState(() {
                          boozlerDetailsScreen = !boozlerDetailsScreen;
                          nameSubmitted = !nameSubmitted;
                          boozlerScreen = !boozlerScreen;
                        });
                      },
                      icon: const Icon(
                        Icons.backspace,
                        color: Colors.white,
                        size: 16,
                      ),
                      label: const Text(
                        "Back",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Avenir",
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),

                // Submit Button Boozler details screen
                AnimatedPositioned(
                  top: screenHeight * 0.884,
                  right: boozlerDetailsScreen ? screenWidth * 0.128 : 0,
                  duration: const Duration(milliseconds: 800),
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: boozlerDetailsScreen ? 1.0 : 0,
                    child: InkWell(
                      onTap: () {
                        if (_emailformfieldboozler.currentState!.validate()) {
                          internalState(() {
                            boozlerDetailsScreen = !boozlerDetailsScreen;
                            boozlerOTPScreen = !boozlerOTPScreen;
                          });
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade700,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Avenir'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // BoozlerOTP MoreAboutYou
                AnimatedPositioned(
                  top: boozlerOTPScreen
                      ? screenHeight * 0.16
                      : screenHeight * 0.16,
                  left: screenWidth * 0.128,
                  duration: const Duration(milliseconds: 0),
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 0),
                    scale: boozlerOTPScreen ? 1.0 : 0,
                    child: moreAboutYou(),
                  ),
                ),

                // BoozlerOTP Profile
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: boozlerOTPScreen
                      ? screenHeight * 0.283
                      : screenHeight * 0.283,
                  left: boozlerOTPScreen
                      ? screenWidth / 2 - 130
                      : screenWidth / 2,
                  child: AnimatedScale(
                    duration: const Duration(seconds: 0),
                    scale: boozlerOTPScreen ? 1.00 : 0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: boozlerOTPScreen ? 1 : 0,
                      child: boozlerOtpProfile(),
                    ),
                  ),
                ),

                // BoozlerOTP wait for OTP
                AnimatedPositioned(
                  duration: const Duration(seconds: 0),
                  top: boozlerOTPScreen
                      ? screenHeight * 0.495
                      : screenHeight * 0.495,
                  left: screenWidth / 2 - 44,
                  child: AnimatedScale(
                    duration: Duration(seconds: 0),
                    scale: boozlerOTPScreen ? 1.00 : 0,
                    child: const SizedBox(
                      width: 88,
                      height: 116,
                      child: Text(
                        "Waiting for OTP",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Avenir",
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),

                // VoozlerOTP OTP Input
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: boozlerOTPScreen
                      ? screenHeight * 0.525
                      : screenHeight * 0.525,
                  left: screenWidth / 2 - 145,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 500),
                    scale: boozlerOTPScreen ? 1.00 : 0,
                    child: Container(
                      width: 290,
                      height: 50,
                      alignment: Alignment.center,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Colors.green)),
                        ),
                      ),
                    ),
                  ),
                ),

                // BoozlerOTP Cancel Button
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: screenHeight * 0.89,
                  left: boozlerOTPScreen ? screenWidth / 2 - 35.5 : 0,
                  child: AnimatedScale(
                    duration: const Duration(seconds: 0),
                    scale: boozlerOTPScreen ? 1.00 : 0,
                    child: TextButton.icon(
                      onPressed: () {
                        internalState(() {
                          boozlerOTPScreen = !boozlerOTPScreen;
                          boozlerDetailsScreen = !boozlerDetailsScreen;
                        });
                      },
                      icon: const Icon(
                        Icons.cancel_rounded,
                        color: Colors.red,
                        size: 16,
                      ),
                      label: const Text(
                        "Cancel",
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Avenir",
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
