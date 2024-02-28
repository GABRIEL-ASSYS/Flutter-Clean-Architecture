import 'package:flutter/material.dart';
import 'package:hyrule/screens/results.dart';
import 'package:hyrule/utils/consts/categories.dart';

class Category extends StatelessWidget {
  const Category({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 155.0,
          height: 155.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF00497D),
              width: 2.0,
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results(category: category),
                ),
              );
            },
            child: Ink(
              child: Center(
                child: Image.asset("$imagePath$category.png"),
              ),
            ),
          ),
        ),
        Text(
          categories[category]!,
          style: const TextStyle(
            color: Color(0xFF00497D),
            fontSize: 22.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
