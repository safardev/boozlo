import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class VenueCardDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_VenueCardDetails();

}

class _VenueCardDetails extends State<VenueCardDetails>{
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    
    return Scaffold(
      backgroundColor: const Color(0xff171717),
      body: StatefulBuilder(
        builder: (context,internalState){
          return ListView(
            children: [
              // Deatils and Known for
              Stack(
                children: <Widget>[
                  Container(
                    width: screenWidth,
                    height: screenWidth * 1.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.asset("assets/images/venue.png",
                      fit: BoxFit.fill,
                      opacity: const AlwaysStoppedAnimation(.5),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      VenueCardDetails()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left:screenWidth*0.053,top:screenWidth*0.08,right: 5),
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            "assets/images/arrow-circle-left.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:screenWidth*0.08),
                        child: const Text(
                          "Venues",
                          style: TextStyle(
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: screenWidth,
                    height: screenWidth*0.546,
                    margin: EdgeInsets.only(top: screenWidth*0.68),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       const Text("KiTTY SU",style: TextStyle(
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w700,
                              fontSize: 26,
                              color: Colors.white),),
                        SizedBox(
                          height: screenWidth*0.021,
                        ),
                        const Text("The Lalit Hotel, Barakhamba Road",style: TextStyle(
                            fontFamily: "Urbanist",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white),),
                        SizedBox(
                          width: screenWidth*0.248,
                          height: screenWidth*0.141,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              UnconstrainedBox(
                                child: Container(
                                  width: screenWidth*0.08,
                                  height: screenWidth*0.08,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff383838).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(screenWidth*0.08)
                                  ),
                                  child: Icon(
                                    Icons.call,
                                    size: screenWidth*0.032,
                                    color: const Color(0xffB074FF),
                                  ),
                                ),
                              ),
                              UnconstrainedBox(
                                child: Container(
                                  width: screenWidth*0.08,
                                  height: screenWidth*0.08,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff383838).withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(screenWidth*0.08)
                                  ),
                                  child: Icon(
                                    Icons.map,
                                    size: screenWidth*0.032,
                                    color: const Color(0xffB074FF),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        )

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenWidth*1.066,left: screenWidth*0.0533),
                    width: screenWidth*0.845,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Details",style: TextStyle(
                            fontFamily: "Urbanist",
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.white),),
                        Container(
                          width: screenWidth*0.84,
                          height: 1,
                          margin: EdgeInsets.only(top: screenWidth*0.0266,bottom: screenWidth*0.024),
                          color: Colors.white,
                        ),
                        const Text("Horem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.",
                          style: TextStyle(
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.white),),
                        Container(
                          width: screenWidth*0.84,
                          height: 1,
                          margin: EdgeInsets.only(top: screenWidth*0.032),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: screenWidth*0.0533,top: screenWidth*0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Known For",style: TextStyle(
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white),),
                    SizedBox(
                      height: screenWidth*0.026,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: screenWidth*0.026),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff4A4A4A),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: screenWidth*0.0133,horizontal: screenWidth*0.0533),
                            child: const Text("Parties",style: TextStyle(
                                fontFamily: "Urbanist",
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Colors.white),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: screenWidth*0.026),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff4A4A4A),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: screenWidth*0.0133,horizontal: screenWidth*0.0533),
                            child: const Text("EDM Night",style: TextStyle(
                                fontFamily: "Urbanist",
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Colors.white),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: screenWidth*0.026),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff4A4A4A),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: screenWidth*0.0133,horizontal: screenWidth*0.0533),
                            child: const Text("Beautiful Interior",style: TextStyle(
                                fontFamily: "Urbanist",
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Colors.white),),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: screenWidth*0.013,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: screenWidth*0.026),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff4A4A4A),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: screenWidth*0.0133,horizontal: screenWidth*0.0533),
                            child: const Text("Ambience",style: TextStyle(
                                fontFamily: "Urbanist",
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Colors.white),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: screenWidth*0.026),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff4A4A4A),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: screenWidth*0.0133,horizontal: screenWidth*0.0533),
                            child: const Text("Ambience",style: TextStyle(
                                fontFamily: "Urbanist",
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Colors.white),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: screenWidth*0.026),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff4A4A4A),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: screenWidth*0.0133,horizontal: screenWidth*0.0533),
                            child: const Text("Ambience",style: TextStyle(
                                fontFamily: "Urbanist",
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Colors.white),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // Deals and Exclusive Events
              Container(
                margin: EdgeInsets.only(top: screenWidth*0.106),
                width: screenWidth,
                height: screenWidth*1.62,
                child: Column(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenWidth*0.7,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: screenWidth*0.909,
                            height: screenWidth*0.154,
                            margin: EdgeInsets.only(left: screenWidth*0.064),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text("Deals",style: TextStyle(
                                    fontFamily: "Urbanist",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 28,
                                    color: Colors.white),),
                                Text("Select the deals you want. Club both deals for maximum savings.Order your food before reaching the venue and get started!",style: TextStyle(
                                    fontFamily: "Urbanist",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: Colors.white.withOpacity(0.5)
                                ),)
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth*0.64,
                            height: 1,
                            margin: EdgeInsets.only(top: screenWidth*0.197,left: screenWidth*0.064),
                            color: const Color(0xffF8F8F8),
                          ),
                          Container(
                            width: screenWidth,
                            height: screenWidth*0.48,
                            margin: EdgeInsets.only(top: screenWidth*0.24,left: screenWidth*0.064),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Drinks",style: TextStyle(
                                        fontFamily: "Urbanist",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white),),
                                    SizedBox(
                                      width: screenWidth*0.69,
                                      height: screenWidth*0.16,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          AnimatedContainer(
                                              duration: const Duration(milliseconds: 500),
                                            width: screenWidth*0.272,
                                            height: screenWidth*0.16,
                                            margin: EdgeInsets.only(right: screenWidth*0.042),
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage("assets/images/Coupon.png")
                                              )
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: screenWidth*0.117,
                                                  height: screenWidth*0.066,
                                                  child: Image.asset("assets/images/glasses.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const Text("2 Shots",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                                const Text("on Bills above ₹1000",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 6,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 500),
                                            width: screenWidth*0.272,
                                            height: screenWidth*0.16,
                                            margin: EdgeInsets.only(right: screenWidth*0.042),
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage("assets/images/Coupon.png")
                                                )
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: screenWidth*0.117,
                                                  height: screenWidth*0.066,
                                                  child: Image.asset("assets/images/glasses.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const Text("2 Shots",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                                const Text("on Bills above ₹1000",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 6,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 500),
                                            width: screenWidth*0.272,
                                            height: screenWidth*0.16,
                                            margin: EdgeInsets.only(right: screenWidth*0.042),
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage("assets/images/Coupon.png")
                                                )
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: screenWidth*0.117,
                                                  height: screenWidth*0.066,
                                                  child: Image.asset("assets/images/glasses.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const Text("2 Shots",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                                const Text("on Bills above ₹1000",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 6,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 500),
                                            width: screenWidth*0.272,
                                            height: screenWidth*0.16,
                                            margin: EdgeInsets.only(right: screenWidth*0.042),
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage("assets/images/Coupon.png")
                                                )
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: screenWidth*0.117,
                                                  height: screenWidth*0.066,
                                                  child: Image.asset("assets/images/glasses.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const Text("2 Shots",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                                const Text("on Bills above ₹1000",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 6,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("+",style: TextStyle(
                                        fontFamily: "Urbanist",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white),),
                                    Container(
                                      width: screenWidth*0.64,
                                      height: 1,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Food",style: TextStyle(
                                        fontFamily: "Urbanist",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white),),
                                    SizedBox(
                                      width: screenWidth*0.69,
                                      height: screenWidth*0.16,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 500),
                                            width: screenWidth*0.272,
                                            height: screenWidth*0.16,
                                            margin: EdgeInsets.only(right: screenWidth*0.042),
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage("assets/images/Coupon.png")
                                                )
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: screenWidth*0.117,
                                                  height: screenWidth*0.066,
                                                  child: Image.asset("assets/images/glasses.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const Text("2 Shots",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                                const Text("on Bills above ₹1000",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 6,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 500),
                                            width: screenWidth*0.272,
                                            height: screenWidth*0.16,
                                            margin: EdgeInsets.only(right: screenWidth*0.042),
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage("assets/images/Coupon.png")
                                                )
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: screenWidth*0.117,
                                                  height: screenWidth*0.066,
                                                  child: Image.asset("assets/images/glasses.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const Text("2 Shots",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                                const Text("on Bills above ₹1000",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 6,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 500),
                                            width: screenWidth*0.272,
                                            height: screenWidth*0.16,
                                            margin: EdgeInsets.only(right: screenWidth*0.042),
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage("assets/images/Coupon.png")
                                                )
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: screenWidth*0.117,
                                                  height: screenWidth*0.066,
                                                  child: Image.asset("assets/images/glasses.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const Text("2 Shots",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                                const Text("on Bills above ₹1000",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 6,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 500),
                                            width: screenWidth*0.272,
                                            height: screenWidth*0.16,
                                            margin: EdgeInsets.only(right: screenWidth*0.042),
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage("assets/images/Coupon.png")
                                                )
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: screenWidth*0.117,
                                                  height: screenWidth*0.066,
                                                  child: Image.asset("assets/images/glasses.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const Text("2 Shots",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                                const Text("on Bills above ₹1000",style: TextStyle(
                                                    fontFamily: "Urbanist",
                                                    fontSize: 6,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      height: screenWidth*0.861,
                      margin: EdgeInsets.only(top: screenWidth*0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth*0.834,
                            height: screenWidth*0.154,
                            margin: EdgeInsets.only(right: screenWidth*0.101,left: screenWidth*0.064),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Exclusive Events",style: TextStyle(
                                    fontFamily: "Urbanist",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 28,
                                    color: Colors.white),),
                                Text("Get rif of the line. Book with Boozlo and gain VIP Entry at these events. Show the pass at entry and enjoy your welcome drink, On The House!",style: TextStyle(
                                    fontFamily: "Urbanist",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: Colors.white.withOpacity(0.5)),)
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth*0.64,
                            height: 1,
                            margin: EdgeInsets.only(left: screenWidth*0.064),
                            color: const Color(0xffF8F8F8),
                          ),
                          Container(
                            width: screenWidth,
                            height: screenWidth*0.621,
                            margin: EdgeInsets.only(left: screenWidth*0.064,top: screenWidth*0.053),
                            child: CarouselSlider(
                              items: [
                                for(int i=0;i<4;i++)
                                  Container(
                                    width: screenWidth*0.704,
                                    height: screenWidth*0.6,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff073137),
                                          Color(0xff591458)
                                        ]
                                      )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width:double.infinity,
                                            height: screenWidth*0.248,
                                            margin: EdgeInsets.only(left: screenWidth*0.021,right: screenWidth*0.021,top: screenWidth*0.021),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.red
                                            ),
                                            child: Image.asset("assets/images/NH7.png",
                                            fit: BoxFit.fill,)
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: screenWidth*0.309,
                                          margin: EdgeInsets.only(left: screenWidth*0.021,right: screenWidth*0.021),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text("NH7 Weekender",style: TextStyle(
                                                  fontFamily: "Urbanist",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                  color: Colors.white),),
                                              const Text("Adsf \u2022 ssdc",style: TextStyle(
                                                  fontFamily: "Urbanist",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                  color: Colors.white),),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width: screenWidth*0.392,
                                                    height: screenWidth*0.13,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      gradient: const LinearGradient(
                                                        colors: [
                                                          Color(0xff4776E6),
                                                          Color(0xff8E54E9)
                                                        ]
                                                      )
                                                    ),
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
                                                        const Text(
                                                          "Book Now",
                                                          style: TextStyle(
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
                                                  const Column(
                                                    children: [
                                                      Text("Starts from",style: TextStyle(
                                                          fontFamily: "Urbanist",
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 12,
                                                          color: Colors.white),),
                                                      Text("1999",style: TextStyle(
                                                          fontFamily: "Urbanist",
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 16,
                                                          color: Colors.white),)
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),

                                        )
                                      ],
                                    ),
                                  )
                              ],
                              options: CarouselOptions(
                                initialPage: 0,
                                enableInfiniteScroll: false,
                                padEnds: false,
                                disableCenter: true,
                                viewportFraction:0.95
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // Buy Pass Button
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenWidth*0.322,bottom: 20),
                    width:screenWidth*0.882,
                    height: screenWidth*0.133,
                    child: SwipeableButtonView(
                      activeColor: const Color(0xff363636),
                      buttonText: "Swipe to Buy Pass",
                      buttontextstyle: const TextStyle(
                      color: Color(0xff8E54E9)
                      ),
                      buttonColor: const Color(0xff0D9488),
                      buttonWidget: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff0D9488),
                          borderRadius: BorderRadius.circular(screenWidth*0.133)
                        ),
                        child: SizedBox(
                          width: screenWidth*0.042,
                          height: screenWidth*0.042,
                          child: Image.asset("assets/images/Next_Button_Icon.png"),
                        ),
                      ),
                      onFinish: () {  },
                      onWaitingProcess: () {  },
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}