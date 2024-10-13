import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _name = TextEditingController();
  final _price = TextEditingController();
  final _description = TextEditingController();
  final _promo = TextEditingController();
  final _images = TextEditingController();

  void clearData() {
    _name.clear();
    _price.clear();
    _description.clear();
    _promo.clear();
    _images.clear();
  }

  Future<void> addProduct() async {
    String urlAddProduct =
        'https://ranisakirman.000webhostapp.com/deleteproduct.php';
    try {
      final responseAdd = await http.post(Uri.parse(urlAddProduct), body: {
        "name": _name.text.toString(),
        "price": _price.text.toString(),
        "description": _description.text.toString(),
        "promo": _promo.text.toString(),
        "images": _images.text.toString(),
      });

      var addNewProduct = json.decode(responseAdd.body);
      if (addNewProduct == "true") {
        print("New product successfully added");
      } else {
        print("Failed to add new product");
      }
    } catch (exc) {
      print("Error: $exc");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Add New Product",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.search, color: Colors.white, size: 18),
              SizedBox(width: 10),
              Icon(Icons.notifications, color: Colors.white, size: 18),
            ],
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: TextField(
                controller: _name,
                decoration: const InputDecoration(
                  labelText: "Product Name",
                  hintText: "Enter Product Name",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(CupertinoIcons.bag_fill, color: Colors.amber),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: TextField(
                controller: _price,
                decoration: const InputDecoration(
                  labelText: "Price",
                  hintText: "Enter Price",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(CupertinoIcons.money_dollar, color: Colors.amber),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: TextField(
                controller: _description,
                decoration: const InputDecoration(
                  labelText: "Description",
                  hintText: "Enter Product Description",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(CupertinoIcons.wrench_fill, color: Colors.amber),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: TextField(
                controller: _promo,
                decoration: const InputDecoration(
                  labelText: "Promo",
                  hintText: "Enter Product Promo",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(CupertinoIcons.pano_fill, color: Colors.amber),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 50),
              child: TextField(
                controller: _images,
                decoration: const InputDecoration(
                  labelText: "Images URL",
                  hintText: "Enter Product Images URL",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(CupertinoIcons.cube_box_fill, color: Colors.amber),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                addProduct();
                clearData();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(width: 2, style: BorderStyle.solid),
                  )),
              child: const Text(
                "Add Product",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}