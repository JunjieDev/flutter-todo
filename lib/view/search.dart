import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  bool searchVisibility = false;
  Search({super.key, required this.searchVisibility});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) => 
  Visibility(
    visible: widget.searchVisibility,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          print(value);
          //filterSearchResults(value);
        },
        controller: editingController,
        decoration: const InputDecoration(
            labelText: "Search",
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    ),
  );
  
}
