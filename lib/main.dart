import 'dart:core';
import 'package:flutter/material.dart';
import 'package:final_project1/second.dart';

void main() {
  runApp(const App());
}

const text =
TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black);
//for passing image to second screen

Image pic1 = Image.asset('images/burger.jpg');
Image pic2 = Image.asset('images/chicken.jpg');
Image pic3 = Image.asset('images/fries.jpg');

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
    );
  }
}

// ignore: non_constant_identifier_names
double? SmallPrize, MediumPrize, LargePrize;

// ignore: constant_identifier_names
enum OS { Burger, Chicken_Sandwich, French_Fries }

List<String> list = ['Burger', 'Chicken Sandwich', 'French Fries'];

OS? _os;
String? name;
Image pic = Image.asset('images/burger.jpg');
double? sb, mb, lb, ss, ms, ls, sf, mf, lf;
bool button = true;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

String b = 'burger';
String c = 'Chicken Sandwich';
String f = 'French fries';

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const Text(
          'Menu',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 100, width: 100, child: ClipOval(child: pic2)),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      child: RadioListTile<OS>(
                        dense: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: Colors.black, width: 3)),
                        contentPadding: const EdgeInsets.all(0),
                        tileColor: Colors.deepOrange,
                        title: Text(
                          list.elementAt(1),
                          style: text,
                        ),
                        value: OS.Chicken_Sandwich,
                        groupValue: _os,
                        onChanged: (val) {
                          setState(() {
                            SmallPrize = 5.00;
                            MediumPrize = 7.00;
                            LargePrize = 9.00;
                            name = list.elementAt(1);
                            pic = pic2;
                            _os = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 100, width: 100, child: ClipOval(child: pic1)),
                  const SizedBox(width: 20),
                  Expanded(
                    child: RadioListTile<OS>(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:
                          const BorderSide(color: Colors.black, width: 3)),
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        list.first,
                        style: text,
                      ),
                      value: OS.Burger,
                      groupValue: _os,
                      tileColor: Colors.deepOrange,
                      onChanged: (val) {
                        setState(() {
                          SmallPrize = 5.00;
                          MediumPrize = 7.00;
                          LargePrize = 9.00;
                          name = list.first;
                          pic = pic1;
                          _os = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 100, width: 100, child: ClipOval(child: pic3)),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      width: 400,
                      child: RadioListTile<OS>(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: Colors.black, width: 3)),
                        contentPadding: const EdgeInsets.all(0),
                        tileColor: Colors.deepOrange,
                        title: Text(
                          list.last,
                          style: text,
                        ),
                        value: OS.French_Fries,
                        groupValue: _os,
                        onChanged: (val) {
                          setState(() {
                            SmallPrize = 2.50;
                            MediumPrize = 3.50;
                            LargePrize = 5.00;
                            name = list.last;
                            pic = pic3;
                            _os = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Second(
                    name_item: name.toString(),
                    pic: pic,
                    SmallPrize: SmallPrize,
                    MediumPrize: MediumPrize,
                    LargePrize: LargePrize,
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.deepOrange,
              child: const Center(
                child: Text(
                  'Proceed',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
