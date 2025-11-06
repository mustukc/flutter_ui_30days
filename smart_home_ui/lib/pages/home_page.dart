import 'package:flutter/material.dart';
import 'package:smart_home_ui/utils/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //padding
  final double horizontalpadding = 40.0;
  final double verticalPadding = 25.0;

  //list of smart devices
  List mySmartDevices = [
    ["Smart Light", "assets/icons/light-bulb.png", true],
    ["Smart AC", "assets/icons/air-conditioner.png", false],
    ["Smart TV", "assets/icons/smart-tv.png", false],
    ["Smart Fan", "assets/icons/fan.png", false],
  ];

  void powerSwitchChanged(bool value,int index){
    setState(() {
      mySmartDevices[index][2]=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalpadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    "assets/icons/menu.png",
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(Icons.person, size: 45, color: Colors.grey[800]),
                ],
              ),
            ),
            const SizedBox(height: 20),
            //welcome home
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalpadding,
               
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Welcome Home"), Text("MUSTU",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),), 
               ],
              ),
            ),
            
            SizedBox(height: 25,),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: horizontalpadding
              ),
              child: Divider(
                
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 25,),
            //smart device + grid
            SizedBox(height: 20,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: horizontalpadding),
                  child: Text("Smart Devices",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: mySmartDevices.length,
                padding: EdgeInsets.all(25),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.3
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    iconPath: mySmartDevices[index][1],
                    deviceName: mySmartDevices[index][0],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value,index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
