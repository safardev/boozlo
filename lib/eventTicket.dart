import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class EventTicket extends StatefulWidget {
  final eventDatas;
  final excluisveIndex;
  EventTicket(this.eventDatas, this.excluisveIndex, {super.key});

  @override
  State<StatefulWidget> createState() =>
      _EventTicket(this.eventDatas, this.excluisveIndex);
}

class _EventTicket extends State<EventTicket> {
  final eData;
  final eIndex;
  _EventTicket(this.eData, this.eIndex);

  bool introductionDropDown = true;
  bool termsConditions = true;
  bool freeTickets = false;
  bool regularTickets = false;
  bool vipTickets = false;

  int imageSliderIndex = 0;
  int freeItem = 1;
  int vipItem = 1;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(body: StatefulBuilder(
      builder: (context, internalState) {
        return ListView(
          children: [
            Container(
              width: screenWidth,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff041D21), Color(0xff041D21)])),
              child: Column(
                children: [
                  // ---------->>>>>Card Events
                  SizedBox(
                    width: screenWidth,
                    height: screenWidth * 1.518,
                    child: Column(
                      children: [
                        Stack(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: screenWidth * 0.853,
                              child: CarouselSlider(
                                items: [
                                  for (int i = 0;
                                      i <
                                          eData[eIndex]['fields']['Image']
                                              .length;
                                      i++)
                                    Image.network(
                                      eData[eIndex]['fields']['Image'][i]
                                          ['url'],
                                      fit: BoxFit.fill,
                                      color: Colors.white.withOpacity(0.8),
                                      colorBlendMode: BlendMode.modulate,
                                    )
                                ],
                                options: CarouselOptions(
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        imageSliderIndex = index;
                                      });
                                    },
                                    initialPage: 0,
                                    enableInfiniteScroll: false,
                                    padEnds: false,
                                    disableCenter: true,
                                    viewportFraction: 1),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0;
                                    i < eData[eIndex]['fields']['Image'].length;
                                    i++)
                                  AnimatedContainer(
                                    margin: EdgeInsets.only(
                                        right: 4, top: screenWidth * 0.786),
                                    duration: const Duration(milliseconds: 400),
                                    width: imageSliderIndex == i ? 15 : 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: imageSliderIndex == i
                                          ? const Color(0xff4776E6)
                                          : Colors.white,
                                    ),
                                  )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: screenWidth * 0.064,
                                  top: screenWidth * 0.16),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EventTicket(eData, eIndex)));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 7),
                                      width: 20,
                                      height: 20,
                                      child: Image.asset(
                                        "assets/images/arrow-circle-left.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Happening Near You",
                                    style: TextStyle(
                                        fontFamily: "Urbanist",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: screenWidth * 0.914,
                          height: screenWidth * 0.257,
                          margin: const EdgeInsets.only(top: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (eData[eIndex]['fields']['Heading']),textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Urbanist",
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${eData[eIndex]['fields']['Date']} \u2022 ${eData[eIndex]['fields']['Location']}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Urbanist",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth,
                          height: 2,
                          margin: const EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                            const Color(0xff4776E6).withOpacity(0.1),
                            const Color(0xff8E54E9).withOpacity(0.1)
                          ])),
                        ),
                        SizedBox(
                          width: screenWidth,
                          height: screenWidth * 0.192,
                          child: UnconstrainedBox(
                            child: SizedBox(
                              width: screenWidth * 0.944,
                              height: screenWidth * 0.133,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.131,
                                    height: screenWidth * 0.133,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.06,
                                          height: screenWidth * 0.06,
                                          child: Icon(
                                            Icons.language,
                                            size: screenWidth * 0.06,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Text(
                                          "Web",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Urbanist",
                                              fontSize: 9,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.131,
                                    height: screenWidth * 0.133,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.06,
                                          height: screenWidth * 0.06,
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: screenWidth * 0.06,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Text(
                                          "Save",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Urbanist",
                                              fontSize: 9,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.131,
                                    height: screenWidth * 0.133,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.06,
                                          height: screenWidth * 0.06,
                                          child: Icon(
                                            Icons.place_outlined,
                                            size: screenWidth * 0.06,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Text(
                                          "Map",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Urbanist",
                                              fontSize: 9,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.131,
                                    height: screenWidth * 0.133,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.06,
                                          height: screenWidth * 0.06,
                                          child: Icon(
                                            Icons.photo_camera,
                                            size: screenWidth * 0.06,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Text(
                                          "Photos",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Urbanist",
                                              fontSize: 9,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.131,
                                    height: screenWidth * 0.133,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.06,
                                          height: screenWidth * 0.06,
                                          child: Icon(
                                            Icons.alternate_email_outlined,
                                            size: screenWidth * 0.06,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Text(
                                          "Socials",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Urbanist",
                                              fontSize: 9,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth,
                          height: 2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color(0xff4776E6).withOpacity(0.1),
                              const Color(0xff8E54E9).withOpacity(0.1)
                            ]),
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.914,
                          height: screenWidth * 0.152,
                          margin: const EdgeInsets.only(top: 8),
                          child: UnconstrainedBox(
                            child: Container(
                              width: screenWidth * 0.693,
                              height: screenWidth * 0.13,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    const Color(0xff4776E6).withOpacity(0.6),
                                    const Color(0xff8E54E9).withOpacity(0.6)
                                  ]),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    "₹${eData[eIndex]['fields']['Starting Price']}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Urbanist",
                                        fontSize: 12,
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

                  // ------>>>>>>DropDown Description
                  Container(
                    width: screenWidth * 0.93,
                    height: 1,
                    margin: const EdgeInsets.only(top: 8),
                    color: const Color(0xff3F3F3F),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: screenWidth,
                    child: UnconstrainedBox(
                      child: SizedBox(
                        width: screenWidth * 0.933,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Introduction",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Urbanist",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                InkWell(
                                  onTap: () {
                                    internalState(() {
                                      introductionDropDown =
                                          !introductionDropDown;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 900),
                                    margin: const EdgeInsets.only(right: 10),
                                    width: screenWidth * 0.08,
                                    height: screenWidth * 0.08,
                                    child: Icon(
                                      introductionDropDown
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_right,
                                      size: screenWidth * 0.08,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            introductionDropDown
                                ? AnimatedContainer(
                                    margin: const EdgeInsets.only(top: 10),
                                    duration: const Duration(milliseconds: 300),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${eData[eIndex]['fields']['Short Description']}\n"
                                          "${eData[eIndex]['fields']['Long Description']}",
                                          style: const TextStyle(
                                            color: Color(0xffB0B0B0),
                                            fontFamily: "Urbanist",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ))
                                : const SizedBox(
                                    width: 0,
                                    height: 0,
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ------>>>>>>Tickets and Inclusions
                  SizedBox(
                    width: screenWidth * 0.949,
                    height: screenWidth * 0.992,
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth * 0.93,
                          height: 1,
                          margin: const EdgeInsets.only(top: 8),
                          color: const Color(0xff3F3F3F),
                        ),
                        Container(
                          height: screenWidth * 0.053,
                          margin: EdgeInsets.only(top: screenWidth * 0.042),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(left: screenWidth * 0.064),
                                child: const Text(
                                  "Tickets & Inclusions",
                                  style: TextStyle(
                                      fontFamily: "Urbanist",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(right: screenWidth * 0.077),
                                width: screenWidth * 0.053,
                                height: screenWidth * 0.53,
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: screenWidth * 0.832,
                          margin: const EdgeInsets.only(top: 8.5),
                          child: Stack(
                            children: <Widget>[
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: 6,
                                height: freeTickets || vipTickets
                                    ? screenWidth * 0.3
                                    : screenWidth * 0.789,
                                margin: EdgeInsets.only(
                                    left: screenWidth * 0.045, top: 8),
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Color(0xff515151),
                                  Color(0xffFFFFFF),
                                  Color(0xff515151)
                                ])),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.only(
                                    left: screenWidth * 0.03,
                                    top: freeTickets ? screenWidth * 0.15 : 27),
                                width: screenWidth * 0.048,
                                height: screenWidth * 0.048,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: freeTickets || vipTickets
                                      ? const Color(0xffAF71FF)
                                      : Color(0xffE3CDFF),
                                ),
                                child: UnconstrainedBox(
                                  child: Container(
                                    width: screenWidth * 0.026,
                                    height: screenWidth * 0.026,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: const Color(0xff515151),
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                top: screenWidth * 0.021,
                                left: screenWidth * 0.09,
                                child: AnimatedScale(
                                  duration: const Duration(milliseconds: 0),
                                  scale: vipTickets ? 0 : 1.0,
                                  child: InkWell(
                                    onTap: () {
                                      internalState(() {
                                        freeTickets = !freeTickets;
                                      });
                                    },
                                    child: Container(
                                      width: screenWidth * 0.826,
                                      height: screenWidth * 0.178,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff111111),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: screenWidth * 0.23,
                                            height: screenWidth * 0.114,
                                            margin: const EdgeInsets.only(
                                                left: 20, right: 57),
                                            child: const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Free",
                                                  style: TextStyle(
                                                      fontFamily: "Urbanist",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Valid for ",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Urbanist",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 10,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "1 Person",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Urbanist",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.264,
                                            height: screenWidth * 0.090,
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "|",
                                                  style: TextStyle(
                                                      fontFamily: "Urbanist",
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "₹0",
                                                  style: TextStyle(
                                                      fontFamily: "Urbanist",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 28,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                top: screenWidth * 0.232,
                                left: screenWidth * 0.09,
                                child: AnimatedScale(
                                  duration: const Duration(milliseconds: 00),
                                  scale: freeTickets ||
                                          regularTickets ||
                                          vipTickets
                                      ? 0
                                      : 1.0,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: screenWidth * 0.826,
                                      height: screenWidth * 0.178,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff111111),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: screenWidth * 0.23,
                                            height: screenWidth * 0.114,
                                            margin: const EdgeInsets.only(
                                                left: 20, right: 57),
                                            child: const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Regular",
                                                  style: TextStyle(
                                                      fontFamily: "Urbanist",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Valid for ",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Urbanist",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 10,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "1 Person",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Urbanist",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.264,
                                            height: screenWidth * 0.090,
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "|",
                                                  style: TextStyle(
                                                      fontFamily: "Urbanist",
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "₹599",
                                                  style: TextStyle(
                                                      fontFamily: "Urbanist",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 28,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                top: screenWidth * 0.442,
                                left: screenWidth * 0.09,
                                child: AnimatedScale(
                                  duration: const Duration(milliseconds: 0),
                                  scale: freeTickets || vipTickets ? 0 : 1.0,
                                  child: InkWell(
                                    onTap: () {
                                      internalState(() {
                                        vipTickets = !vipTickets;
                                      });
                                    },
                                    child: Container(
                                      width: screenWidth * 0.826,
                                      height: screenWidth * 0.178,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff111111),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: screenWidth * 0.23,
                                            height: screenWidth * 0.114,
                                            margin: const EdgeInsets.only(
                                                left: 20, right: 57),
                                            child: const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "VIP",
                                                  style: TextStyle(
                                                      fontFamily: "Urbanist",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Valid for ",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Urbanist",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 10,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "4 Person",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Urbanist",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.264,
                                            height: screenWidth * 0.090,
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "|",
                                                  style: TextStyle(
                                                      fontFamily: "Urbanist",
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "₹2999",
                                                  style: TextStyle(
                                                      fontFamily: "Urbanist",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 28,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Tickets & Inclusions ------>>>>Free

                              // Tickets & Inclusions ------>>>>Hookers
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                left: screenWidth * 0.090,
                                child: freeTickets
                                    ? InkWell(
                                        onTap: () {
                                          internalState(() {
                                            freeTickets = !freeTickets;
                                          });
                                        },
                                        child: Container(
                                          width: screenWidth * 0.826,
                                          height: screenWidth * 0.373,
                                          child: Stack(
                                            children: <Widget>[
                                              AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: screenWidth * 0.149,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        const Color(0xff0A0A0A)
                                                            .withOpacity(0.5),
                                                  ),
                                                ),
                                              ),
                                              AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                top: screenWidth * 0.021,
                                                child: Container(
                                                  width: screenWidth * 0.826,
                                                  height: screenWidth * 0.149,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        const Color(0xff0A0A0A)
                                                            .withOpacity(0.5),
                                                  ),
                                                ),
                                              ),
                                              AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                top: screenWidth * 0.042,
                                                child: Container(
                                                  width: screenWidth * 0.826,
                                                  height: screenWidth * 0.33,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      gradient:
                                                          const LinearGradient(
                                                              stops: [
                                                            0.3,
                                                            1.0
                                                          ],
                                                              colors: [
                                                            Color(0xff132E6C),
                                                            Color(0xff380A80)
                                                          ])),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: screenWidth *
                                                                0.032,
                                                            top: screenWidth *
                                                                0.032),
                                                        child: const Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Free",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      "Urbanist",
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            Text(
                                                              "Valid for 1 Person | Zero Cancellation",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      "Urbanist",
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            SizedBox(
                                                              width: 140,
                                                              height: 50,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Note:",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            "Urbanist",
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    " \u2022 Your booking is valid for 15 mins from the time of your reservation.",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            "Urbanist",
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    " \u2022 Make sure you show your booking to the venue manager",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            "Urbanist",
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 91,
                                                        height: 34,
                                                        margin: EdgeInsets.only(
                                                            left: screenWidth *
                                                                0.146),
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              "|",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Urbanist",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              "₹0",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Urbanist",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 28,
                                                                  color: Colors
                                                                      .white),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),

                              // Tickets & Inclusions ------>>>>QuantitySelector
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                top: screenWidth * 0.42,
                                left: screenWidth * 0.234,
                                child: freeTickets
                                    ? SizedBox(
                                        width: screenWidth * 0.49,
                                        height: screenWidth * 0.112,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                internalState(() {
                                                  if (freeItem > 1) {
                                                    freeItem = freeItem ~/ 2;
                                                  }
                                                });
                                              },
                                              child: Container(
                                                width: screenWidth * 0.112,
                                                height: screenWidth * 0.112,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            screenWidth *
                                                                0.112),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffF5F5F5),
                                                        width: 3.0)),
                                                child: Icon(
                                                  Icons.remove,
                                                  size: screenWidth * 0.1,
                                                  color:
                                                      const Color(0xffF5F5F5),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: screenWidth * 0.16,
                                              height: screenWidth * 0.106,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 3.0)),
                                              child: Text(
                                                freeItem.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Urbanist',
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                internalState(() {
                                                  freeItem += freeItem;
                                                });
                                              },
                                              child: Container(
                                                width: screenWidth * 0.112,
                                                height: screenWidth * 0.112,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            screenWidth *
                                                                0.112),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffF5F5F5),
                                                        width: 3.0)),
                                                child: Icon(
                                                  Icons.add,
                                                  size: screenWidth * 0.1,
                                                  color:
                                                      const Color(0xffF5F5F5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : const SizedBox(),
                              ),

                              // Tickets & Inclusions ------>>>>PayButton
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                child: freeTickets
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            top: screenWidth * 0.56,
                                            left: screenWidth * 0.026),
                                        width: screenWidth * 0.9,
                                        height: screenWidth * 0.17,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border: Border.all(
                                              color: Colors.white,
                                            )),
                                        child: SwipeableButtonView(
                                          activeColor: const Color(0xff0A0A0A)
                                              .withOpacity(0),
                                          buttonText: 'Pay ₹1999',
                                          buttonWidget: Container(
                                            width: screenWidth * 0.133,
                                            height: screenWidth * 0.133,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      screenWidth * 0.133),
                                              color: const Color(0xff5B5B5B),
                                            ),
                                            child: Image.asset(
                                                "assets/images/minecraft.png"),
                                          ),
                                          onFinish: () {},
                                          onWaitingProcess: () {},
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                              // Tickets & Inclusions ------>>>>Swipe
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                top: screenWidth * 0.75,
                                left: screenWidth * 0.30,
                                child: freeTickets
                                    ? const Text(
                                        "Swipe to confirm your booking.\nPay on next page.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Urbanist",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      )
                                    : Text(""),
                              ),

                              // Tickets & Inclusions ------>>>>Regular

                              // Tickets & Inclusions ------>>>>Hookers
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                left: screenWidth * 0.090,
                                child: regularTickets
                                    ? InkWell(
                                        onTap: () {
                                          internalState(() {
                                            regularTickets = !regularTickets;
                                          });
                                        },
                                        child: Container(
                                          width: screenWidth * 0.826,
                                          height: screenWidth * 0.373,
                                          child: Stack(
                                            children: <Widget>[
                                              AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: screenWidth * 0.149,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        const Color(0xff0A0A0A)
                                                            .withOpacity(0.5),
                                                  ),
                                                ),
                                              ),
                                              AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                top: screenWidth * 0.021,
                                                child: Container(
                                                  width: screenWidth * 0.826,
                                                  height: screenWidth * 0.149,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        const Color(0xff0A0A0A)
                                                            .withOpacity(0.5),
                                                  ),
                                                ),
                                              ),
                                              AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                top: screenWidth * 0.042,
                                                child: Container(
                                                  width: screenWidth * 0.826,
                                                  height: screenWidth * 0.33,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      gradient:
                                                          const LinearGradient(
                                                              stops: [
                                                            0.3,
                                                            1.0
                                                          ],
                                                              colors: [
                                                            Color(0xff132E6C),
                                                            Color(0xff380A80)
                                                          ])),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: screenWidth *
                                                                0.032,
                                                            top: screenWidth *
                                                                0.032),
                                                        child: const Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Free",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      "Urbanist",
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            Text(
                                                              "Valid for 1 Person | Zero Cancellation",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      "Urbanist",
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            SizedBox(
                                                              width: 140,
                                                              height: 50,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Note:",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            "Urbanist",
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    " \u2022 Your booking is valid for 15 mins from the time of your reservation.",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            "Urbanist",
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    " \u2022 Make sure you show your booking to the venue manager",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            "Urbanist",
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 91,
                                                        height: 34,
                                                        margin: EdgeInsets.only(
                                                            left: screenWidth *
                                                                0.146),
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              "|",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Urbanist",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              "₹0",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Urbanist",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 28,
                                                                  color: Colors
                                                                      .white),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),

                              // Tickets & Inclusions ------>>>>QuantitySelector
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                top: screenWidth * 0.42,
                                left: screenWidth * 0.234,
                                child: regularTickets
                                    ? SizedBox(
                                        width: screenWidth * 0.49,
                                        height: screenWidth * 0.112,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                internalState(() {
                                                  if (freeItem > 1) {
                                                    freeItem = freeItem ~/ 2;
                                                  }
                                                });
                                              },
                                              child: Container(
                                                width: screenWidth * 0.112,
                                                height: screenWidth * 0.112,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            screenWidth *
                                                                0.112),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffF5F5F5),
                                                        width: 3.0)),
                                                child: Icon(
                                                  Icons.remove,
                                                  size: screenWidth * 0.1,
                                                  color:
                                                      const Color(0xffF5F5F5),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: screenWidth * 0.16,
                                              height: screenWidth * 0.106,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 3.0)),
                                              child: Text(
                                                freeItem.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Urbanist',
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                internalState(() {
                                                  freeItem += freeItem;
                                                });
                                              },
                                              child: Container(
                                                width: screenWidth * 0.112,
                                                height: screenWidth * 0.112,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            screenWidth *
                                                                0.112),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffF5F5F5),
                                                        width: 3.0)),
                                                child: Icon(
                                                  Icons.add,
                                                  size: screenWidth * 0.1,
                                                  color:
                                                      const Color(0xffF5F5F5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                              ),

                              // Tickets & Inclusions ------>>>>PayButton
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                child: regularTickets
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            top: screenWidth * 0.56,
                                            left: screenWidth * 0.026),
                                        width: screenWidth * 0.9,
                                        height: screenWidth * 0.17,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border: Border.all(
                                              color: Colors.white,
                                            )),
                                        child: SwipeableButtonView(
                                          activeColor: const Color(0xff0A0A0A)
                                              .withOpacity(0),
                                          buttonText: 'Pay ₹1999',
                                          buttonWidget: Container(
                                            width: screenWidth * 0.133,
                                            height: screenWidth * 0.133,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      screenWidth * 0.133),
                                              color: const Color(0xff5B5B5B),
                                            ),
                                            child: Image.asset(
                                                "assets/images/minecraft.png"),
                                          ),
                                          onFinish: () {},
                                          onWaitingProcess: () {},
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                              // Tickets & Inclusions ------>>>>Swipe
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                top: screenWidth * 0.75,
                                left: screenWidth * 0.30,
                                child: regularTickets
                                    ? const Text(
                                        "Swipe to confirm your booking.\nPay on next page.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Urbanist",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      )
                                    : Text(""),
                              ),

                              // Tickets & Inclusions ------>>>>VIP

                              // Tickets & Inclusions ------>>>>Hookers
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                left: screenWidth * 0.090,
                                child: vipTickets
                                    ? InkWell(
                                        onTap: () {
                                          internalState(() {
                                            vipTickets = !vipTickets;
                                          });
                                        },
                                        child: Container(
                                          width: screenWidth * 0.826,
                                          height: screenWidth * 0.373,
                                          child: Stack(
                                            children: <Widget>[
                                              AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: screenWidth * 0.149,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        const Color(0xff0A0A0A)
                                                            .withOpacity(0.5),
                                                  ),
                                                ),
                                              ),
                                              AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                top: screenWidth * 0.021,
                                                child: Container(
                                                  width: screenWidth * 0.826,
                                                  height: screenWidth * 0.149,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        const Color(0xff0A0A0A)
                                                            .withOpacity(0.5),
                                                  ),
                                                ),
                                              ),
                                              AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                top: screenWidth * 0.042,
                                                child: Container(
                                                  width: screenWidth * 0.826,
                                                  height: screenWidth * 0.33,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      gradient:
                                                          const LinearGradient(
                                                              stops: [
                                                            0.3,
                                                            1.0
                                                          ],
                                                              colors: [
                                                            Color(0xff132E6C),
                                                            Color(0xff380A80)
                                                          ])),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: screenWidth *
                                                                0.032,
                                                            top: screenWidth *
                                                                0.032),
                                                        child: const Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "VIP",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      "Urbanist",
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            Text(
                                                              "Valid for 4 Person | Zero Cancellation",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      "Urbanist",
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            SizedBox(
                                                              width: 140,
                                                              height: 50,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Includes",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            "Urbanist",
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    " \u2022 4 Welcome Drinks",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            "Urbanist",
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    " \u2022 4 Snacks of your choice",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            "Urbanist",
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 91,
                                                        height: 34,
                                                        margin: EdgeInsets.only(
                                                            left: screenWidth *
                                                                0.146),
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              "|",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Urbanist",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              "₹2999",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Urbanist",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 28,
                                                                  color: Colors
                                                                      .white),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),

                              // Tickets & Inclusions ------>>>>QuantitySelector
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                top: screenWidth * 0.42,
                                left: screenWidth * 0.234,
                                child: vipTickets
                                    ? SizedBox(
                                        width: screenWidth * 0.49,
                                        height: screenWidth * 0.112,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                internalState(() {
                                                  if (vipItem > 1) {
                                                    vipItem = vipItem ~/ 2;
                                                  }
                                                });
                                              },
                                              child: Container(
                                                width: screenWidth * 0.112,
                                                height: screenWidth * 0.112,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            screenWidth *
                                                                0.112),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffF5F5F5),
                                                        width: 3.0)),
                                                child: Icon(
                                                  Icons.remove,
                                                  size: screenWidth * 0.1,
                                                  color:
                                                      const Color(0xffF5F5F5),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: screenWidth * 0.16,
                                              height: screenWidth * 0.106,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 3.0)),
                                              child: Text(
                                                vipItem.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Urbanist',
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                internalState(() {
                                                  vipItem += vipItem;
                                                });
                                              },
                                              child: Container(
                                                width: screenWidth * 0.112,
                                                height: screenWidth * 0.112,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            screenWidth *
                                                                0.112),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffF5F5F5),
                                                        width: 3.0)),
                                                child: Icon(
                                                  Icons.add,
                                                  size: screenWidth * 0.1,
                                                  color:
                                                      const Color(0xffF5F5F5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                              ),

                              // Tickets & Inclusions ------>>>>PayButton
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                child: vipTickets
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            top: screenWidth * 0.56,
                                            left: screenWidth * 0.026),
                                        width: screenWidth * 0.9,
                                        height: screenWidth * 0.17,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border: Border.all(
                                              color: Colors.white,
                                            )),
                                        child: SwipeableButtonView(
                                          activeColor: const Color(0xff0A0A0A)
                                              .withOpacity(0),
                                          buttonText: 'Pay ₹1999',
                                          buttonWidget: Container(
                                            width: screenWidth * 0.133,
                                            height: screenWidth * 0.133,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      screenWidth * 0.133),
                                              color: const Color(0xff5B5B5B),
                                            ),
                                            child: Image.asset(
                                                "assets/images/minecraft.png"),
                                          ),
                                          onFinish: () {},
                                          onWaitingProcess: () {},
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                              // Tickets & Inclusions ------>>>>Swipe
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                top: screenWidth * 0.75,
                                left: screenWidth * 0.30,
                                child: vipTickets
                                    ? const Text(
                                        "Swipe to confirm your booking.\nPay on next page.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Urbanist",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      )
                                    : Text(""),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  // ------>>>>>>Terms and Conditions
                  SizedBox(
                    width: screenWidth,
                    height: screenWidth * 0.624,
                    child: UnconstrainedBox(
                      child: Container(
                        width: screenWidth * 0.97,
                        height: screenWidth * 0.586,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: screenWidth * 0.046),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Terms & Conditions",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Urbanist",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 900),
                                      margin: EdgeInsets.only(
                                          right: screenWidth * 0.046),
                                      width: screenWidth * 0.053,
                                      height: screenWidth * 0.053,
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: screenWidth * 0.053,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            AnimatedContainer(
                              margin: EdgeInsets.only(
                                  top: 8.5, left: screenWidth * 0.046),
                              duration: const Duration(milliseconds: 300),
                              width: screenWidth * 0.853,
                              height: screenWidth * 0.506,
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "1. The ticket is a revocable license to enter the event and is subject to the terms and conditions of the festival.",
                                    style: TextStyle(
                                      color: Color(0xffB0B0B0),
                                      fontFamily: "Urbanist",
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "2. The ticket holder agrees to comply with all rules and regulations of the festival.",
                                    style: TextStyle(
                                      color: Color(0xffB0B0B0),
                                      fontFamily: "Urbanist",
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "3. The ticket holder voluntarily assumes all risk and danger incidental to the event, whether occurring before, during, or after the event.",
                                    style: TextStyle(
                                      color: Color(0xffB0B0B0),
                                      fontFamily: "Urbanist",
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "4. The event promoter reserves the right to refuse admission or eject any person whose conduct is deemed to be disorderly or who fails to comply with the terms and conditions of the event.",
                                    style: TextStyle(
                                      color: Color(0xffB0B0B0),
                                      fontFamily: "Urbanist",
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "5. The event promoter is not responsible for lost or stolen items, and attendees are advised not to bring valuable items to the festival.",
                                    style: TextStyle(
                                      color: Color(0xffB0B0B0),
                                      fontFamily: "Urbanist",
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "6. The event promoter may use any photos or videos taken at the event for promotional purposes.",
                                    style: TextStyle(
                                      color: Color(0xffB0B0B0),
                                      fontFamily: "Urbanist",
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "7. The event promoter reserves the right to change the lineup, schedule, or location of the event without prior notice.",
                                    style: TextStyle(
                                      color: Color(0xffB0B0B0),
                                      fontFamily: "Urbanist",
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "8. The ticket holder agrees to submit to a reasonable search for prohibited items upon entering the festival.",
                                    style: TextStyle(
                                      color: Color(0xffB0B0B0),
                                      fontFamily: "Urbanist",
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "9. The ticket holder may not bring outside food, drink, or illegal substances to the festival.",
                                    style: TextStyle(
                                      color: Color(0xffB0B0B0),
                                      fontFamily: "Urbanist",
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "10. The ticket holder may not resell or transfer their ticket without the express written consent of the event promoter.",
                                    style: TextStyle(
                                      color: Color(0xffB0B0B0),
                                      fontFamily: "Urbanist",
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
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
        );
      },
    ));
  }
}
