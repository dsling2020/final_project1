// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:final_project1/main.dart';
import 'third.dart';

class Second extends StatefulWidget {
  const Second(
      {Key? key,
        required this.name_item,
        required this.pic,
        required this.SmallPrize,
        required this.MediumPrize,
        required this.LargePrize})
      : super(key: key);
  //getting picture from previous screen and name of burger

  final String name_item;

  final Image pic;

  final SmallPrize;
  final MediumPrize;
  final LargePrize;
  @override
  State<Second> createState() => _SecondState();
}

List<bool> _selection = List.generate(3, (index) => false);

double num = 0;
double prize = 0;
Color color = Colors.white;
Color color1 = Colors.white;
Color color2 = Colors.white;
Color color3 = Colors.white;
const text = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20, color: Colors.deepOrange);

int count = 0;
int index = 0;

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const Text(
          'Ordered item',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: ClipOval(child: widget.pic),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: color1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _selection[index] = !_selection[index];
                    if (index == 0 && _selection[index]) {
                      color1 = Colors.deepOrange;
                      color2 = color;
                      color3 = color;
                      prize = SmallPrize!;
                    } else if (index == 0 && !_selection[index]) {
                      color1 = color;
                      num = 0;
                      count = 0;
                    }
                  });
                },
                child: const Text('small'),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _selection[index] = !_selection[index];
                    if (index == 0 && _selection[index]) {
                      // Do something
                      color2 = Colors.deepOrange;
                      prize = MediumPrize!;
                      color1 = color;
                      color3 = color;
                    } else if (index == 0 && !_selection[index]) {
                      // Do something
                      color2 = color;
                      num = 0;
                      count = 0;
                    }
                  });
                },
                child: const Text('medium'),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: color3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _selection[index] = !_selection[index];
                    if (index == 0 && _selection[index]) {
                      // Do something
                      color1 = color;
                      color2 = color;
                      color3 = Colors.deepOrange;
                      prize = LargePrize!;
                    } else if (index == 0 && !_selection[index]) {
                      // Do something
                      color3 = color;
                      num = 0;
                      count = 0;
                    }
                  });
                },
                child: const Text('large'),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                foregroundColor: Colors.black,
                backgroundColor: Colors.deepOrange,
                radius: 20,
                child: IconButton(
                  splashColor: Colors.white,
                  splashRadius: 20,
                  onPressed: () {
                    setState(() {
                      if (prize > 0) {
                        if (count > 0) {
                          count--;
                          if (num > 5) {
                            num -= prize;
                          } else {
                            num = 0;
                          }
                        }
                      }
                    });
                  },
                  icon: const Icon(Icons.exposure_minus_1, size: 15),
                ),
              ),
              const SizedBox(width: 40),
              Text(
                count.toString(),
                style: text,
              ),
              const SizedBox(width: 40),
              CircleAvatar(
                foregroundColor: Colors.black,
                backgroundColor: Colors.deepOrange,
                radius: 20,
                child: IconButton(
                  splashColor: Colors.white,
                  splashRadius: 20,
                  onPressed: () {
                    setState(() {
                      if (prize > 0) {
                        if (count >= 0) {
                          count++;
                          num += prize;
                        }
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.plus_one,
                    size: 15,
                  ),
                ),
              )
            ],
          ),
          Text(
            'price: ${num.toStringAsFixed(2)}',
            style: text,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Third(
                    price: num,
                    item: count,
                    name_item: widget.name_item,
                    pic10: widget.pic,
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
                  'Add to cart',
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