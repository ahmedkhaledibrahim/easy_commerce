import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/wears.dart';
import '../../logic/bloc/wears/wears_bloc.dart';
import 'customProductCard.dart';

class CustomGridView extends StatelessWidget {
  final List<Wears> wears;
  CustomGridView({required this.wears});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<WearsBloc, WearsState>(
      builder: (context, state) => ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemCount:  BlocProvider.of<WearsBloc>(context).listOfMaleWears.length,
        itemBuilder: (context, index) {
          if (state is WearsLoaded && wears.isNotEmpty) {
            return ClipRect(
              child: Hero(
                tag: "${wears[index].id}",
                child: CustomProductCard(product: wears[index]),
              ),
            );
          } else if (state is WearsLoaded && wears.isEmpty) {
            return const Text("No Products");
          } else if (state is WearsLoading) {
            return const CircularProgressIndicator();
          } else if (state is WearsFailed) {
            return const Text("No Products");
          }
          return null;
        },
      ),
    );
  }
}
