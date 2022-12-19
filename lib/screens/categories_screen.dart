import 'package:flutter/material.dart';
import 'package:grocery_project/widgets/categoriy_widget.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  final List<Color> _gridColor = [
   const Color(0xff53b157),
   const Color(0xfff8a44c),
   const Color(0xfff7a593),
   const Color(0xffd3b0e0),
   const Color(0xfffde598),
   const Color(0xffb7dff5),
  ];
  final List<Map<String, dynamic>> _catList = [
    {'catText' : 'Fruits'},
    {'catText' : 'Fruits'},
    {'catText' : 'Fruits'},
    {'catText' : 'Fruits'},
    {'catText' : 'Fruits'},
    {'catText' : 'Fruits'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(crossAxisCount: 2 ,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          children: List.generate(6, (index) => CategoryWidget(
            color: _gridColor[index],
            catText: _catList[index]['catText'],
          )),
        ),
      ),
    );
  }
}
