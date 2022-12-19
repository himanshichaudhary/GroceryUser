import 'package:flutter/material.dart';
import 'package:grocery_project/screens/cart_screen.dart';
import 'package:grocery_project/screens/categories_screen.dart';
import 'package:grocery_project/screens/home_screen.dart';
import 'package:grocery_project/screens/profile_screen.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../consts/colors.dart';
import '../provider/dart_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {

  int _selectedIndex = 0;
  final List<Map<String ,dynamic>> _pageList = [
    {"page" : const  HomeScreen() , "title" : "Home Screen" } ,
    {"page" : const CategoriesScreen() , "title" : "Categories" } ,
    {"page" :const CartScreen() , "title" : "Cart" } ,
    {"page" :const ProfileScreen() , "title" : "Profile" } ,
  ];

  void _selectedPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: themeState.getDarkTheme ? Colors.blue : Colors.black,
        elevation: 0.0,
        title: Text(_pageList[_selectedIndex]['title']),
      ),
      body: _pageList[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeState.getDarkTheme ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        unselectedItemColor: themeState.getDarkTheme ? Colors.white24 : kMediumBlack ,
        selectedItemColor: themeState.getDarkTheme ? Colors.lightBlue  : kDarkBlack ,
        onTap: _selectedPage,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home) , label: "Home"),
          BottomNavigationBarItem(icon: Icon(_selectedIndex == 1 ? IconlyBold.category :IconlyLight.category), label: "Home"),
          BottomNavigationBarItem(icon: Icon(_selectedIndex == 2 ? IconlyBold.buy :IconlyLight.buy), label: "Home"),
          BottomNavigationBarItem(icon: Icon(_selectedIndex == 3 ? IconlyBold.profile :IconlyLight.profile), label: "Home")
        ],

      ),
    );
  }
}
