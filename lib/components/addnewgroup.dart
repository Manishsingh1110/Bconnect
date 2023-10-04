import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  bool isPublic = true; // Default to a public group
  String? selectedImagePath; // Holds the selected profile image path
  String?
      selectedBackgroundImagePath; // Holds the selected background image path
  List<String> industries = []; // List to store selected industries
  final TextEditingController _industryController = TextEditingController();
  String groupName = '';
  String groupDescription = '';
  String groupLocation = '';
  bool autoDetectLocation = false;
  bool isMembersOnly = false;
  bool isInvitationOnly = false;

  Future<void> _getUserLocation() async {
    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      setState(() {
        groupLocation =
            "${currentPosition.latitude}, ${currentPosition.longitude}";
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  // Function to pick an image from the gallery for the profile image
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImagePath = pickedImage.path;
      });
    }
  }

  // Function to pick an image from the gallery for the background image
  Future<void> _pickBackgroundImage() async {
    final picker = ImagePicker();
    final pickedBackgroundImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedBackgroundImage != null) {
      setState(() {
        selectedBackgroundImagePath = pickedBackgroundImage.path;
      });
    }
  }

  // Function to add an industry to the list
  void _addIndustry(String industry, TextEditingController controller) {
    setState(() {
      industries.add(industry);
      controller.clear(); // Clear the text field
    });
  }

  // Function to remove an industry from the list
  void _removeIndustry(String industry) {
    setState(() {
      industries.remove(industry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple, // Set the background color to purple
        leading: IconButton(
          icon: const Icon(Icons.close,
              color: Colors.white), // Set the icon color to white
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: const Text(
          'Create a New Group',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Set the text color to white
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 0.2), // Vertical padding only
          child: Column(
            // Center horizontally
            children: [
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onTap: _pickBackgroundImage,
                        child: Stack(
                          alignment:
                              Alignment.bottomLeft, // Align to the bottom left
                          children: [
                            selectedBackgroundImagePath == null
                                ? Container(
                                    width:
                                        double.infinity, // Expand to full width
                                    height: 200, // Set the desired height
                                    color: Colors.grey[200],
                                    child: Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/image_2.jpg',
                                          width: double
                                              .infinity, // Expand to full width
                                          height: 200, // Set the desired height
                                          fit: BoxFit.cover,
                                        ),
                                        const Icon(
                                          Icons.camera_alt,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ))
                                : Image.network(
                                    selectedBackgroundImagePath!,
                                    width:
                                        double.infinity, // Expand to full width
                                    height: 200, // Set the desired height
                                    fit: BoxFit.cover,
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const SizedBox(
                        height: 20,
                        width: double.infinity,
                      ),
                      Positioned(
                        top: -60,
                        left: 15,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: selectedImagePath == null
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey[200],
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                )
                              : ClipOval(
                                  child: Image.network(
                                    selectedImagePath!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 16), // Add padding to all input fields
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              groupName = value;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Group Name',
                          ),
                        ),
                        // Group Description input field (Multiline)
                        const SizedBox(height: 16),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              groupDescription = value;
                            });
                          },
                          maxLines: null, // Allow multiple lines
                          decoration: const InputDecoration(
                            labelText: 'Group Description',
                          ),
                        ),

                        // Industries input field
                        const SizedBox(height: 16),
                        TextField(
                          controller: _industryController, // Use the controller
                          onChanged: (value) {
                            // You can add validation logic here if needed
                          },
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {
                              _addIndustry(value,
                                  _industryController); // Pass the controller to clear the text field
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: 'Industries (Enter and Submit)',
                          ),
                        ),

                        // Display selected industries
                        const SizedBox(height: 8),
                        Wrap(
                          children: industries
                              .map((industry) => Chip(
                                    label: Text(industry),
                                    onDeleted: () {
                                      _removeIndustry(industry);
                                    },
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              groupLocation = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Location',
                            suffixIcon: IconButton(
                              icon: Icon(
                                autoDetectLocation
                                    ? Icons.location_on
                                    : Icons.clear,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (autoDetectLocation) {
                                    autoDetectLocation = false;
                                    groupLocation = '';
                                  } else {
                                    autoDetectLocation = true;
                                    _getUserLocation(); // Get the user's location
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        CheckboxListTile(
                          title: const Text('Public Group'),
                          value: isPublic,
                          onChanged: (newValue) {
                            setState(() {
                              isPublic = newValue!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('Members Only'),
                          value: isMembersOnly,
                          onChanged: (newValue) {
                            setState(() {
                              isMembersOnly = newValue!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('Invitation Only'),
                          value: isInvitationOnly,
                          onChanged: (newValue) {
                            setState(() {
                              isInvitationOnly = newValue!;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: (isPublic ||
                                  isMembersOnly ||
                                  isInvitationOnly)
                              ? () {
                                  Navigator.pop(
                                      context); // Close the create group screen
                                }
                              : null, // Disable the button if no permissions are selected
                          child: const Text('Create Group'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
