import 'package:flutter/material.dart';

import '../views/search_view.dart';


class FailureBody extends StatelessWidget {
  const FailureBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchView()));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: const Center(
        child: Text(
          "Sorry, something went wrong, please try again",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black),
        ),
      ),
    );
  }
}
