import 'package:bconnect/components/AnotherPage.dart';
import 'package:bconnect/components/followercardsecond.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bconnect/models/follower.dart';
import 'dart:math';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isExpanded = false;
  bool showAllFollowers = false;
  String searchText = "";
  List<Map<String, dynamic>> users = [];
  bool isLoading = false;

  Future<void> performSearch(String query) async {
    setState(() {
      isLoading = true; // Set loading indicator to true
    });

    const String url =
        'https://bconnect-backend-main.onrender.com/app/getuser/search';

    final data = {
      'query': query,
    };

    final jsonData = jsonEncode(data);

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      setState(() {
        isLoading = false; // Set loading indicator to false
      });

      final List<Map<String, dynamic>> searchResults =
          List<Map<String, dynamic>>.from(json.decode(response.body));

      setState(() {
        users = searchResults;
      });
    } else {
      setState(() {
        isLoading = false; // Set loading indicator to false
        users = []; // Clear the users list when there are no results
      });
    }
  }

  // Helper method to limit the description to 20 words
  String _limitDescription(String description) {
    final words = description.split(' ');
    if (words.length > 10) {
      return words.take(10).join(' ') + '...';
    } else {
      return description;
    }
  }

  // Helper method to generate a random number between 100 and 200
  int _generateRandomFollowers() {
    return 100 + _getRandom().nextInt(101);
  }

  // Helper method to get a random number generator
  Random _getRandom() {
    return Random();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchText =
                              value; // Update searchText as the user types
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      maxLines: null,
                      autofocus: true,
                    ),
                  ),
                  const SizedBox(
                      width: 5), // Add some space between text field and button
                  ElevatedButton(
                    onPressed: () {
                      performSearch(searchText); // Apply search on button press
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(
                          8), // Adjust padding to make the button smaller
                      shape:
                          const CircleBorder(), // Use a circular shape for the button
                    ),
                    child: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Display search results for users
                          if (users.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Searched Users",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.8,
                                  ),
                                  itemCount: users.length,
                                  itemBuilder: (context, index) {
                                    final user = users[index];
                                    return FollowerCardsecond(
                                      follower: Follower(
                                        name: user['username'],
                                        profilePicture: user['avatar'],
                                        description: _limitDescription(
                                            user['description']),
                                        totalFollowers:
                                            _generateRandomFollowers(),
                                        userData:
                                            user, // Pass the user data to the Follower object
                                      ),
                                      onTap: () {
                                        // Navigate to the new page when the card is tapped
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AnotherPage(userData: user),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          // Display a message when there are no results
                          if (users.isEmpty)
                            const Text(
                              "No results found.",
                              style: TextStyle(fontSize: 16),
                            ),
                        ],
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
