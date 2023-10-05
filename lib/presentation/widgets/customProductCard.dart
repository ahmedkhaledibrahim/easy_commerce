import 'package:flutter/material.dart';

import '../../data/models/product.dart';

class CustomProductCard extends StatelessWidget {
  final Product product;

  const CustomProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 6, offset: Offset(0, 2))
                  ]),
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.03,vertical: MediaQuery.sizeOf(context).height * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.fill,
                      height: height / 1.5,
                      width: width,
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
