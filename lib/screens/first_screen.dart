import 'package:flutter/material.dart';
import 'package:mobiledevintern2023_1/screens/second_screen.dart';
import 'package:mobiledevintern2023_1/styles.dart';

import '../widget/popup.dart';

class first_screen extends StatefulWidget {
  const first_screen({Key? key}) : super(key: key);

  @override
  State<first_screen> createState() => _first_screenState();
}

class _first_screenState extends State<first_screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController palindromeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover),
          ),
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.3),
                  child: Icon(
                    Icons.person_add_alt_rounded,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        maxLines: 1,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            hintText: 'Name',
                            hintStyle: Styles.inputTextHintDefaultTextStyle,
                            filled: true,
                            fillColor: Styles.bgcolor),
                        style: Styles.inputTextDefaultTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: palindromeController,
                        maxLines: 1,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            hintText: 'Palindrome',
                            hintStyle: Styles.inputTextHintDefaultTextStyle,
                            filled: true,
                            fillColor: Styles.bgcolor),
                        style: Styles.inputTextDefaultTextStyle,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: ElevatedButton(
                        child: Text(
                          'CHECK',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Styles.buttonDefaultBackgroundColor,
                            minimumSize: const Size.fromHeight(50),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () {
                          if ((isPalindrome(palindromeController.text)) ==
                              true) {
                            Popup.alertDialog(context, message: "isPalindrome",
                                dialogCallback: (value) async {
                              if (value == 'OK') {
                                Navigator.of(context).pop();
                              }
                            });
                          }
                          if ((isPalindrome(palindromeController.text)) ==
                              false) {
                            Popup.alertDialog(context,
                                message: "Not Palindrome",
                                dialogCallback: (value) async {
                              if (value == 'OK') {
                                Navigator.of(context).pop();
                              }
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: ElevatedButton(
                        child: Text(
                          'NEXT',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Styles.buttonDefaultBackgroundColor,
                            minimumSize: const Size.fromHeight(50),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => second_screen(
                                    name: nameController.text,
                                  )));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  bool isPalindrome(String text) {
    String cleanText = text.toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '');
    return cleanText == cleanText.split('').reversed.join();
  }
}
