// import 'package:easy_commerce/data/models/clothes.dart';
// import 'package:easy_commerce/data/models/product.dart';
// import 'package:easy_commerce/logic/bloc/products/product_bloc.dart';
// import 'package:easy_commerce/presentation/widgets/alertDialogWidget.dart';
// import 'package:easy_commerce/presentation/widgets/customAppBar.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
//
// class AdminAddProductDetailsScreen extends StatefulWidget {
//   const AdminAddProductDetailsScreen({super.key});
//
//   @override
//   State<AdminAddProductDetailsScreen> createState() =>
//       _AdminAddProductDetailsScreenState();
// }
//
// class _AdminAddProductDetailsScreenState
//     extends State<AdminAddProductDetailsScreen> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     Product prod = BlocProvider
//         .of<ProductBloc>(context)
//         .prod;
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Easy Commerce', inApp: true),
//       body: SizedBox(
//         height: MediaQuery
//             .sizeOf(context)
//             .height,
//         child: Card(
//           color: Colors.white,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Expanded(
//                     child: MaterialButton(
//                         onPressed: () {
//                           setState(() {
//                             clothes = true;
//                           });
//                         },
//                         color: clothes ? Colors.black : Colors.white,
//                         child: Text(
//                           "Clothes",
//                           style: TextStyle(
//                               color: clothes ? Colors.white : Colors.black,
//                               fontWeight: FontWeight.bold),
//                         )),
//                   ),
//                   Expanded(
//                     child: MaterialButton(
//                         onPressed: () {
//                           setState(() {
//                             clothes = false;
//                           });
//                         },
//                         color: clothes ? Colors.white : Colors.black,
//                         child: Text(
//                           "Shoes",
//                           style: TextStyle(
//                               color: clothes ? Colors.black : Colors.white,
//                               fontWeight: FontWeight.bold),
//                         )),
//                   ),
//                 ],
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 30, left: 5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Colors",
//                       style:
//                       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                     ),
//                     MaterialButton(
//                       onPressed: () {
//                         pickColor();
//                       },
//                       color: Colors.black,
//                       child: const Text(
//                         "Add Color",
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(
//                       width: MediaQuery
//                           .sizeOf(context)
//                           .width,
//                       height: MediaQuery
//                           .sizeOf(context)
//                           .height * 0.05,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: productColors.length,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onLongPress: () {
//                               removeColor(productColors[index]);
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: CircleAvatar(
//                                 backgroundColor: Colors.black,
//                                 radius: 11,
//                                 child: CircleAvatar(
//                                   radius: 10,
//                                   backgroundColor: productColors[index],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery
//                           .sizeOf(context)
//                           .height * 0.01,
//                     ),
//                     const Text(
//                       "Sizes",
//                       style:
//                       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                     ),
//                     clothes
//                         ? SizedBox(
//                       width: MediaQuery
//                           .sizeOf(context)
//                           .width,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.vertical,
//                         itemCount: definedSizes.length,
//                         itemBuilder: (context, index) {
//                           return CheckboxListTile(
//                             value: definedSizes[index].value,
//                             onChanged: (value) {
//                               setState(() {
//                                 definedSizes[index].value = value!;
//                                 if (value == true) {
//                                   choosenSizes
//                                       .add(definedSizes[index].title);
//                                   if (kDebugMode) {
//                                     print(choosenSizes.length);
//                                   }
//                                 } else {
//                                   choosenSizes
//                                       .remove(definedSizes[index].title);
//                                   if (kDebugMode) {
//                                     print(choosenSizes.length);
//                                   }
//                                 }
//                               });
//                             },
//                             activeColor: Colors.black,
//                             title: Text(
//                               definedSizes[index].title,
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           );
//                         },
//                       ),
//                     )
//                         : Container(
//                       margin: const EdgeInsets.only(left: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           const Text(
//                             "From",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16),
//                           ),
//                           DropdownButton(
//                               elevation: 20,
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                               value: shoeSizeFrom,
//                               items: shoeSizes
//                                   .map((e) =>
//                                   DropdownMenuItem(
//                                     child: Text("${e}"),
//                                     value: e,
//                                   ))
//                                   .toList(),
//                               onChanged: (value) {
//                                 setState(() {
//                                   shoeSizeFrom = value!;
//                                 });
//                               }),
//                           const Text(
//                             "To",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16),
//                           ),
//                           DropdownButton(
//                               elevation: 20,
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                               value: shoeSizeTo,
//                               items: shoeSizes
//                                   .map((e) =>
//                                   DropdownMenuItem(
//                                     child: Text("${e}"),
//                                     value: e,
//                                   ))
//                                   .toList(),
//                               onChanged: (value) {
//                                 setState(() {
//                                   shoeSizeTo = value!;
//                                 });
//                               }),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery
//                           .sizeOf(context)
//                           .height * 0.01,
//                     ),
//                     const Text(
//                       "Gender",
//                       style:
//                       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 10),
//                       child: DropdownButton(
//                           elevation: 20,
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold, color: Colors.black),
//                           value: selectedGender,
//                           items: const [
//                             DropdownMenuItem(
//                                 value: 'Male', child: Text("Male")),
//                             DropdownMenuItem(
//                               value: 'Female',
//                               child: Text("Female"),
//                             )
//                           ],
//                           onChanged: (value) {
//                             setState(() {
//                               selectedGender = value!;
//                             });
//                           }),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           if (clothes) {
//             if (choosenSizes.isNotEmpty && productColors.isNotEmpty) {
//               Clothes clothes = Clothes(description: prod.description,
//                   name: prod.name,
//                   imageUrl: prod.imageUrl,
//                   price: prod.price,
//                   quantity: prod.quantity,
//                   sizes: choosenSizes,
//                   colors: productColors.,
//                   gender: selectedGender);
//               BlocProvider.of<ProductBloc>(context).addProduct(clothes);
//             } else {
//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     title: const Text(
//                       "Please Complete Product Info",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     actions: <Widget>[
//                       ElevatedButton(
//                         style: ButtonStyle(
//                             backgroundColor:
//                             MaterialStateProperty.all(Colors.red)),
//                         child: const Text('OK'),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               );
//             }
//           }
//           if (!clothes) {
//             if (shoeSizes.isNotEmpty && productColors.isNotEmpty) {} else {
//               alertDialogWidget(
//                   title: 'Not Completed',
//                   content: "Please Complete Product Info",
//                   context: context);
//             }
//           }
//         },
//         label: const Text(
//           "Add Product",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
//
//   removeColor(Color color) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text(
//             "Remove Color",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           actions: <Widget>[
//             ElevatedButton(
//               child: const Text('Yes'),
//               onPressed: () {
//                 setState(() => productColors.remove(color));
//                 Navigator.of(context).pop();
//               },
//             ),
//             ElevatedButton(
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.red)),
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   pickColor() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Pick Color"),
//           content: SingleChildScrollView(
//             child: ColorPicker(
//               pickerColor: pickedColor,
//               onColorChanged: (Color value) {
//                 setState(() {
//                   pickedColor = value;
//                 });
//               },
//             ),
//           ),
//           actions: <Widget>[
//             ElevatedButton(
//               child: const Text('Got it'),
//               onPressed: () {
//                 setState(() => productColors.add(pickedColor));
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
//
