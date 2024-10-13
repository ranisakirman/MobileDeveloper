import 'package:flutter/material.dart';

import 'items.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, @required this.productIndex});
  final productIndex;

  @override
  State<ProductDetail> createState() => _ProductDetailState();

  static void removeWhere(bool Function(dynamic product) param0) {}
}

class _ProductDetailState extends State<ProductDetail> {
  Color buyColor = Colors.yellow.shade700;
  int buySize = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
          child: Text(items[widget.productIndex][0],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(height: 20),
          Center(
            child: Stack(
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: buyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(items[widget.productIndex][1], scale: 0.7),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            items[widget.productIndex][2],
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Deskripsi Produk",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              items[widget.productIndex][3],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Other Colors",
                  style: TextStyle(
                    color: Colors.blueGrey.shade200,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.yellow.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 15.5,
                        backgroundColor: Colors.yellow.shade700,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.green.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 15.5,
                        backgroundColor: Colors.green.shade700,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.red.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 15.5,
                        backgroundColor: Colors.red.shade700,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.purple.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 15.5,
                        backgroundColor: Colors.purple.shade700,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.black;
                        });
                      },
                      child: const CircleAvatar(
                        radius: 17.5,
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text(
                  "Size Options",
                  style: TextStyle(
                    color: Colors.blueGrey.shade200,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: DropdownButton(
                  value: buySize,
                  items: const [
                    DropdownMenuItem(
                      value: 5,
                      child: Text(
                        "S",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 10,
                      child: Text(
                        "M",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 15,
                      child: Text(
                        "L",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 20,
                      child: Text(
                        "Xl",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 25,
                      child: Text(
                        "XXL",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      buySize = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 30,
            width: 200,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(),
              ),
              child: const Text(
                "ADD TO CART",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
