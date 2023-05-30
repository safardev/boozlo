import 'package:boozlo/eventTicket.dart';
import 'package:boozlo/events.dart';
import 'package:boozlo/main.dart' as main;
import 'package:boozlo/reservation.dart';
import 'package:boozlo/venueCardDetails.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:shared_preferences/shared_preferences.dart';

var name;

class HomePage extends StatefulWidget {
  var name = main.name;
  final eventDatas;

  HomePage(this.eventDatas);
  @override
  State<StatefulWidget> createState() => _HomePage(this.eventDatas);
}

class _HomePage extends State<HomePage> {
  final eData;
  _HomePage(this.eData);


  int currentIndex = 0;
  int exclusiveIndex = 0;
  int venueIndex = 0;
  int additionalOfferIndex = 0;
  int topImageSliderIndex=0;

  bool isEvent = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    DateTime date = DateTime.now();
    int eventIndex;

    List venueImages = [
      'assets/images/Venue1.png',
      'assets/images/Venue2.png',
      'assets/images/Venue1.png',
      'assets/images/Venue2.png'
    ];

    List nearYouImages = [
      "assets/images/NH7.png",
      "assets/images/NH7.png",
      "assets/images/NH7.png",
      "assets/images/NH7.png"
    ];
    List venueHeader = ["Toy Room", "Kitty Su", "Toy Room", "Kitty Su"];

