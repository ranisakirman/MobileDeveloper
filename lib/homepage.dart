import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoonlinerani/allproduct.dart';
import 'package:tokoonlinerani/productitems.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 18,
            color: Colors.white,
          ),
          
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Home Page",
          style: TextStyle(),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                CupertinoIcons.search,
                size: 18,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                CupertinoIcons.shopping_cart,
                size: 18,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.menu_rounded,
                size: 18,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 1000,
              child: Image.asset(
                'lib/assets/shop bar.png'
                ),
            )
          ],
        ),
      ),

      Container(
        padding: EdgeInsets.all(10),
        child: Text(
          "PRDOUCT CATEGORY", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
        ),
      ),

      Container(
        
        height: 100,
        child: Padding(padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
        
        
        child: Row(
          
          children: [
            Card(
              color: Colors.blue.shade100,
              child: Padding(padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
              child: Column(
                children: [Image.asset(
                  'lib/assets/Cap.png',
                  scale: 30,
                ),
                ],
              ),
              ),
            ),
            Card(
              color: Colors.blue.shade100,
              child: Padding(padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
              child: Column(
                children: [Image.asset(
                  'lib/assets/celanapanjang.png',
                  scale: 22,
                ),
                ],
              ),
              ),
            ),
            Card(
              color: Colors.blue.shade100,
              child: Padding(padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
              child: Column(
                children: [Image.asset(
                  'lib/assets/kemeja.png',
                  scale: 10,
                ),
                ],
              ),
              ),
            ),
            Card(
              color: Colors.blue.shade100,
              child: Padding(padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
              child: Column(
                children: [Image.asset(
                  'lib/assets/dress.png',
                  scale: 20,
                ),
                ],
              ),
              ),
            ),
            Card(
              color: Colors.blue.shade100,
              child: Padding(padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
              child: Column(
                children: [Image.asset(
                  'lib/assets/sepatu.png',
                  scale: 5,
                ),
                ],
              ),
              ),
            ),

          ],
        ),
        ),
      ),
      Padding(padding: const EdgeInsets.all(5),
        child: Text(
          'Category Pick', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
        ),
      ),
      SizedBox(
        height: 270,
        child: Padding(padding: const EdgeInsets.fromLTRB(16, 20, 0, 20),
        child: Row(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AllProduct())),


              child: Card(
                color: Colors.blue.shade100,
                child: Padding(padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    
                    Image.asset(
                      'lib/assets/allproduct.png',
                  scale: 14,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text('ALL PRODUK', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12, color: Colors.black),
                    )
                  ],
                ),
                
                ),
              ),
            ),

            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ProductItems())),


              child: Card(
                color: Colors.blue.shade100,
                child: Padding(padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/productdetail.png',
                  scale: 14,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('PRODUK DETIL', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12, color: Colors.black),
                    )
                  ],
                ),
                
                ),
              ),
            ),
            
          ],
        ),
        ),
      )
        ]
          )
        ,
        
      



    );
  }
}