import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/imagepicker_cubit.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.2,
        child: BlocConsumer<ImagepickerCubit, ImagepickerState>(
          builder: (context, state) {
            if (state is Imagepickerloaded) {
              return GestureDetector(
                  onTap: () {
                    BlocProvider.of<ImagepickerCubit>(context).pickImage();
                  },
                  child: Card(
                    elevation: 6,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      child: Image.file(state.imageFile, fit: BoxFit.fill),
                    ),
                  ));
            } else {
              return GestureDetector(
                  onTap: () {
                    BlocProvider.of<ImagepickerCubit>(context).pickImage();
                  },
                  child: Card(
                      elevation: 6,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Image.asset("assets/images/pick_image.png",
                          fit: BoxFit.cover)));
            }
          },
          listener: (context, state) {
            if (state is Imagepickerloaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Loaded Successfully")));
            }
          },
        ),
      ),
    );
  }
}
