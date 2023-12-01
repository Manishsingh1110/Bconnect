// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:flutter/material.dart';

class RawMaterialCard extends StatelessWidget {
  final String rawMaterialName;
  final String rawMaterialDescription;
  final String rawMaterialImage;
  final double rawMaterialPrice;
  final String rawMaterialSupplier;

  const RawMaterialCard({
    Key? key,
    required this.rawMaterialName,
    required this.rawMaterialDescription,
    required this.rawMaterialImage,
    required this.rawMaterialPrice,
    required this.rawMaterialSupplier,
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
                rawMaterialImage,
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
                  rawMaterialName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  rawMaterialDescription,
                  style: const TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      'Price: \$${rawMaterialPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 16.0), // Adjust the spacing as needed
                    Text(
                      'Supplier: $rawMaterialSupplier',
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

class RawMaterialsList extends StatefulWidget {
  final List<Map<String, dynamic>> rawMaterials;

  const RawMaterialsList({Key? key, required this.rawMaterials})
      : super(key: key);

  @override
  _RawMaterialsListState createState() => _RawMaterialsListState();
}

class _RawMaterialsListState extends State<RawMaterialsList> {
  List<Map<String, dynamic>> filteredRawMaterials = [];

  @override
  void initState() {
    super.initState();
    // Initialize filteredRawMaterials with the original list
    filteredRawMaterials = List.from(widget.rawMaterials);
  }

  void _applyFilter(String filterOption) {
    // Implement your filter logic here based on the selected option
    // This is a placeholder, replace it with your actual filter logic
    setState(() {
      filteredRawMaterials = widget.rawMaterials
          .where((rawMaterial) => rawMaterial['filterOption'] == filterOption)
          .toList();
    });
  }

  void _applySort(String sortOption) {
    // Implement your sorting logic here based on the selected option
    // This is a placeholder, replace it with your actual sorting logic
    setState(() {
      filteredRawMaterials
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
                // Handle add icon click
                // Implement your logic here
              },
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredRawMaterials.length,
            itemBuilder: (context, index) {
              final rawMaterial = filteredRawMaterials[index];
              return RawMaterialCard(
                rawMaterialName: rawMaterial['name'] ?? '',
                rawMaterialDescription: rawMaterial['description'] ?? '',
                rawMaterialImage:
                    rawMaterial['image'] ?? 'assets/images/default_image.jpg',
                rawMaterialPrice: rawMaterial['price'] ?? 0.0,
                rawMaterialSupplier: rawMaterial['supplier'] ?? 'Supplier Name',
              );
            },
          ),
        ),
      ],
    );
  }
}
