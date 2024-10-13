import 'package:flutter/material.dart';
//import 'package:tokoonlinerani/itemsdata.dart';

import 'package:tokoonlinerani/items.dart';
import 'package:tokoonlinerani/productdetail.dart';

class ProductItems extends StatefulWidget {
  const ProductItems({super.key});

  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
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

        backgroundColor: Colors.green.shade400,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white, size: 24),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 24),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 24),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(15),
          child: Text(
            "Product List",
            style:TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 24, 
              color: Colors.green),
              textAlign: TextAlign.center,
          ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount 
              (crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: (1/1.9),
              ),
               itemCount: items.length,
               itemBuilder: (context,index){
                  return InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(
                        productIndex: index,
                      ),
                     ),
                     );
                    },
                    child: Material(
                      elevation: 20, 
                      borderRadius: BorderRadius.circular(20), 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(items[index][1],
                          scale: 0.2,
                          ),
                          Text(items[index][0],
                          style: const TextStyle(
                            color:Colors.black,
                            fontSize: 18, 
                            fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom:30),
                               child: Text(
                                  items[index][2],
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                  ),
                             ),

                        ],
                        ), 

                    ),
                  );
               },
               ),
               ),
                ],
        ),
    );
  }
}