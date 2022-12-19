import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dart_theme_provider.dart';
import '../widgets/text_widget.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            RichText(text: TextSpan(text: 'Hi, ' , style:
            TextStyle(color: Colors.cyan , fontSize: 27 , fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(text: 'My Name' , style: TextStyle(color: color , fontSize: 25 , fontWeight: FontWeight.w600))
            ]),
            ),
            const SizedBox(height: 10,),
            TextWidget(text: 'example@gmail.com',
              color: color, fontSize: 22,),
            const SizedBox(height: 20,),
            const Divider(thickness: 2,),
            _listTiles(titile: 'Address',subTitles: 'My subtiles', icon: IconlyBold.activity,  color: color,
                onPressed: () async{
                 await _showAddressDialog(color);
                }),
            _listTiles(titile: 'Orders', icon: IconlyBold.bag,  color: color, onPressed: (){}),
            _listTiles(titile: 'Forget Password', icon: IconlyBold.unlock, color: color, onPressed: (){}),
            _listTiles(titile: 'Viewed', icon: IconlyBold.show,  color: color,onPressed: (){}),
            SwitchListTile(
              title: TextWidget(text: 'Theme',
                color: color, fontSize: 22,),
              secondary: Icon(themeState.getDarkTheme ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
              onChanged: (bool value){
                setState(() {
                  themeState.setDarkTheme = value;
                });

              },
              value: themeState.getDarkTheme,
            ),
            _listTiles(titile: 'Logout', icon: IconlyBold.logout, color: color,
                onPressed: () async{
              await _showLogoutDialog(color);
            })
          ],
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog(Color color) async{
    await showDialog(context: context, builder: (context){
      return AlertDialog(title: TextWidget(text: 'Logout', color: color, fontSize: 20, isTitle: true,),
        content: TextWidget(text: 'Do you wanna logout?', color: color, fontSize: 18,),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: TextWidget(text: 'Cancel', color: Colors.cyan, fontSize: 18,)),

          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: TextWidget(text: 'Ok', color: Colors.red, fontSize: 18,))
        ],
      );

    });
  }
  Future<void> _showAddressDialog(Color color) async{
    await showDialog(context: context, builder: (context){
      return AlertDialog(title: TextWidget(text: 'Update', color: color, fontSize: 20, ),
        content: TextField(onChanged: (value){},
          controller: _addressController,
          decoration: InputDecoration(hintText: 'Your address' , ),),
        actions: [
          TextButton(onPressed: (){}, child: TextWidget(text: 'Update', color: color, fontSize: 18,))
        ],
      );

    });
  }
  Widget _listTiles({required String titile ,  String? subTitles,
    required IconData icon , required Function onPressed , required Color color }){
    return ListTile(
      title: TextWidget(text: titile,
        color: color, fontSize: 22,),
      subtitle: TextWidget(text: subTitles == null ?  '' : subTitles,
        color: color, fontSize: 18,),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: (){
        onPressed();
      },

    );
  }
}