    return Scaffold(
        backgroundColor: const Color(0xff111111),
        bottomNavigationBar: UnconstrainedBox(
          child: Container(
            width: screenWidth,
            height: 60,
            margin: const EdgeInsets.only(
                bottom: 10),
            decoration: BoxDecoration(
              color: const Color(0xff3C3C3C).withOpacity(0.5),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff353535).withOpacity(0.25),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                )
              ],
              // borderRadius: BorderRadius.circular(50)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: UnconstrainedBox(
              child: SizedBox(
                width: screenWidth * 0.85,
                child: GNav(
                  color: Colors.white,
                  activeColor: Colors.white,
                  gap: 8,
                  padding: const EdgeInsets.only(
                      top: 9, bottom: 9, left: 12, right: 12),
                  tabs: [
                    GButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(eData)));
                      },
                      icon: Icons.home,
                      text: "Home",
                      backgroundGradient: LinearGradient(colors: [
                        const Color(0xff3E3B92).withOpacity(0.5),
                        const Color(0xffF44369).withOpacity(0.5)
                      ]),
                    ),
                    GButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Events(eData)));
                      },
                      icon: Icons.speaker,
                      text: "Events",
                      backgroundGradient: LinearGradient(colors: [
                        const Color(0xff3E3B92).withOpacity(0.5),
                        const Color(0xffF44369).withOpacity(0.5)
                      ]),
                    ),
                    GButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Reservation(eData)));
                      },
                      icon: Icons.electric_bolt,
                      text: "Dining",
                      backgroundGradient: LinearGradient(colors: [
                        const Color(0xff3E3B92).withOpacity(0.5),
                        const Color(0xffF44369).withOpacity(0.5)
                      ]),
                    ),
                    GButton(
                      icon: Icons.movie_creation_outlined,
                      text: "Search",
                      backgroundGradient: LinearGradient(colors: [
                        const Color(0xff3E3B92).withOpacity(0.5),
                        const Color(0xffF44369).withOpacity(0.5)
                      ]),
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: "Settings",
                      backgroundGradient: LinearGradient(colors: [
                        const Color(0xff3E3B92).withOpacity(0.5),
                        const Color(0xffF44369).withOpacity(0.5)
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: StatefulBuilder(
          builder: (context, internalState) {
            return ListView(
              children: [
                // Hompage Top----->>>>>>
                SizedBox(
                  height: screenWidth*1.413,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: screenWidth*1.41,
                        child: CarouselSlider(
                          items: [
                            for(int i=0;i<4;i++)
                              Image.asset("assets/images/Frame 2661.png",
                                  fit: BoxFit.fill)
                          ],
                          options: CarouselOptions(
                              onPageChanged: (index,reason){
                                setState(() {
                                  topImageSliderIndex=index;
                                });
                              },
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              padEnds: false,
                              disableCenter: true,
                              viewportFraction: 1
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for(int i=0;i<4;i++)
                            AnimatedContainer(
                              margin:EdgeInsets.only(right: 4,top: screenWidth*1.362),
                              duration: const Duration(milliseconds: 400),
                              width: topImageSliderIndex==i?15:6,
                              height: 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: topImageSliderIndex==i? Color(0xff4776E6):Colors.white,
                              ),
                            )
                        ],
                      ),

                      // Top---->>>>>Header
                      UnconstrainedBox(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: screenWidth,
                            height: 124,
                            child: Column(
                              children: [
                                // Top---->>>>>Header---->>>>Introduction
                                UnconstrainedBox(
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                      width: screenWidth * 0.91,
                                      height: 66,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Top---->>>>>Header----->>>>>Introduction--->>>LeftSide
                                          UnconstrainedBox(
                                            alignment: Alignment.topLeft,
                                            child: SizedBox(
                                                width: screenWidth * 0.56,
                                                height: 66,
                                                child: const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Hi,",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Urbanist",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 32,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "Home, But Why?,",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Urbanist",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff636363)),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            margin: EdgeInsets.only(
                                                right: screenWidth * 0.026),
                                            child: Image.asset(
                                              'assets/images/profile.png',
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),

                                // Top---->>>>>Header---->>>>Search Bar
                                Container(
                                  width: screenWidth * 0.91,
                                  height: 50,
                                  child: TextField(
                                    cursorColor: Colors.white,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Colors.black.withOpacity(0.25),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: 'Search',
                                        hintStyle: TextStyle(
                                          fontFamily: "Urbanist",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xffffffff)
                                              .withOpacity(0.7),
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: Colors.white,
                                        ),
                                        suffixIcon: const ImageIcon(
                                          AssetImage("assets/images/equal.png"),
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),

                //HomePage---->>>>>>>Top Selector
                StickyHeader(
                  header: UnconstrainedBox(
                    child: Container(
                        width: screenWidth*0.914,
                        height: 80,
                        margin: EdgeInsets.only(top: 18,left: screenWidth*0.042),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Top Selector
                            UnconstrainedBox(
                              child: Container(
                                width: screenWidth * 0.8,
                                height: 48,
                                margin: const EdgeInsets.only(top: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 500),
                                        width: screenWidth * 0.25,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: const Color(0xff9BFFB1),
                                                ),
                                                child: const Icon(
                                                  Icons.coffee,
                                                  size: 16,
                                                )),
                                            Text(
                                              "Feed",
                                              style: TextStyle(
                                                  fontSize: isEvent ? 18.00 : 12.00,
                                                  fontFamily: "Urbanist",
                                                  color: isEvent
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Events(eData)));
                                      },
                                      child: Hero(
                                        tag: "events",
                                        child: AnimatedContainer(
                                          curve: Curves.easeInOut,
                                          width: screenWidth * 0.25,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: isEvent
                                                ? const Color(0xff9BFFB1)
                                                : Colors.black.withOpacity(0.5),
                                          ),
                                          duration: const Duration(milliseconds: 500),
                                          child: isEvent
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      "Events",
                                                      style: TextStyle(
                                                          fontSize:
                                                              isEvent ? 18.00 : 12.00,
                                                          fontFamily: "Urbanist",
                                                          color: isEvent
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Container(
                                                        width: 24,
                                                        height: 24,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20),
                                                          color: isEvent
                                                              ? Colors.white
                                                              : Color(0xff9BFFB1),
                                                        ),
                                                        child: const Icon(
                                                          Icons.coffee,
                                                          size: 16,
                                                        )
                                                        // Image.asset(
                                                        //   "assets/images/feed.png",
                                                        //   fit: BoxFit.fill,
                                                        // ),
                                                        ),
                                                  ],
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Container(
                                                        width: 24,
                                                        height: 24,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20),
                                                          color:
                                                              const Color(0xff9BFFB1),
                                                        ),
                                                        child: const Icon(
                                                          Icons.coffee,
                                                          size: 16,
                                                        )),
                                                    Text(
                                                      "Events",
                                                      style: TextStyle(
                                                          fontSize:
                                                              isEvent ? 18.00 : 12.00,
                                                          fontFamily: "Urbanist",
                                                          color: isEvent
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )
                                                  ],
                                                ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Reservation(eData)));
                                      },
                                      child: Hero(
                                        tag: "Dining",
                                        child: Container(
                                          width: screenWidth * 0.25,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.black.withOpacity(0.5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                    color: const Color(0xff9BFFB1),
                                                  ),
                                                  child: const Icon(
                                                    Icons.coffee,
                                                    size: 16,
                                                  )),
                                              Text(
                                                "Dining",
                                                style: TextStyle(
                                                    fontSize: isEvent ? 18.00 : 12.00,
                                                    fontFamily: "Urbanist",
                                                    color: isEvent
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontWeight: FontWeight.w700),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                  content: Column(
                    children: [
                      //HomePage---->>>>>>>Top Boozlo Selects
                      Container(
                        height: 151,
                        width: screenWidth,
                        margin: EdgeInsets.only(left: screenWidth * 0.042),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Boozlo Selects",
                              style: TextStyle(
                                  fontFamily: "Urbanist",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: screenWidth,
                              height: 124,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    margin: const EdgeInsets.only(top: 20, right: 12),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/boozlo selects.png"),
                                            fit: BoxFit.fill)),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Latest",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Additions",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    margin: const EdgeInsets.only(top: 20, right: 12),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/boozlo selects.png"),
                                            fit: BoxFit.fill)),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Top",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Rated",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    margin: const EdgeInsets.only(top: 20, right: 12),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/boozlo selects.png"),
                                            fit: BoxFit.fill)),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "50% Off",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "on Total bill",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 8,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    margin: const EdgeInsets.only(top: 20, right: 12),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/boozlo selects.png"),
                                            fit: BoxFit.fill)),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Top",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Rated",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    margin: const EdgeInsets.only(top: 20, right: 12),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/boozlo selects.png"),
                                            fit: BoxFit.fill)),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Nightlife",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "& Drinks",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    margin: const EdgeInsets.only(top: 20, right: 12),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/boozlo selects.png"),
                                            fit: BoxFit.fill)),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "All",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Deals",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      // HomePage---->>>>>>>Pay Bill here
                      Stack(
                        children: <Widget>[
                          Container(
                            width: screenWidth * 0.8,
                            height: screenWidth * 0.213,
                            margin:
                            EdgeInsets.only(top: 16, left: screenWidth * 0.042),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff242424),
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(left: 24),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("At the restaurant ?",
                                      style: TextStyle(
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.white)),
                                  Text("Pay your bill here and get heavy discounts",
                                      style: TextStyle(
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10,
                                          color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 88,
                            height: 28,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: screenWidth * 0.11, left: screenWidth * 0.7),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [Color(0xff4776E6), Color(0xff8E54E9)]),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Text(
                              "Pay Bill Here",
                              style: TextStyle(
                                  fontFamily: "Urbanist",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      // Homepage Middle----->>>>

                      // Homepage Middle----->>>>Happening Near You
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.832,
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Homepage Middle----->>>>Near You---->>>>Headline

                            Container(
                              width: screenWidth,
                              height: 24,
                              margin: EdgeInsets.only(
                                  left: screenWidth * 0.04,
                                  right: screenWidth * 0.04),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Happening Near You!",
                                    style: TextStyle(
                                        fontFamily: "Urbanist",
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "See All",
                                    style: TextStyle(
                                        fontFamily: "Urbanist",
                                        fontSize: 12,
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff2DD4BF),
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),

                            // Homepage Middle----->>>>Near You---->>>>Slider
                            Container(
                              width: screenWidth,
                              height: screenWidth * 0.682,
                              child: CarouselSlider(
                                items: [
                                  for (int i = 0; i < 4; i++)
                                    Container(
                                      width: screenWidth * 0.53,
                                      height: screenWidth * 0.64,
                                      margin:
                                      const EdgeInsets.only(top: 12, left: 16),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(nearYouImages[i]),
                                              opacity: 0.5,
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            margin: const EdgeInsets.only(
                                                top: 8, left: 134),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  DateFormat("MMMM").format(date),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "Urbanist",
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  DateFormat("d").format(date),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "Urbanist",
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w900),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 185,
                                            height: 92,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  margin:
                                                  const EdgeInsets.only(left: 12),
                                                  child: const Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "NH7 Weekender",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: "Urbanist",
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.w700),
                                                      ),
                                                      Text(
                                                        "Pune",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: "Urbanist",
                                                            fontSize: 8,
                                                            fontWeight:
                                                            FontWeight.w700),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 161,
                                                  margin:
                                                  const EdgeInsets.only(left: 8),
                                                  child: Row(
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      const Column(
                                                        children: [
                                                          Text(
                                                            "Starts from",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily:
                                                                "Urbanist",
                                                                fontSize: 8,
                                                                fontWeight:
                                                                FontWeight.w700),
                                                          ),
                                                          Text(
                                                            "₹1999",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily:
                                                                "Urbanist",
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.w700),
                                                          )
                                                        ],
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                            width: 77,
                                                            height: 28,
                                                            alignment:
                                                            Alignment.center,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(12),
                                                                gradient:
                                                                const LinearGradient(
                                                                    begin:
                                                                    Alignment
                                                                        .topLeft,
                                                                    end: Alignment
                                                                        .topRight,
                                                                    colors: [
                                                                      Color(
                                                                          0xff4776E6),
                                                                      Color(
                                                                          0xff8E54E9),
                                                                    ])),
                                                            child: const Text(
                                                              "Book Now",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  "Urbanist",
                                                                  fontWeight:
                                                                  FontWeight.w700,
                                                                  fontSize: 10,
                                                                  color:
                                                                  Colors.white),
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                                options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                  initialPage: 0,
                                  aspectRatio: 5 / 6,
                                  // enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                  padEnds: false,
                                  // disableCenter: true,
                                  viewportFraction: 0.5,
                                  // reverse: false,
                                ),
                              ),
                            ),
                            // SizedBox(height: 10,),

                            // Image Indicator
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: currentIndex > 0
                                  ? screenWidth * 0.4 * currentIndex.toDouble()
                                  : screenWidth * 0.25,
                              height: 4,
                              margin:
                              EdgeInsets.only(left: screenWidth * 0.064, top: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff4776E6),
                              ),
                            )
                          ],
                        ),
                      ),

                      // Featured Artists
                      Container(
                        width: screenWidth,
                        height: 142,
                        margin: EdgeInsets.only(top: 24, left: screenWidth * 0.053),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Featured Artists",
                              style: TextStyle(
                                  fontFamily: "Urbanist",
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: screenWidth,
                              height: 98,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 72,
                                        height: 72,
                                        margin: EdgeInsets.only(
                                            left: 8.5, right: 8.5, top: 8),
                                        child: Image.asset(
                                          "assets/images/yellow diary.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        "Yellow Diary",
                                        style: TextStyle(
                                            fontFamily: "Urbanist",
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 72,
                                        height: 72,
                                        margin: EdgeInsets.only(
                                            left: 8.5, right: 8.5, top: 8),
                                        child: Image.asset(
                                          "assets/images/sidhhe.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        "Seedhe Maut",
                                        style: TextStyle(
                                            fontFamily: "Urbanist",
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 72,
                                        height: 72,
                                        margin: EdgeInsets.only(
                                            left: 8.5, right: 8.5, top: 8),
                                        child: Image.asset(
                                          "assets/images/prabhdeep.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        "Prabhdeep",
                                        style: TextStyle(
                                            fontFamily: "Urbanist",
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 72,
                                        height: 72,
                                        margin: EdgeInsets.only(
                                            left: 8.5, right: 8.5, top: 8),
                                        child: Image.asset(
                                          "assets/images/lumineers.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        "The Lumineers",
                                        style: TextStyle(
                                            fontFamily: "Urbanist",
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 72,
                                        height: 72,
                                        margin: const EdgeInsets.only(
                                            left: 8.5, right: 8.5, top: 8),
                                        child: Image.asset(
                                          "assets/images/yellow diary.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        "Yellow Diary",
                                        style: TextStyle(
                                            fontFamily: "Urbanist",
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 72,
                                        height: 72,
                                        margin: const EdgeInsets.only(
                                            left: 8.5, right: 8.5, top: 8),
                                        child: Image.asset(
                                          "assets/images/sidhhe.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        "Seedhe Maut",
                                        style: TextStyle(
                                            fontFamily: "Urbanist",
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 72,
                                        height: 72,
                                        margin: const EdgeInsets.only(
                                            left: 8.5, right: 8.5, top: 8),
                                        child: Image.asset(
                                          "assets/images/prabhdeep.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        "Prabhdeep",
                                        style: TextStyle(
                                            fontFamily: "Urbanist",
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 72,
                                        height: 72,
                                        margin: EdgeInsets.only(
                                            left: 8.5, right: 8.5, top: 8),
                                        child: Image.asset(
                                          "assets/images/lumineers.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        "The Lumineers",
                                        style: TextStyle(
                                            fontFamily: "Urbanist",
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      // Homepage Middle------>Venues
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        width: screenWidth,
                        height: screenWidth * 0.75,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Homepage Middle----->>>>Venue---->>>>Headline
                            Container(
                              width: screenWidth,
                              height: 24,
                              margin: EdgeInsets.only(
                                  left: screenWidth * 0.053,
                                  right: screenWidth * 0.04),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Venues",
                                    style: TextStyle(
                                        fontFamily: "Urbanist",
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "See All",
                                    style: TextStyle(
                                        fontFamily: "Urbanist",
                                        fontSize: 12,
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff2DD4BF),
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),

                            // Homepage Middle----->>>>Venue---->>>>Slider
                            Container(
                                width: screenWidth,
                                height: screenWidth * 0.6,
                                margin:
                                EdgeInsets.only(left: screenWidth * 0.04, top: 14),
                                child: CarouselSlider(
                                  items: [
                                    for (int i = 0; i < 1; i++)
                                      InkWell(
                                        onTap:(){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VenueCardDetails()));
                                        },
                                        child: Hero(
                                          tag: "kuchh v",
                                          child: SizedBox(
                                            width: screenWidth * 0.426,
                                            height: screenWidth * 0.709,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: screenWidth * 0.426,
                                                  height: screenWidth * 0.586,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: const Color(0xffEDEDED),
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(10)),
                                                  child: Image.asset(
                                                    venueImages[i],
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                  options: CarouselOptions(
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        venueIndex = index;
                                      });
                                    },
                                    initialPage: 0,
                                    aspectRatio: 80 / 133,
                                    // enlargeCenterPage: true,
                                    enableInfiniteScroll: false,
                                    padEnds: false,
                                    disableCenter: true,
                                    viewportFraction: 0.48,
                                    // reverse: false,
                                  ),
                                ),
                              ),

                            // SizedBox(height: 10,),

                            // Image Indicator
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: venueIndex > 0
                                  ? screenWidth * 0.4 * venueIndex.toDouble()
                                  : screenWidth * 0.25,
                              height: 4,
                              margin: EdgeInsets.only(left: screenWidth * 0.064,top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff4776E6),
                              ),
                            )
                          ],
                        ),
                      ),

                      // Homepage Middle----->>>>Additional Offers
                      UnconstrainedBox(
                        child: Container(
                          width: screenWidth * 0.874,
                          height: screenWidth * 0.368,
                          margin: const EdgeInsets.only(top: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Additional Offers",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Urbanist",
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              Stack(
                                  children: <Widget>[
                                    SizedBox(
                                      width: double.infinity,
                                      height: screenWidth * 0.285,
                                      child: CarouselSlider(
                                          items: [
                                            for (int i = 0; i < 4; i++)
                                              Container(
                                                width: double.infinity,
                                                height: screenWidth * 0.285,
                                                margin: const EdgeInsets.only(right: 15),
                                                decoration: BoxDecoration(
                                                    color: const Color(0xff202020),
                                                    borderRadius: BorderRadius.circular(20)),
                                                child:Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(top: screenWidth*0.064,left: screenWidth*0.102,right: 12),
                                                      width: 24,
                                                      height: 24,
                                                      child: Image.asset(
                                                        "assets/images/flatoff.png",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(top: screenWidth*0.04),
                                                      child: const Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Flat ₹200 off",
                                                            style: TextStyle(
                                                                fontFamily: "Urbanist",
                                                                fontWeight:
                                                                FontWeight.w700,
                                                                fontSize: 16,
                                                                color: Colors.white),
                                                          ),
                                                          Text(
                                                            "Use Code FLATMEOFF20 | Above ₹2000",
                                                            style: TextStyle(
                                                                fontFamily: "Urbanist",
                                                                fontWeight:
                                                                FontWeight.w700,
                                                                fontSize: 12,
                                                                color: Colors.white),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),

                                          ],
                                          options: CarouselOptions(
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  additionalOfferIndex = index;
                                                });
                                              },
                                              initialPage: 0,
                                              enableInfiniteScroll: false,
                                              padEnds: false,
                                              disableCenter: true,
                                              viewportFraction: 1)),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for(int i=0;i<4;i++)
                                          AnimatedContainer(
                                            margin:EdgeInsets.only(right: 4,top: screenWidth*0.234),
                                            duration: const Duration(milliseconds: 400),
                                            width: additionalOfferIndex==i?15:6,
                                            height: 6,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: additionalOfferIndex==i? Color(0xff4776E6):Colors.white,
                                            ),
                                          )
                                      ],
                                    )

                                  ]

                              ),

                            ],
                          ),
                        ),
                      ),

                      // Homepage Middle------>Exclusive events
                      Container(
                        width: screenWidth,
                        height: 360,
                        margin: const EdgeInsets.only(top: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Homepage Middle----->>>>Exclusive---->>>>Headline
                            Container(
                              width: screenWidth,
                              height: 24,
                              margin: EdgeInsets.only(
                                  left: screenWidth * 0.04,
                                  right: screenWidth * 0.04),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Exclusive Events",
                                    style: TextStyle(
                                        fontFamily: "Urbanist",
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "See All",
                                    style: TextStyle(
                                        fontFamily: "Urbanist",
                                        fontSize: 12,
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff2DD4BF),
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),

                            // Homepage Middle----->>>>Exclusive---->>>>Slider
                            SizedBox(
                              width: screenWidth,
                              height: 332,
                              child: CarouselSlider(
                                items: [
                                  for (int i = 0; i <eData.length; i++)
                                    UnconstrainedBox(
                                      child: Container(
                                        width: screenWidth * 0.9,
                                        height: 296,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: screenWidth * 0.9,
                                              height: 176,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                              ),
                                              child: Image.network(
                                                eData[i]['fields']['Image'][0]['url'],
                                              ),
                                            ),
                                            Container(
                                              width: screenWidth * 0.9,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                      bottomLeft:
                                                      Radius.circular(12),
                                                      bottomRight:
                                                      Radius.circular(12)),
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                      colors: [
                                                        const Color(0xff4776E6)
                                                            .withOpacity(0.6),
                                                        const Color(0xff8E54E9)
                                                            .withOpacity(0.6),
                                                      ])),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: screenWidth * 0.04,
                                                        right: screenWidth * 0.04),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          (eData[i]['fields']['Heading']).toString(),
                                                          style: const TextStyle(
                                                              color: Colors.white,
                                                              fontFamily: "Urbanist",
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.w700),
                                                        ),
                                                        Text(
                                                          "${eData[i]['fields']['Date']} \u2022 ${eData[i]['fields']['Location']}",
                                                          style: const TextStyle(
                                                              color: Colors.white,
                                                              fontFamily: "Urbanist",
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w400),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  EventTicket(eData,exclusiveIndex)));
                                                    },
                                                    child: Hero(
                                                      tag: "exclusiveEvents",
                                                      child: Container(
                                                        width: screenWidth * 0.82,
                                                        height: 49,
                                                        margin: EdgeInsets.only(
                                                            left: screenWidth * 0.04,
                                                            right: screenWidth * 0.04),
                                                        decoration: BoxDecoration(
                                                          gradient: LinearGradient(
                                                              begin: Alignment.topLeft,
                                                              end: Alignment.topRight,
                                                              colors: [
                                                                const Color(0xff4776E6)
                                                                    .withOpacity(0.6),
                                                                const Color(0xff8E54E9)
                                                                    .withOpacity(0.6),
                                                              ]),
                                                          borderRadius:
                                                          BorderRadius.circular(8),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            SizedBox(
                                                              width: 25,
                                                              height: 25,
                                                              child: Image.asset(
                                                                "assets/images/minecraft.png",
                                                                fit: BoxFit.fill,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 4,
                                                            ),
                                                            Text(
                                                              "₹${eData[i]['fields']['Starting Price']}",
                                                              style: const TextStyle(
                                                                  color: Colors.white,
                                                                  fontFamily:
                                                                  "Urbanist",
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                  FontWeight.w700),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                                options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      exclusiveIndex = index;
                                    });
                                  },
                                  initialPage: 0,
                                  // enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                  padEnds: false,
                                  disableCenter: true,
                                  // disableCenter: true,
                                  viewportFraction: 1,
                                  // reverse: false,
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: exclusiveIndex > 0
                                  ? (screenWidth/eData.length)*(exclusiveIndex+0.5)-20.00
                                  : (screenWidth/eData.length),
                              height: 4,
                              margin: EdgeInsets.only(left: screenWidth * 0.064),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff4776E6),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),




              ],
            );
          },
        ));
  }
}
