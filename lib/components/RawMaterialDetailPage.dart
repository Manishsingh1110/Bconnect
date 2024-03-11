import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RawMaterialDetailPage extends StatelessWidget {
  final String rawMaterialName;
  final String rawMaterialDescription;
  final String rawMaterialImage;
  final double rawMaterialPrice;
  final String rawMaterialSupplier;
  final String rawMaterialUserImage;
  final String rawMaterialTimeAgo;

  const RawMaterialDetailPage({
    Key? key,
    required this.rawMaterialName,
    required this.rawMaterialDescription,
    required this.rawMaterialImage,
    required this.rawMaterialPrice,
    required this.rawMaterialSupplier,
    required this.rawMaterialUserImage,
    required this.rawMaterialTimeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(rawMaterialName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: List.generate(5, (index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    rawMaterialImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  8.0, 16.0, 8.0, 8.0), // Increased top padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rawMaterialName,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    rawMaterialDescription,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 25.0, // Add some spacing before buttons
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle chat button press
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the value for squareness
                          ),
                        ),
                        child: const Icon(
                          Icons.chat, // Use any chat icon you prefer
                          size: 24.0,
                          color: Colors.blueAccent,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle mail button press
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the value for squareness
                          ),
                        ),
                        child: const Icon(
                          Icons.mail, // Use any mail icon you prefer
                          size: 24.0,
                          color: Colors.blueAccent,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle location button press
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the value for squareness
                          ),
                        ),
                        child: const Icon(
                          Icons.location_on, // Use any location icon you prefer
                          size: 24.0,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22.0),
                  // Add dedicated description in bullet points
                  const Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Add bullet points for dedicated description
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        12.0, 16.0, 12.0, 8.0), // Increased top padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildBulletPointsList(
                          "Obsidian, the enigmatic marvel born from the heart of the Earth's fiery core, emerges as a testament to the tumultuous dance of geological forces. Steeped in an ancient history that spans millennia, this raw material embodies the very essence of primordial creation. Formed through the rapid cooling of molten lava, obsidian crystallizes into a mesmerizing black glass, its surface a labyrinth of subtle intricacies and rugged textures. Each shard, a unique fusion of fire and earth, reflects the ethereal beauty of its volcanic origins, capturing the imagination with its mysterious allure. As the sun casts its gentle rays upon the obsidian's surface, it glistens like a myriad of stars scattered across a midnight sky, captivating the eye with its depth and clarity. Yet, beneath its polished exterior lies a silent testament to the violent forces that birthed it, with each fissure and ripple telling a story of ancient cataclysms and seismic upheavals. Running one's fingers over its cool surface, one can't help but feel a sense of reverence for the elemental forces that shaped it. The smoothness belies the chaotic nature of its creation, offering a tangible connection to the raw power that forged it from the depths of the Earth. Despite its ominous appearance, obsidian holds within it a hidden brilliance, capable of revealing intricate patterns and hues when expertly polished or cut. From ancient civilizations who revered it for its mystical properties to modern artisans who fashion it into exquisite works of art, obsidian continues to captivate and inspire humanity, serving as a tangible reminder of the Earth's ever-changing landscape and the enduring power of nature's creativity."),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Terms and Conditions:',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Add bullet points for terms and conditions
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildBulletPointsList(
                        'By purchasing and/or using our product, you agree to abide by the following terms and conditions. Our company reserves the right to modify these terms at any time without prior notice. The product is provided "as is" without any warranties, express or implied, including but not limited to the implied warranties of merchantability and fitness for a particular purpose. We shall not be liable for any damages arising from the use or inability to use the product, including but not limited to direct, indirect, incidental, consequential, or punitive damages. The user assumes all risks associated with the use of the product. The company shall not be responsible for any loss of data or information resulting from the use of the product. The user agrees not to reverse engineer, decompile, or disassemble the product. This agreement shall be governed by and construed in accordance with the laws of [jurisdiction]. Any dispute arising under this agreement shall be resolved exclusively by the courts of [jurisdiction]. This agreement constitutes the entire agreement between the parties regarding the subject matter herein and supersedes all prior agreements and understandings, whether written or oral.'),
                  ),
                  const SizedBox(height: 8.0),
                  // Add dummy location, mail ID, contact number
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.0), // Add spacing
                      Text(
                        'Serviceable Locations:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0), // Add spacing
                      Text(
                        '- New York, USA',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        '- London, UK',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        '- Tokyo, Japan',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 16.0), // Add spacing
                      Text(
                        'Mail-id List:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0), // Add spacing
                      Text(
                        'Sales: sales@example.com',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        'Support: support@example.com',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        'General Inquiries: info@example.com',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 16.0), // Add spacing
                      Text(
                        'Contact Number according to location:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0), // Add spacing
                      Text(
                        '- New York: +1 123-456-7890',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        '- London: +44 1234-567890',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        '- Tokyo: +81 123-456-7890',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle price button press
              },
              child: Text('Price :- ${rawMaterialPrice.toString()} per unit'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle Instocks button press
              },
              child: const Text('Instocks'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBulletPointsList(String text) {
    List<String> sentences = text.split('. ');
    return sentences.map((sentence) {
      return _buildBulletPoint(sentence);
    }).toList();
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.arrow_right,
            size: 20), // Use any bullet point icon you prefer
        const SizedBox(width: 4.0),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 12.0),
          ),
        ),
      ],
    );
  }
}
