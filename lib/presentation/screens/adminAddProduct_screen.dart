import 'package:easy_commerce/data/models/product.dart';
import 'package:easy_commerce/logic/bloc/products/product_bloc.dart';
import 'package:easy_commerce/presentation/widgets/customAppBar.dart';
import 'package:easy_commerce/presentation/widgets/customImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/imagepicker_cubit.dart';

class AdminAddProductScreen extends StatefulWidget {
  const AdminAddProductScreen({super.key});

  @override
  State<AdminAddProductScreen> createState() => _AdminAddProductScreenState();
}

class _AdminAddProductScreenState extends State<AdminAddProductScreen> {
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productDescription = TextEditingController();
  final TextEditingController _productQuantity = TextEditingController();

  final GlobalKey<FormState> _addproductformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Easy Commerce', inApp: true),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _addproductformKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset('assets/images/cart_icon.png',
                      height: MediaQuery.of(context).size.height * 0.15),
                ),
                Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Product Name';
                        }
                        return null;
                      },
                      controller: _productName,
                      decoration:
                          const InputDecoration(labelText: 'Product Name'),
                    ),
                    const SizedBox(height: 12.0),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Product Description';
                    }
                    return null;
                  },
                  controller: _productDescription,
                  decoration:
                      const InputDecoration(labelText: 'Product Description'),
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Product Price';
                    }
                    return null;
                  },
                  controller: _productPrice,
                  decoration: const InputDecoration(
                    labelText: 'Product Price',
                  ),

                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Product Quantity';
                    }
                    return null;
                  },
                  controller: _productQuantity,
                  decoration: const InputDecoration(
                    labelText: 'Product Quantity',
                  ),

                ),
                const SizedBox(height: 20.0),
                CustomImagePicker(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if(_addproductformKey.currentState!.validate()){
            createProduct();
          }

        },
        label: const Text(
          "Add Product",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  Future<void> createProduct() async {
    String imageUrl =
        await BlocProvider.of<ImagepickerCubit>(context).getImageUrl();
    Product product = Product(
        description: _productDescription.text,
        name: _productName.text,
        imageUrl: imageUrl,
        price: double.parse(_productPrice.text),
        quantity: int.parse(_productQuantity.text));
    BlocProvider.of<ProductBloc>(context)
        .add(AddProductEvent(product: product));
  }
}
