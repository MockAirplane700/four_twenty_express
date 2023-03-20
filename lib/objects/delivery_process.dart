import 'package:four_twenty_express/objects/delivery_message.dart';

class DeliveryProcess {
  const DeliveryProcess(
      this.name, {
        this.messages = const [],
      });

  const DeliveryProcess.complete()
      : this.name = 'Done',
        this.messages = const [];

  final String name;
  final List<DeliveryMessage> messages;

  bool get isCompleted => name == 'Done';
}