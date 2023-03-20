import 'package:four_twenty_express/objects/delivery_process.dart';
import 'package:four_twenty_express/objects/driver.dart';

class OrderInfo {
  const OrderInfo({
    required this.id,
    required this.date,
    required this.driverInfo,
    required this.deliveryProcesses,
  });

  final int id;
  final DateTime date;
  final DriverInfo driverInfo;
  final List<DeliveryProcess> deliveryProcesses;
}