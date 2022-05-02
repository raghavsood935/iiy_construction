import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OUTPayments extends StatefulWidget {

  @override
  State<OUTPayments> createState() => _OUTPaymentsState();
}

class _OUTPaymentsState extends State<OUTPayments> {
  String categorydropdownvalue = 'Item 1';
  String tradedropdownvalue = 'Item 1';
  var categoryItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var tradeItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final partyNameController = TextEditingController();
  String newdate ="";
  List<bool> isSelected=[true, false];
  @override
  void initState(){
    super.initState();
    getDate();
  }

  void getDate(){
    final now = DateTime.now();
    String formatter = now.toString();
    int idx = formatter.indexOf(" ");
    newdate= formatter.substring(0, idx).split('-').reversed.join("/");
  }

  getCalendarDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f2f9),
      appBar: AppBar(
        title: Text("PAID",
          style: TextStyle(
              color: Color(0xff121252),
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){},
          color: Color(0xff121252),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: amountController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: '₹  Enter Amount Given *',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff8889a8)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.grey.shade300, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xff121252), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: TextFormField(
                controller: descriptionController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Enter Description',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff8889a8)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.grey.shade300, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xff121252), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      getCalendarDate(context);
                    },
                    child: Container(
                      height: 50,
                      width: 155,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            CupertinoIcons.calendar_badge_plus,
                            size: 25,
                            color: Color(0xff121252),
                          ),
                          Text("$newdate",
                            style: TextStyle(
                                color: Color(0xff121252),
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35)
                    ),
                    child: ToggleButtons(
                      disabledColor: Colors.white,
                      borderColor: Colors.grey.shade300,
                      fillColor: Color(0xff121252),
                      borderWidth: 2,
                      selectedBorderColor: Colors.black,
                      selectedColor: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text(
                              ' Online ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '  Cash  ',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                          }
                        });
                      },
                      isSelected: isSelected,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: TextFormField(
                controller: partyNameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_to_photos_rounded,color: Color(0xff121252),),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Party Name',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff8889a8)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.grey.shade300, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xff121252), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: 50,
                      width: 155,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            CupertinoIcons.briefcase_fill,
                            size: 25,
                            color: Color(0xff121252),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Category",
                                  style: TextStyle(
                                      color: Color(0xff8889a8),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),),
                                Container(
                                  width: 80,height: 20,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: categorydropdownvalue,
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      items: categoryItems.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items,
                                            style: TextStyle(
                                                color: Color(0xff121252),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          categorydropdownvalue = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ]
                          ),
                          SizedBox(width: 3,)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 155,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          CupertinoIcons.bookmark_fill,
                          size: 25,
                          color: Color(0xff121252),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Trade",
                                style: TextStyle(
                                    color: Color(0xff8889a8),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),),
                              Container(
                                width: 80,height: 20,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: tradedropdownvalue,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: tradeItems.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items,
                                          style: TextStyle(
                                              color: Color(0xff121252),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        tradedropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ]
                        ),
                        SizedBox(width: 3,)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        width: 500,
        decoration: BoxDecoration(
          color: Color(0xfff0f2f9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("ATTACH BILL",
              style: TextStyle(
                  color: Color(0xff8889a8),
                  fontSize: 18
              ),
            ),
            SizedBox(height:30,),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt,color: Color(0xff121252),),
                      SizedBox(height: 10,),
                      Text("CAMERA",
                        style: TextStyle(
                          color: Color(0xff121252),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  VerticalDivider(
                    thickness: 2,
                    indent: 4,
                    endIndent: 12,
                    color: Color(0xff121252),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add_photo_alternate,color: Color(0xff121252),),
                      SizedBox(height: 10,),
                      Text("GALLERY",
                        style: TextStyle(
                          color: Color(0xff121252),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 180,
                    child: ElevatedButton(
                        onPressed: (){},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all(Color(0xffd30d53))
                        ),
                        child: Center(
                          child: Text(
                              "SAVE"
                          ),
                        )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
