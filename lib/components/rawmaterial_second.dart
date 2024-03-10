import 'package:bconnect/models/product.dart';
import 'package:flutter/material.dart';

class RawMaterialCard extends StatelessWidget {
  final String rawMaterialName;
  final String rawMaterialDescription;
  final String rawMaterialImage;
  final double rawMaterialPrice;
  final String rawMaterialSupplier;
  final String rawMaterialuserimage;
  final String rawMaterialtimeago;

  const RawMaterialCard({
    Key? key,
    required this.rawMaterialName,
    required this.rawMaterialDescription,
    required this.rawMaterialuserimage,
    required this.rawMaterialtimeago,
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
          ListTile(
            leading: CircleAvatar(
              // ignore: unnecessary_null_comparison
              backgroundImage: rawMaterialuserimage != null
                  ? NetworkImage(rawMaterialuserimage) as ImageProvider
                  : const AssetImage('fallback_image_path'),
            ),
            title: Text(rawMaterialSupplier),
            subtitle: Text(rawMaterialtimeago),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ClipRRect(
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

class RawMaterialsListSecond extends StatelessWidget {
  final List<Byproduct> byproducts;
  const RawMaterialsListSecond({Key? key, required this.byproducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: byproducts.length,
            itemBuilder: (context, index) {
              final byproduct = byproducts[index];
              return RawMaterialCard(
                rawMaterialName: byproduct.name,
                rawMaterialDescription: byproduct.description,
                rawMaterialImage: byproduct.image,
                rawMaterialPrice: byproduct.price,
                rawMaterialSupplier: byproduct.supplier,
                rawMaterialuserimage: byproduct.userImage,
                rawMaterialtimeago: byproduct.timeAgo,
              );
            },
          ),
        ),
      ],
    );
  }
}
