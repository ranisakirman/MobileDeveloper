import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoonlinerani/addproduct.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  List productList = [];

  Future<void> deleteProduct(String id) async {
    String urlDeleteProduct = "https://ranisakirman.000webhostapp.com/deleteproduct.php";
    try {
      var responseDelete = await http.post(Uri.parse(urlDeleteProduct), body: {"id": id});
      var deleteDataProduct = jsonDecode(responseDelete.body);
      if (deleteDataProduct["success"] == "true") {
        print("Product successfully deleted");
        getAllProduct();  // Refresh the product list after deletion
      } else {
        print("Product deletion failed");
      }
    } catch (exc) {
      print(exc);
    }
  }

  Future<void> getAllProduct() async {
    String urlProduct = "https://ranisakirman.000webhostapp.com/getallproduct.php";
    try {
      var response = await http.get(Uri.parse(urlProduct));
      setState(() {
        productList = jsonDecode(response.body);
      });
    } catch (exc) {
      print(exc);
    }
  }

  @override
  void initState() {
    super.initState();
    getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Product List",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade400,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(CupertinoIcons.search, color: Colors.white, size: 18),
              SizedBox(width: 10),
              Icon(Icons.notifications, color: Colors.white, size: 18),
            ],
          )
        ],
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(5),
            child: ListTile(
              leading: ClipOval(
                child: Image.network(
                  '${productList[index]['images']}',
                  fit: BoxFit.fill,
                  width: 50,
                  height: 50,
                ),
              ),
              title: Text(
                productList[index]["nama"],
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      productList[index]["description"],
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 10,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Text(
                    "Rp ${productList[index]["price"]}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.upload_circle_fill, color: Colors.orange, size: 18),
                    onPressed: () {
                      // Handle product update
                    },
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.delete_solid, color: Colors.red, size: 18),
                    onPressed: () {
                      deleteProduct(productList[index]["id"]);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddProduct()));
        },
        mini: true,
        splashColor: Colors.green.shade300,
        backgroundColor: Colors.green.shade400,
        child: const Icon(CupertinoIcons.add_circled, color: Colors.black, size: 12),
      ),
    );
  }
}