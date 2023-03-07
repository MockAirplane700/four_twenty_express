import 'package:flutter/material.dart';
import 'package:four_twenty_express/animated_widgets/delivery_tracker.dart';
import 'package:four_twenty_express/constants/variables.dart';

class DeliveryTrackerPage extends StatefulWidget {
  const DeliveryTrackerPage({Key? key}) : super(key: key);

  @override
  State<DeliveryTrackerPage> createState() => _DeliveryTrackerPageState();
}

class _DeliveryTrackerPageState extends State<DeliveryTrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Tracker', style: generalTextStyle,),
        backgroundColor: appBackgroundColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
      ),
      backgroundColor: appBackgroundColor,
      body: const PackageDeliveryTrackingPage(),
    );
  }
}
