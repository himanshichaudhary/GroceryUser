import 'package:flutter/material.dart';
import 'package:grocery_project/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/dart_theme_provider.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key ,required this.color , required this.catText}) : super(key: key);

  final Color color;
  final String catText;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
  //  final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return  Container(
     decoration: BoxDecoration(
       color: color.withOpacity(0.1),
       borderRadius: BorderRadius.circular(16),
       border: Border.all(color: color.withOpacity(0.7), width: 2)
     ),
      child: Column(
        children: [
          Container(
            height: _screenWidth * 0.3,
            width: _screenWidth * 0.3,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage('assets/images/vegi.png'),fit: BoxFit.fill
              )
            ),
          ),
          SizedBox(height: 10,),
          TextWidget(text: catText, color: color, fontSize: 18, isTitle: true,)
        ],
      ),
    );
  }
}
