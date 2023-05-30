import 'dart:async';

import 'package:boozlo/main.dart' as main;
import 'package:boozlo/reservation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'homepage.dart';

class Events extends StatefulWidget {
  final eventDatas;
  Events(this.eventDatas);

  @override
  State<StatefulWidget> createState() => _Events(this.eventDatas);
}

class _Events extends State<Events> {
  final eData;
  _Events(this.eData);


  bool isAnimate = false;
  bool isSearchBar = false;

  final searchController = TextEditingController();
  FocusNode focusNode = FocusNode();




  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        isAnimate = true;
      });
    });
  }


  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();

    super.dispose();
  }

  int currentIndex = 0;
  int musicIndex = 0;
  int trendIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    DateTime date = DateTime.now();

    List nearYouImages = [
      "assets/images/NH7.png",
      "assets/images/NH7.png",
      "assets/images/NH7.png",
      "assets/images/NH7.png"
    ];

    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: UnconstrainedBox(
          child: Container(
            width: screenWidth,
            height: 60,
            margin: const EdgeInsets.only(
                // left: screenWidth * 0.07,
                // right: screenWidth * 0.07,
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
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: UnconstrainedBox(
              child: SizedBox(
                width: screenWidth * 0.85,
                child: GNav(
                  selectedIndex: 1,
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
        body: StatefulBuilder(builder: (context, internalState) {
          return ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hompage Top----->>>>>>
                  Container(
                    height: isSearchBar ? 800 : 250,
                    margin: const EdgeInsets.only(bottom: 0),
                    child: Stack(
                      children: <Widget>[
                        AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                          opacity: isSearchBar?0.3:1,
                          child: Container(
                            margin: const EdgeInsets.only(top: 80),
                            width: screenWidth,
                            height: 170,
                            child: Image.asset(
                              "assets/images/HomePage Purple.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: isSearchBar?0.3:1,
                          child: SizedBox(
                            width: screenWidth,
                            height: 166,
                            child: Image.asset(
                              "assets/images/HomePageGreen.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: isSearchBar?0.3:1,
                          child: SizedBox(
                            width: screenWidth,
                            height: 166,
                            child: Image.asset(
                              "assets/images/orange.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // Top
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: isSearchBar ? 0 : 1.0,
                          child: Container(
                              width: double.infinity,
                              height: 182.00,
                              margin: const EdgeInsets.only(top: 60),
                              child: Column(
                                children: [
                                  // Top---->>>>>Header
                                  UnconstrainedBox(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                        width: screenWidth,
                                        height: 130,
                                        child: Column(
                                          children: [
                                            // Top---->>>>>Header---->>>>Introduction
                                            UnconstrainedBox(
                                              alignment: Alignment.topCenter,
                                              child: AnimatedOpacity(
                                                duration:
                                                    const Duration(milliseconds: 300),
                                                opacity: isSearchBar?0:1.0,

                                                child: SizedBox(
                                                    width: screenWidth * 0.91,
                                                    height: 72,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        // Top---->>>>>Header----->>>>>Introduction--->>>LeftSide
                                                        UnconstrainedBox(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: SizedBox(
                                                            width: screenWidth *
                                                                0.56,
                                                            height: 72,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                // ---->>>>Date and Time
                                                                SizedBox(
                                                                  width:
                                                                      screenWidth *
                                                                          0.41,
                                                                  height: 24,
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        DateFormat(
                                                                                'MMMM d, y')
                                                                            .format(
                                                                                date),
                                                                        style:
                                                                            const TextStyle(
                                                                          fontFamily:
                                                                              'Urbanist',
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          color: Color(
                                                                              0xff7C7C7C),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 10,
                                                                        height: 0,
                                                                      ),
                                                                      Image.asset(
                                                                        'assets/images/sunset.png',
                                                                        height:
                                                                            22,
                                                                        width: 24,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),

                                                                // --------->>>>Explore events
                                                                Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.56,
                                                                  height: 48,
                                                                  alignment: Alignment
                                                                      .bottomLeft,
                                                                  child:
                                                                      const Text(
                                                                    "Explore Events",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontSize:
                                                                            32,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 40,
                                                          height: 40,
                                                          margin: EdgeInsets.only(
                                                              right: screenWidth *
                                                                  0.026),
                                                          child: Image.asset(
                                                            'assets/images/profile.png',
                                                            width: 40,
                                                            height: 40,
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ),

                                            // Top---->>>>>Header---->>>>Search Bar
                                            AnimatedOpacity(
                                              duration: Duration(milliseconds: 300),
                                              opacity: isSearchBar?0:1,
                                              child: Container(
                                                width: screenWidth * 0.91,
                                                height: 50,
                                                margin:
                                                    const EdgeInsets.only(top: 8),
                                                child: TextField(
                                                  onTap: (){
                                                    internalState((){
                                                      isSearchBar=true;
                                                    });
                                                  },
                                                  onEditingComplete: (){
                                                    focusNode.unfocus();
                                                    isSearchBar=false;
                                                  },
                                                  focusNode: focusNode,
                                                  controller: searchController,
                                                  cursorColor: Colors.white,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.black
                                                          .withOpacity(0.25),
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.black
                                                                .withOpacity(0)),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(10),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0))),
                                                      hintText: 'Search',
                                                      hintStyle: TextStyle(
                                                        fontFamily: "Urbanist",
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w700,
                                                        color:
                                                            const Color(0xffffffff)
                                                                .withOpacity(0.7),
                                                      ),
                                                      prefixIcon: const Icon(
                                                        Icons.search,
                                                        color: Colors.white,
                                                      ),
                                                      suffixIcon: const ImageIcon(
                                                        AssetImage(
                                                            "assets/images/equal.png"),
                                                        color: Colors.white,
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),

                                  // Top Selector
                                  UnconstrainedBox(
                                    child: AnimatedScale(
                                      duration: const Duration(milliseconds: 300),
                                      scale: isSearchBar?0:1,
                                      child: Container(
                                        width: screenWidth * 0.8,
                                        height: 48,
                                        margin: const EdgeInsets.only(top: 4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Events(eData)));
                                                      },
                                                      child: Container(
                                                        width: screenWidth * 0.048,
                                                        height: screenWidth * 0.048,
                                                        margin:
                                                            const EdgeInsets.only(
                                                                right: 12.83),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(30),
                                                            color: Colors.black,
                                                            border: Border.all(
                                                                color:
                                                                    Colors.white)),
                                                        child: const Icon(
                                                          Icons.arrow_back,
                                                          size: 18,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Events(eData)));
                                                      },
                                                      child: AnimatedContainer(
                                                          curve: Curves.easeInOut,
                                                          width: isAnimate
                                                              ? screenWidth * 0.293
                                                              : screenWidth * 0.25,
                                                          height:
                                                              screenWidth * 0.085,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(20),
                                                            color: const Color(
                                                                0xff9BFFB1),
                                                          ),
                                                          duration: const Duration(
                                                              milliseconds: 500),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              const Text(
                                                                "Events",
                                                                style: TextStyle(
                                                                    fontSize: 18.00,
                                                                    fontFamily:
                                                                        "Urbanist",
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              Container(
                                                                  width: 24,
                                                                  height: 24,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                20),
                                                                    color: Colors
                                                                        .white,
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
                                                          )),
                                                    )
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Reservation(eData)));
                                                  },
                                                  child: Container(
                                                    width: screenWidth * 0.074,
                                                    height: screenWidth * 0.074,
                                                    margin: const EdgeInsets.only(
                                                        left: 12),
                                                    child: Container(
                                                      width: screenWidth * 0.042,
                                                      height: screenWidth * 0.042,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  30),
                                                          color: const Color(
                                                              0xff9BFFB1)),
                                                      child: const Icon(
                                                        Icons.coffee,
                                                        size: 15,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: 100,
                          child: AnimatedScale(
                            duration: Duration(milliseconds: 500),
                            scale: isSearchBar ? 1.0 : 0,
                            child: Column(
                              children: [
                                Container(
                                  width: screenWidth * 0.91,
                                  height: isSearchBar ? 50 : 0,
                                  margin: const EdgeInsets.only(top: 8),
                                  child: TextField(
                                    onTap: () {
                                      internalState(() {
                                        isSearchBar = true;
                                      });
                                    },
                                    onEditingComplete: () {
                                      focusNode.unfocus();
                                      isSearchBar = false;
                                    },
                                    focusNode: focusNode,
                                    controller: searchController,
                                    cursorColor: Colors.white,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                        Colors.black.withOpacity(0.25),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                              Colors.black.withOpacity(0)),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black
                                                    .withOpacity(0))),
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
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 21, left: screenWidth * 0.064),
                                  width: screenWidth,
                                  height: isSearchBar ? 80 : 0,
                                  child: Column(
                                    children: [
                                      //Music
                                      Container(
                                        child: Row(
                                          children: [
                                            const Text(
                                              "Music",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Urbanist",
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                              width: screenWidth * 0.026,
                                              margin: EdgeInsets.only(
                                                  left: screenWidth * 0.037,
                                                  right: screenWidth * 0.053),
                                              height: 10,
                                              child: Icon(
                                                Icons.music_note,
                                                color: Colors.white,
                                                size: screenWidth * 0.026,
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.70,
                                              height: 20,
                                              child: ListView(
                                                scrollDirection:
                                                Axis.horizontal,
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10, left: 0),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("DJ",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("Hip Hop",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text(
                                                        "Classical",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("Techno",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("EDM",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("Pop",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("Rock",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                      // Fixer
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            const Text(
                                              "Fixer",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Urbanist",
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                              width: screenWidth * 0.026,
                                              margin: EdgeInsets.only(
                                                  left: screenWidth * 0.05,
                                                  right: screenWidth * 0.053),
                                              height: 10,
                                              child: Icon(
                                                Icons.settings,
                                                color: Colors.white,
                                                size: screenWidth * 0.026,
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.7,
                                              height: 20,
                                              child: ListView(
                                                scrollDirection:
                                                Axis.horizontal,
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10, left: 0),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("Beer",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("Cider",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text(
                                                        "Cocktail",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("Whiskey",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text(
                                                        "Mocktails",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("Vines",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                      // Vibe
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        width: screenWidth,
                                        child: Row(
                                          children: [
                                            const Text(
                                              "Vibe",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Urbanist",
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                              width: screenWidth * 0.05,
                                              margin: EdgeInsets.only(
                                                  left: screenWidth * 0.037,
                                                  right: screenWidth * 0.053),
                                              height: 10,
                                              child: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                                size: screenWidth * 0.026,
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.689,
                                              height: 20,
                                              child: ListView(
                                                scrollDirection:
                                                Axis.horizontal,
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10, left: 0),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text(
                                                        "Aesthetic",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("Calm",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("Elite",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("Outdoor",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text("Terrace",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2,
                                                        right: 18,
                                                        bottom: 4,
                                                        left: 18),
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xffEDEDED),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(4)),
                                                    child: const Text(
                                                        "Peaceful",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontFamily:
                                                            "Urbanist",
                                                            fontSize: 10,
                                                            color:
                                                            Colors.white)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    width: screenWidth,
                                    height: 142,
                                    margin: EdgeInsets.only(top: 15, left: screenWidth * 0.053),
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
                                                  Text(
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
                                                    margin: EdgeInsets.only(
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
                                
                                Container(
                                  width: screenWidth,
                                  height: isSearchBar ? screenWidth * 0.93 : 0,
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      // Homepage Middle----->>>>Near You---->>>>Headline

                                      Container(
                                        width: screenWidth,
                                        height: 24,
                                        margin: EdgeInsets.only(
                                            left: screenWidth * 0.04,
                                            right: screenWidth * 0.04),
                                        child: const Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Happening Near You!",
                                              style: TextStyle(
                                                  fontFamily: "Urbanist",
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: screenWidth * .75,
                                        height: 1,
                                        margin: EdgeInsets.only(
                                            left: screenWidth * 0.04, top: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Color(0xff4776E6),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: screenWidth * 0.04, top: 8),
                                        child: const Text(
                                          "29 Upcoming events in Delhi NCR",
                                          style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff686868)),
                                        ),
                                      ),

                                      // Homepage Middle----->>>>Near You---->>>>Slider
                                      Container(
                                        width: screenWidth,
                                        height: screenWidth * 0.736,
                                        margin: EdgeInsets.only(
                                            left: screenWidth * 0.04),
                                        child: CarouselSlider(
                                          items: [
                                            for (int i = 0; i < 4; i++)
                                              Container(
                                                width: screenWidth * 0.53,
                                                height: screenWidth * 0.64,
                                                margin: const EdgeInsets.only(
                                                    top: 12, left: 16),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/NH7.png"),
                                                        opacity: 0.5,
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      height: 50,
                                                      margin:
                                                      const EdgeInsets.only(
                                                          top: 8,
                                                          left: 134),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(10),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            DateFormat("MMMM")
                                                                .format(date),
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                "Urbanist",
                                                                fontSize: 12,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                          ),
                                                          Text(
                                                            DateFormat("d")
                                                                .format(date),
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                "Urbanist",
                                                                fontSize: 20,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 185,
                                                      height: 92,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            margin:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 12),
                                                            child: const Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  "NH7 Weekender",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                      "Urbanist",
                                                                      fontSize:
                                                                      16,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                                ),
                                                                Text(
                                                                  "Pune",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                      "Urbanist",
                                                                      fontSize:
                                                                      8,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 161,
                                                            margin:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 8),
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
                                                                          color: Colors
                                                                              .white,
                                                                          fontFamily:
                                                                          "Urbanist",
                                                                          fontSize:
                                                                          8,
                                                                          fontWeight:
                                                                          FontWeight.w700),
                                                                    ),
                                                                    Text(
                                                                      "₹1999",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontFamily:
                                                                          "Urbanist",
                                                                          fontSize:
                                                                          16,
                                                                          fontWeight:
                                                                          FontWeight.w700),
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                    width: 77,
                                                                    height: 28,
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.topRight, colors: [
                                                                          Color(0xff4776E6),
                                                                          Color(0xff8E54E9),
                                                                        ])),
                                                                    child: const Text(
                                                                      "Book Now",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          "Urbanist",
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          fontSize:
                                                                          10,
                                                                          color:
                                                                          Colors.white),
                                                                    ))
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
                                        duration:
                                        const Duration(milliseconds: 400),
                                        width: currentIndex > 0
                                            ? screenWidth *
                                            0.4 *
                                            currentIndex.toDouble()
                                            : screenWidth * 0.25,
                                        height: 4,
                                        margin: EdgeInsets.only(
                                            left: screenWidth * 0.1, top: 16),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Color(0xff4776E6),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Music Fixer Vibe
                  AnimatedScale(
                    duration: const Duration(milliseconds: 500),
                    scale: isSearchBar?0:1.0,
                    child: Container(
                      margin: EdgeInsets.only(top: 17, left: screenWidth*0.064),
                      width: screenWidth,
                      height: 80,
                      child: Column(
                        children: [
                          //Music
                          Container(
                            child: Row(
                              children: [
                                const Text(
                                  "Music",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Urbanist",
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                                Container(
                                  width: screenWidth * 0.026,
                                  margin: EdgeInsets.only(
                                      left: screenWidth * 0.037, right: screenWidth*0.053),
                                  height: 10,
                                  child: Icon(
                                    Icons.music_note,
                                    color: Colors.white,
                                    size: screenWidth * 0.026,
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.70,
                                  height: 20,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(
                                            right: 10, left: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("DJ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Hip Hop",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Classical",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Techno",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("EDM",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Pop",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Rock",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          // Fixer
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  "Fixer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Urbanist",
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                                Container(
                                  width: screenWidth * 0.026,
                                  margin: EdgeInsets.only(
                                      left: screenWidth * 0.05, right: screenWidth*0.053),
                                  height: 10,
                                  child: Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                    size: screenWidth * 0.026,
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.7,
                                  height: 20,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(
                                            right: 10, left: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Beer",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Cider",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Cocktail",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Whiskey",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Mocktails",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Vines",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          // Vibe
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: screenWidth,
                            child: Row(
                              children: [
                                const Text(
                                  "Vibe",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Urbanist",
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                                Container(
                                  width: screenWidth * 0.05,
                                  margin: EdgeInsets.only(
                                      left: screenWidth * 0.037, right: screenWidth*0.053),
                                  height: 10,
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: screenWidth * 0.026,
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.689,
                                  height: 20,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(
                                            right: 10, left: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Aesthetic",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Calm",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Elite",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Outdoor",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Terrace",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            right: 18,
                                            bottom: 4,
                                            left: 18),
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: const Color(0xffEDEDED),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text("Peaceful",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Urbanist",
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ---->>>>Near You

                  !isSearchBar?AnimatedScale(
                    duration: Duration(milliseconds: 500),
                    scale: isSearchBar?0:1.0,
                    child: Container(
                      width: screenWidth,
                      height: screenWidth * 0.93,
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
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth * .75,
                            height: 1,
                            margin:
                                EdgeInsets.only(left: screenWidth * 0.04, top: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff4776E6),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: screenWidth * 0.04, top: 8),
                            child: const Text(
                              "29 Upcoming events in Delhi NCR",
                              style: TextStyle(
                                  fontFamily: "Urbanist",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff686868)),
                            ),
                          ),

                          // Homepage Middle----->>>>Near You---->>>>Slider
                          Container(
                            width: screenWidth,
                            height: screenWidth * 0.736,
                            margin: EdgeInsets.only(left: screenWidth * 0.04),
                            child: CarouselSlider(
                              items: [
                                for (int i = 0; i < nearYouImages.length; i++)
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                margin: const EdgeInsets.only(
                                                    left: 12),
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
                                                margin: const EdgeInsets.only(
                                                    left: 8),
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
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        Text(
                                                          "₹1999",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontFamily:
                                                                  "Urbanist",
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
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
                                                        ))
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
                                EdgeInsets.only(left: screenWidth * 0.1, top: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff4776E6),
                            ),
                          )
                        ],
                      ),
                    ),
                  ):SizedBox(),

                  // ---->>>>Music Gigs

                  !isSearchBar?AnimatedScale(
                  duration: Duration(milliseconds: 500),
                    scale: isSearchBar?0:1.0,
                    child: Container(
                      width: screenWidth,
                      height: screenWidth * 0.93,
                      margin: const EdgeInsets.only(top: 24),
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
                                  "Music Gigs!",
                                  style: TextStyle(
                                      fontFamily: "Urbanist",
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth * .75,
                            height: 1,
                            margin:
                                EdgeInsets.only(left: screenWidth * 0.04, top: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff4776E6),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: screenWidth * 0.04, top: 8),
                            child: const Text(
                              "29 Upcoming events in Delhi NCR",
                              style: TextStyle(
                                  fontFamily: "Urbanist",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff686868)),
                            ),
                          ),

                          // Homepage Middle----->>>>Near You---->>>>Slider
                          Container(
                            width: screenWidth,
                            height: screenWidth * 0.736,
                            margin: EdgeInsets.only(left: screenWidth * 0.04),
                            child: CarouselSlider(
                              items: [
                                for (int i = 0; i < nearYouImages.length; i++)
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                margin: const EdgeInsets.only(
                                                    left: 12),
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
                                                margin: const EdgeInsets.only(
                                                    left: 8),
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
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        Text(
                                                          "₹1999",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontFamily:
                                                                  "Urbanist",
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
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
                                                        ))
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
                                    musicIndex = index;
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
                            width: musicIndex > 0
                                ? screenWidth * 0.4 * musicIndex.toDouble()
                                : screenWidth * 0.25,
                            height: 4,
                            margin:
                                EdgeInsets.only(left: screenWidth * 0.1, top: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff4776E6),
                            ),
                          )
                        ],
                      ),
                    ),
                  ):SizedBox(),

                  // ---->>>>Techno Trends

                  !isSearchBar?AnimatedScale(
                    duration: Duration(milliseconds: 500),
                    scale: isSearchBar?0:1.0,
                    child: Container(
                      width: screenWidth,
                      height: screenWidth * 0.93,
                      margin: const EdgeInsets.only(top: 15),
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
                                  "Techno Trends",
                                  style: TextStyle(
                                      fontFamily: "Urbanist",
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth * .75,
                            height: 1,
                            margin:
                                EdgeInsets.only(left: screenWidth * 0.04, top: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff4776E6),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: screenWidth * 0.04, top: 8),
                            child: const Text(
                              "29 Upcoming events in Delhi NCR",
                              style: TextStyle(
                                  fontFamily: "Urbanist",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff686868)),
                            ),
                          ),

                          // Homepage Middle----->>>>Near You---->>>>Slider
                          Container(
                            width: screenWidth,
                            height: screenWidth * 0.736,
                            margin: EdgeInsets.only(left: screenWidth * 0.04),
                            child: CarouselSlider(
                              items: [
                                for (int i = 0; i < nearYouImages.length; i++)
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                margin: const EdgeInsets.only(
                                                    left: 12),
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
                                                margin: const EdgeInsets.only(
                                                    left: 8),
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
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        Text(
                                                          "₹1999",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontFamily:
                                                                  "Urbanist",
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
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
                                                        ))
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
                                    trendIndex = index;
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
                            width: trendIndex > 0
                                ? screenWidth * 0.4 * trendIndex.toDouble()
                                : screenWidth * 0.25,
                            height: 4,
                            margin:
                                EdgeInsets.only(left: screenWidth * 0.1, top: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff4776E6),
                            ),
                          )
                        ],
                      ),
                    ),
                  ):SizedBox(),
                ],
              )
            ],
          );
        }));
  }
}
