import 'package:flutter/material.dart';
import 'package:woocomercapp/shared/component/components.dart';
class Setting_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Settings",
            style: TextStyle(fontSize: 34),
          ),
        ),
        buildSettingItem(title: "Account Setting",function:(){}),
        buildSettingItem(title: 'Push Notifications',function:(){}),
        buildSettingItem(title:'About Us' ,function:(){}),
        buildSettingItem(title: 'FAQ' ,function:(){}),
        buildSettingItem(title: 'Contact Us',function:(){})
      ],
    );
  }
}
