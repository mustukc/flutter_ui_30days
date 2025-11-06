import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String iconPath;
  final String deviceName;
  final bool powerOn;
  void Function(bool)? onChanged;

   SmartDeviceBox({
    super.key,
    required this.iconPath,
    required this.deviceName,
    required this.powerOn,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.black : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(iconPath, height: 65,color: powerOn ? Colors.yellow : Colors.black,),
            //smart device name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(deviceName, style: TextStyle(fontSize: 20,color: powerOn ? Colors.white : Colors.black,fontWeight: FontWeight.bold)),
                  ),
                ),
                Transform.rotate(
                  angle: pi/2,
                  child: CupertinoSwitch(value: powerOn, onChanged: onChanged),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
