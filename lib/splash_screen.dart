import 'dart:async';
import 'dart:convert';
import 'package:boozlo/homepage.dart';
import 'package:boozlo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "Login";
  List credRec = [];
  List eventRec = [];
  List venueRec=[];

  Future<bool> credentialRecord() async {
    var url = "https://api.airtable.com/v0/applrcsxcABIuqmqu/Users";
    var key2 = dotenv.env['API_KEY_BOOZLO'];

    var urlParse = Uri.parse(url);
    Response response = await http.get(urlParse, headers: {
      "Authorization": "Bearer $key2",
    });
    var data = jsonDecode(response.body);
    List<dynamic> records = data['records'];
    for (var record in records) {
      String email = record['fields']['email'];
      String pass = record['fields']['password'];
      String name = record['fields']['name'];
      credRec.add([email, pass, name]);
    }
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> eventData() async {
    var url = "https://api.airtable.com/v0/applrcsxcABIuqmqu/Events";
    var key2 = dotenv.env['API_KEY_BOOZLO'];

    var urlParse = Uri.parse(url);
    Response response = await http.get(urlParse, headers: {
      "Authorization": "Bearer $key2",
    });
    var data = jsonDecode(response.body);
    List<dynamic> records = data['records'];

    if (response.statusCode == 200) {
      eventRec = records;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> venueData() async {
    var url = "https://api.airtable.com/v0/applrcsxcABIuqmqu/Venues";
    var key2 = dotenv.env['API_KEY_BOOZLO'];

    var urlParse = Uri.parse(url);
    Response response = await http.get(urlParse, headers: {
      "Authorization": "Bearer $key2",
    });
    var data = jsonDecode(response.body);
    List<dynamic> records = data['records'];

    if (response.statusCode == 200) {
      venueRec = records;
      print(venueRec);
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Image.asset(
            'assets/images/img_boozlo.png',
            width: 255.24,
            height: 180,
          ),
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    await venueData();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    if (await credentialRecord() && await eventData()) {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePage(eventRec)));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                      title: "Boozlo",
                      datas: credRec,
                      eData: eventRec,
                    )));
      }
    }

    // Timer(const Duration(seconds: 3), () {});
  }
}
