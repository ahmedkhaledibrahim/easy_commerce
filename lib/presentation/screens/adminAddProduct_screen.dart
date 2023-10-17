import 'package:easy_commerce/logic/bloc/wears/wears_bloc.dart';

import 'package:easy_commerce/presentation/widgets/customAppBar.dart';
import 'package:easy_commerce/presentation/widgets/customImagePicker.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../data/models/wears.dart';
import '../../logic/cubit/imagepicker_cubit.dart';
import '../widgets/alertDialogWidget.dart';

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

  List<Color> productColors = [];

  String selectedGender = 'Male';
  String selectedType = 'clothes';
  final List<CheckBoxState> definedSizes = [
    CheckBoxState(value: false, title: 'S'),
    CheckBoxState(value: false, title: 'M'),
    CheckBoxState(value: false, title: 'L'),
    CheckBoxState(value: false, title: 'XL'),
    CheckBoxState(value: false, title: 'Larger Sizes')
  ];
  List<String> choosenSizes = [];
  List<int> shoeSizes = [for (var i = 37; i <= 50; i++) i];
  int shoeSizeFrom = 37;
  int shoeSizeTo = 50;
  Color pickedColor = Colors.white;
  bool clothes = true;

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
                SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      clothes = true;
                                      selectedType = 'clothes';
                                    });
                                  },
                                  color: clothes ? Colors.black : Colors.white,
                                  child: Text(
                                    "Clothes",
                                    style: TextStyle(
                                        color: clothes
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            Expanded(
                              child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      clothes = false;
                                      selectedType = 'shoes';
                                    });
                                  },
                                  color: clothes ? Colors.white : Colors.black,
                                  child: Text(
                                    "Shoes",
                                    style: TextStyle(
                                        color: clothes
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30, left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Colors",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  pickColor();
                                },
                                color: Colors.black,
                                child: const Text(
                                  "Add Color",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productColors.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onLongPress: () {
                                        removeColor(
                                            productColors[index]);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 11,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundColor:
                                                productColors[index] as Color,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.01,
                              ),
                              const Text(
                                "Sizes",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              clothes
                                  ? SizedBox(
                                      width: MediaQuery.sizeOf(context).width,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: definedSizes.length,
                                        itemBuilder: (context, index) {
                                          return CheckboxListTile(
                                            value: definedSizes[index].value,
                                            onChanged: (value) {
                                              setState(() {
                                                definedSizes[index].value =
                                                    value!;
                                                if (value == true) {
                                                  choosenSizes.add(
                                                      definedSizes[index]
                                                          .title);
                                                  if (kDebugMode) {
                                                    print(choosenSizes.length);
                                                  }
                                                } else {
                                                  choosenSizes.remove(
                                                      definedSizes[index]
                                                          .title);
                                                  if (kDebugMode) {
                                                    print(choosenSizes.length);
                                                  }
                                                }
                                              });
                                            },
                                            activeColor: Colors.black,
                                            title: Text(
                                              definedSizes[index].title,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(
                                            "From",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          DropdownButton(
                                              elevation: 20,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              value: shoeSizeFrom,
                                              items: shoeSizes
                                                  .map((e) => DropdownMenuItem(
                                                        child: Text("${e}"),
                                                        value: e,
                                                      ))
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  shoeSizeFrom = value!;
                                                });
                                              }),
                                          const Text(
                                            "To",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          DropdownButton(
                                              elevation: 20,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              value: shoeSizeTo,
                                              items: shoeSizes
                                                  .map((e) => DropdownMenuItem(
                                                        child: Text("${e}"),
                                                        value: e,
                                                      ))
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  shoeSizeTo = value!;
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.01,
                              ),
                              const Text(
                                "Gender",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: DropdownButton(
                                    elevation: 20,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    value: selectedGender,
                                    items: const [
                                      DropdownMenuItem(
                                          value: 'Male', child: Text("Male")),
                                      DropdownMenuItem(
                                        value: 'Female',
                                        child: Text("Female"),
                                      )
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value!;
                                      });
                                    }),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_addproductformKey.currentState!.validate()) {
            createProduct();
          }
        },
        label: const Text(
          "Next",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  Future<void> createProduct() async {
    String imageUrl =
        await BlocProvider.of<ImagepickerCubit>(context).getImageUrl();
    if (imageUrl.isNotEmpty) {
      Wears product = Wears(
          description: _productDescription.text,
          name: _productName.text,
          imageUrl: imageUrl,
          price: double.parse(_productPrice.text),
          quantity: int.parse(_productQuantity.text),
          type: selectedType,
          colors: productColors.map((e) => e.value.toString()).toList(),
          sizes: choosenSizes,
          gender: selectedGender);
      if (choosenSizes.isNotEmpty && productColors.isNotEmpty) {
        BlocProvider.of<WearsBloc>(context).addProduct(product);
      } else {
        alertDialogWidget(
            title: "Can't Complete Process",
            content: "Please Complete Product Info",
            context: context);
      }

      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => AdminAddProductDetailsScreen(),
      // ));
    }
  }

  removeColor(Color color) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Remove Color",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () {
                setState(() => productColors.remove(color));
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  pickColor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pick Color"),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickedColor,
              onColorChanged: (Color value) {
                setState(() {
                  pickedColor = value;
                });
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() => productColors.add(pickedColor));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class CheckBoxState {
  String title;
  bool value;

  CheckBoxState({required this.value, required this.title});
}
