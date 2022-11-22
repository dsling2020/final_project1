import 'package:flutter/material.dart';

double total = 0;

class Third extends StatefulWidget {
  const Third(
      {Key? key,
        required this.price,
        required this.item,
        // ignore: non_constant_identifier_names
        required this.name_item,
        required this.pic10})
      : super(key: key);
  final double price;
  final Image pic10;
  final int item;
  // ignore: non_constant_identifier_names
  final String name_item;
  @override
  State<Third> createState() => _ThirdState();
}

const text = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepOrange);

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const Text(
          'Payment',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.name_item, style: text),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 100, child: ClipOval(child: widget.pic10)),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  'Total price of ${widget.name_item} is  ${widget.price}',
                  style: text,
                ),
              ),
            ],
          ),
          Text('Item Total: ${widget.price}', style: text),
          const Text('Tax: 9.75%', style: text),
          Text(
              'Total: ${(((9.75) / 100 * widget.price) + widget.price).toStringAsFixed(2)}',
              style: text),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    elevation: 5,
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    actions: const [
                      Center(
                        child: Text(
                          'order has been submitted',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('Submit for payment',
                style: text.copyWith(fontSize: 20, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}