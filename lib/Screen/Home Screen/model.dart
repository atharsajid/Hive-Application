import 'package:flutter/material.dart';

class Category {
  String name;
  Color color1;
  Color color2;
  String icon;
  Category({
    required this.name,
    required this.color1,
    required this.color2,
    required this.icon,
  });
}

List<Category> category = [
  Category(name: 'New Ideas', color1: Colors.orange,color2: Colors.orange.shade100, icon: 'images/1.png'),
  Category(name: 'Music', color1: Colors.lightBlue,color2: Colors.lightBlue.shade100, icon: 'images/2.png'),
  Category(name: 'Programming', color1: Colors.purple,color2: Colors.purple.shade100, icon: 'images/3.png'),
  Category(name: 'Cooking', color1: Colors.pink, color2: Colors.pink.shade100, icon: 'images/4.png'),
  Category(name: 'Traveling', color1: Colors.lightGreen,color2: Colors.lightGreen.shade100, icon: 'images/5.png'),
  Category(name: 'Movies', color1: Colors.red,color2: Colors.red.shade100, icon: 'images/6.png')
];
