import 'package:easy_commerce/data/models/wears.dart';
import 'package:easy_commerce/presentation/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Wears product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final _imageHeight = MediaQuery.sizeOf(context).height * 0.40;
    return Scaffold(
      appBar: CustomAppBar(inApp: true, title: 'Easy Commerce'),
      body: Hero(
        tag: "${product.id}",
        child: Stack(
          children: [
            SizedBox(
              height: _imageHeight,
              width: MediaQuery.sizeOf(context).width,
              child: Image.network(product.imageUrl, fit: BoxFit.fill),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54, //New
                          blurRadius: 10.0,
                          offset: Offset(0, -10))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height -
                    (_imageHeight + (_imageHeight * 0.15)),
                child: OverflowBox(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "${product.price} EGP",
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 26,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10),
                        child: Text(
                          product.description,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Text(
                        "Available Colors",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height:
                        MediaQuery.sizeOf(context).height * 0.05,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: product.colors.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onLongPress: () {

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 11,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor:
                                    Color(int.parse('0xff${product.colors[index]}')),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Text(
                        "Available Sizes",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height:
                        MediaQuery.sizeOf(context).height * 0.05,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: product.colors.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onLongPress: () {

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 13,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      "${product.sizes[index]}",
                                      style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          "Add To Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
        backgroundColor: Colors.black,
      ),
    );
  }
}
