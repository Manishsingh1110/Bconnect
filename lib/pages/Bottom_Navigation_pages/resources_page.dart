import 'package:bconnect/components/rawmaterial_second.dart';
import 'package:bconnect/models/product.dart';
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class Resources extends StatefulWidget {
  const Resources({Key? key}) : super(key: key);

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  void initState() {
    super.initState();
    // Initialize the data fetching when the widget is initialized
    if (Provider.of<ByproductListModel>(context, listen: false)
        .byproducts
        .isEmpty) {
      Provider.of<ByproductListModel>(context, listen: false).initData();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the list of byproducts from the provider
    List<Byproduct> byproducts =
        Provider.of<ByproductListModel>(context).byproducts;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: _buildByproductsList(byproducts),
      ),
    );
  }

  Widget _buildByproductsList(List<Byproduct> byproducts) {
    if (byproducts.isEmpty) {
      return Container(
        color: Colors.black.withOpacity(0.1), // Adjust opacity for blur effect
        child: Center(
            child: Center(
                child: Lottie.asset(
          'assets/images/lottie3.json', // replace 'assets/loading_animation.json' with the path to your Lottie animation file
          width: 400,
          height: 300,
          fit: BoxFit.fill,
        ))),
      );
    } else {
      return RefreshIndicator(
          onRefresh: () async {
            // Call initData to fetch data when the user pulls to refresh
            await Provider.of<ByproductListModel>(context, listen: false)
                .initData();
          },
          child: RawMaterialsListSecond(byproducts: byproducts));
    }
  }
}
