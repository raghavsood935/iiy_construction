import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iiy_construction/in_payments.dart';
import 'package:flutter_iiy_construction/photos_page.dart';

import 'attendance_page.dart';
import 'out_payments.dart';

class Payments extends StatefulWidget {
  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  Widget itemText({text}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121252),
        toolbarHeight: 0.0,
      ),
      backgroundColor: Color(0xfff0f2f9),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: Container(
          height: 100,
          width: 500,
          decoration: BoxDecoration(
          color: Color(0xfff0f2f9),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Icon(Icons.people),
                     SizedBox(width: 10,),
                     Text("Only you and admin can see these payments")
                  ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    SizedBox(
                      width: 160,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => INPayments()),
                            );
                          },
                          child: Text("+ IN",style: TextStyle(fontSize: 16),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xff107760)),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    SizedBox(
                      width: 160,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OUTPayments()),
                          );
                        },
                        child: Text("- OUT",style: TextStyle(fontSize: 16),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xffd30c52)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.topCenter,
                color: Color(0xff121252),
                height: 110,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.black, width: 0.8)),
                                child: Text(
                                  "DP",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Demo Project",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.bell,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10,),
                            Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 38,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Icon(
                            Icons.people,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(child: itemText(text: "PAYMENT"),onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Payments()),
                            );
                          },),
                          GestureDetector(child: itemText(text: "ATTENDANCE"),onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AttendancePage()),
                            );
                          },),
                          itemText(text: "MATERIAL"),
                          itemText(text: "TASK"),
                          GestureDetector(child: itemText(text: "PHOTO"),onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PhotoPage()),
                            );
                          },),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey.shade400
                      ),
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Balance",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xff121252),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "+ 1,05,158",
                              style: TextStyle(
                                color: Color(0xff121252),

                                fontSize: 15,

                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Total IN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xff107760),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "₹ 1,20,000",
                              style: TextStyle(
                                color: Color(0xff107760),

                                fontSize: 15,

                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Total OUT",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xffd30c52),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "₹ 1,20,000",
                              style: TextStyle(
                                color: Color(0xffd30c52),

                                fontSize: 15,

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Container(
                  width: 500,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 10,),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xfff7eacb),
                          child: Center(
                            child: Text("0",style: TextStyle(color: Color(0xff121252)),),
                          ),
                      ),
                      SizedBox(width: 10,),
                      Text("Pending For Review",style: TextStyle(color: Color(0xff121252)),),
                      SizedBox(width: 150,),
                      Icon(Icons.keyboard_arrow_down_sharp)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Container(
                  height: 20,
                  width: 500,
                  color: Color(0xfff0f3f8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.sort,size: 16,),
                      SizedBox(width: 20,),
                      Text("Filter my Entries",style: TextStyle(color: Color(0xff121252),fontSize: 13),),
                      SizedBox(width: 100,),
                      Text("IN",style: TextStyle(color: Color(0xff121252),fontSize: 13),),
                      SizedBox(width: 70,),
                      Text("OUT",style: TextStyle(color: Color(0xff121252),fontSize: 13),),
                    ],
                  ),
                ),
              ),
              Padding(
                    padding: EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                  width: 500,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("9 Mar, from Sample User 1",
                            style: TextStyle(fontSize: 12,color: Colors.grey.shade700),
                            ),
                            SizedBox(height: 5,),
                            Text("1st  Running Payment",
                              style: TextStyle(fontSize: 14,color: Color(0xff121252),fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 5,),
                      Icon(Icons.lock,size: 15,),
                      SizedBox(width: 7,),
                      Container(
                        height: double.infinity,
                        width: 90,
                        color: Color(0xffeffff6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Customer",style: TextStyle(fontSize: 12,color: Color(0xff117a6e),),),
                            Text("₹ 20,000",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xff117a6e),),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Container(
                  width: 500,
                  height: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("7 Mar, to Sample User 2",
                              style: TextStyle(fontSize: 12,color: Colors.grey.shade700),
                            ),
                            SizedBox(height: 5,),
                            Text("Food For Site",
                              style: TextStyle(fontSize: 14,color: Color(0xff121252),fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 7,),
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage("images/demo.jpg"),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Icon(Icons.lock,size: 15,),
                      SizedBox(width: 7,),
                      Container(
                        height: double.infinity,
                        width: 90,
                        color: Color(0xffeffff6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ],
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: 75,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Food And\n   Travel",style: TextStyle(fontSize: 12,color: Color(0xffbf1952),),),
                            SizedBox(height: 5,),
                            Text("₹ 404",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xffbf1952),),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Container(
                  width: 500,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("6 Mar, to Sample User 1",
                              style: TextStyle(fontSize: 12,color: Colors.grey.shade700),
                            ),
                            SizedBox(height: 5,),
                            Text("Paid to rohit worker",
                              style: TextStyle(fontSize: 14,color: Color(0xff121252),fontWeight: FontWeight.bold),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Icon(Icons.lock,size: 15,),
                      SizedBox(width: 7,),
                      Container(
                        height: double.infinity,
                        width: 90,
                        color: Color(0xffeffff6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          ],
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: 75,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Labour",style: TextStyle(fontSize: 12,color: Color(0xffbf1952),),),
                            SizedBox(height: 5,),
                            Text("₹ 1550",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xffbf1952),),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Container(
                  width: 500,
                  height: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("5 Mar, to Sample User 2",
                              style: TextStyle(fontSize: 12,color: Colors.grey.shade700),
                            ),
                            SizedBox(height: 5,),
                            Text("20 bags of cement",
                              style: TextStyle(fontSize: 14,color: Color(0xff121252),fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 7,),
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage("images/2.png"),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 18,),
                      Icon(Icons.lock,size: 15,),
                      SizedBox(width: 7,),
                      Container(
                        height: double.infinity,
                        width: 90,
                        color: Color(0xffeffff6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          ],
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: 75,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Material",style: TextStyle(fontSize: 12,color: Color(0xffbf1952),),),
                            SizedBox(height: 5,),
                            Text("₹ 2400",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xffbf1952),),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Container(
                  width: 500,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("4 Mar, from Sample User 2",
                              style: TextStyle(fontSize: 12,color: Colors.grey.shade700),
                            ),
                            SizedBox(height: 5,),
                            Text("Advance Received",
                              style: TextStyle(fontSize: 14,color: Color(0xff121252),fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 3,),
                      Icon(Icons.lock,size: 15,),
                      SizedBox(width: 7,),
                      Container(
                        height: double.infinity,
                        width: 90,
                        color: Color(0xffeffff6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Customer",style: TextStyle(fontSize: 12,color: Color(0xff117a6e),),),
                            Text("₹ 1,00,000",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xff117a6e),),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Container(
                  width: 500,
                  height: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("4 Mar, to Sample User 1",
                              style: TextStyle(fontSize: 12,color: Colors.grey.shade700),
                            ),
                            SizedBox(height: 5,),
                            Text("Plywood Payment",
                              style: TextStyle(fontSize: 14,color: Color(0xff121252),fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 7,),
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage("images/2.png"),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 22,),
                      Icon(Icons.lock,size: 15,),
                      SizedBox(width: 7,),
                      Container(
                        height: double.infinity,
                        width: 90,
                        color: Color(0xffeffff6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          ],
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: 75,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Material",style: TextStyle(fontSize: 12,color: Color(0xffbf1952),),),
                            SizedBox(height: 5,),
                            Text("₹ 10,488",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xffbf1952),),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
             ],
                ),
              ),

          ),
    );
  }
}
