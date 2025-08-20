
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Opacity(
              opacity: .7,
              child: Icon(
                Icons.search,
                size: 28,
              ),
            ),
          ),
          hintText: 'Search',
          border: buildOutLineInputBorder(),
          focusedBorder: buildOutLineInputBorder(),
          enabledBorder: buildOutLineInputBorder()),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
