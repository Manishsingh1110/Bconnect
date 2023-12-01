import 'package:bconnect/components/rawmaterial.dart';
import 'package:flutter/material.dart';

class Resources extends StatefulWidget {
  const Resources({super.key});

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center, child: _buildRawMaterials()));
  }

  Widget _buildRawMaterials() {
    final rawMaterials = [
      {
        'name': 'Iron Ore',
        'description': 'High-quality iron ore suitable for steel production.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 35.50,
        'supplier': 'Ore Mining Company A',
      },
      {
        'name': 'Copper Ingot',
        'description': 'Pure copper ingots for electrical applications.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 42.75,
        'supplier': 'Metal Works Inc.',
      },
      {
        'name': 'Lumber',
        'description': 'Quality lumber sourced from sustainable forests.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 20.00,
        'supplier': 'Green Woods Co.',
      },
      {
        'name': 'Aluminum Sheet',
        'description': 'Lightweight aluminum sheets for construction.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 30.80,
        'supplier': 'Aluminum Industries Ltd.',
      },
      {
        'name': 'Plastic Pellets',
        'description':
            'Recycled plastic pellets for various manufacturing purposes.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 15.25,
        'supplier': 'Eco Plastics Corp.',
      },
      {
        'name': 'Steel Beam',
        'description':
            'Durable steel beams for structural engineering projects.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 55.00,
        'supplier': 'Steel Dynamics Co.',
      },
      {
        'name': 'Rubber Sheet',
        'description':
            'Flexible rubber sheets used in automotive applications.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 12.50,
        'supplier': 'RubberTech Inc.',
      },
      {
        'name': 'Glass Panel',
        'description': 'Clear glass panels for architectural design.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 18.90,
        'supplier': 'Crystal Glassworks Ltd.',
      },
      {
        'name': 'Cement Bag',
        'description': 'High-quality cement bags for construction projects.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 25.50,
        'supplier': 'Builders Supply Co.',
      },
      {
        'name': 'Circuit Board',
        'description': 'Advanced circuit boards for electronic devices.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 40.00,
        'supplier': 'Tech Components Ltd.',
      },
    ];

    return RawMaterialsList(rawMaterials: rawMaterials);
  }
}
