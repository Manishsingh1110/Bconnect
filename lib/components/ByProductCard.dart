// ignore_for_file: avoid_unnecessary_containers, file_names, library_private_types_in_public_api

import 'package:bconnect/components/addproduct.dart';
import 'package:flutter/material.dart';

class ByProductCard extends StatelessWidget {
  final String byProductName;
  final String byProductDescription;
  final String byProductImage;
  final String byProductprofile;
  final double byProductPrice;
  final String byProductSupplier;
  final String byProducttime;

  const ByProductCard({
    Key? key,
    required this.byProductName,
    required this.byProducttime,
    required this.byProductDescription,
    required this.byProductImage,
    required this.byProductprofile,
    required this.byProductPrice,
    required this.byProductSupplier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Center(
              child: Image.network(
                byProductImage,
                width: double.infinity,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  byProductName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  byProductDescription,
                  style: const TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      'Price: \$${byProductPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      'Supplier: $byProductSupplier',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ByProductsList extends StatefulWidget {
  final List<Map<String, dynamic>> byProducts;
  final String groupid;
  const ByProductsList(
      {Key? key, required this.byProducts, required this.groupid})
      : super(key: key);

  @override
  _ByProductsListState createState() => _ByProductsListState();
}

class _ByProductsListState extends State<ByProductsList> {
  List<Map<String, dynamic>> filteredByProducts = [];

  @override
  void initState() {
    super.initState();
    // Initialize filteredByProducts with the original list
    filteredByProducts = List.from(widget.byProducts);
  }

  void _applyFilter(String filterOption) {
    // Implement your filter logic here based on the selected option
    // This is a placeholder, replace it with your actual filter logic
    setState(() {
      filteredByProducts = widget.byProducts
          .where((byProduct) => byProduct['filterOption'] == filterOption)
          .toList();
    });
  }

  void _applySort(String sortOption) {
    // Implement your sorting logic here based on the selected option
    // This is a placeholder, replace it with your actual sorting logic
    setState(() {
      filteredByProducts
          .sort((a, b) => a['sortOption'].compareTo(b['sortOption']));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Row(children: [
              // Filter Options
              Padding(
                padding: const EdgeInsets.all(16.0), // Add padding here
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.filter_list),
                  onSelected: _applyFilter,
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: 'filter1',
                      child: Text('Filter 1'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'filter2',
                      child: Text('Filter 2'),
                    ),
                    // Add more filter options as needed
                  ],
                ),
              ),

              // Sort Options
              Padding(
                padding: const EdgeInsets.all(16.0), // Add padding here
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.sort),
                  onSelected: _applySort,
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: 'sort1',
                      child: Text('Sort 1'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'sort2',
                      child: Text('Sort 2'),
                    ),
                    // Add more sort options as needed
                  ],
                ),
              ),
            ])),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddProduct(groupid: widget.groupid)));
              },
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredByProducts.length,
            itemBuilder: (context, index) {
              final byProduct = filteredByProducts[index];
              return ByProductCard(
                byProductName: byProduct['name'] ?? '',
                byProductDescription: byProduct['description'] ?? '',
                byProductImage:
                    byProduct['image'] ?? 'assets/images/default_image.jpg',
                byProductPrice: byProduct['price'] ?? 0.0,
                byProducttime: byProduct['timeAgo'] ?? "0.0",
                byProductSupplier: byProduct['supplier'] ?? 'Supplier Name',
                byProductprofile:
                    byProduct['userImage'] ?? 'assets/images/default_image.jpg',
              );
            },
          ),
        ),
      ],
    );
  }
}
