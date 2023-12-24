import 'package:flutter/material.dart';
import 'package:mobiledevintern2023_1/screens/third_screen.dart';
import 'package:mobiledevintern2023_1/styles.dart';

class second_screen extends StatefulWidget {
  const second_screen({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  State<second_screen> createState() => _second_screenState();
}

class _second_screenState extends State<second_screen> {
  String selected = "Selected User Name";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Second Screen",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            fontFamily: "Poppins",
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 26),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  selected,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    child: const Text(
                      'Choose a User',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Styles.buttonDefaultBackgroundColor,
                        minimumSize: const Size.fromHeight(50),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      _third_screen(context);
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Future<void> _third_screen(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => const third_screen()),
    );
    if (result != null) {
      setState(() {
        selected = result;
      });
    }
  }
}