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

class RawMaterialsListSecond extends StatefulWidget {
  final List<Map<String, dynamic>> rawMaterials;

  const RawMaterialsListSecond({Key? key, required this.rawMaterials})
      : super(key: key);

  @override
  _RawMaterialsListState createState() => _RawMaterialsListState();
}

class _RawMaterialsListState extends State<RawMaterialsListSecond> {
  List<Map<String, dynamic>> filteredRawMaterials = [];

  @override
  void initState() {
    super.initState();
    // Initialize filteredRawMaterials with the original list
    filteredRawMaterials = List.from(widget.rawMaterials);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
