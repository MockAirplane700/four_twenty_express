import 'package:const_date_time/const_date_time.dart';
import 'package:flutter/material.dart';
import 'package:four_twenty_express/objects/delivery_message.dart';
import 'package:four_twenty_express/objects/delivery_process.dart';
import 'package:four_twenty_express/objects/driver.dart';
import 'package:four_twenty_express/objects/order_info.dart';
import 'package:timelines/timelines.dart';

///-----------------------------------------------------------------------------
///     DESIGNED AFTER AMAZON DELIVERY TRACKER, VERTICAL - use timelines package
/// ----------------------------------------------------------------------------

const kTileHeight = 50.0;


class PackageDeliveryTrackingPage extends StatelessWidget {
  final OrderInfo info;
  const PackageDeliveryTrackingPage({super.key,  this.info = const OrderInfo(
    id: 1,
    date: ConstDateTime(2022,10,10 ),
    driverInfo: DriverInfo(
      name: 'Philipe',
      thumbnailUrl:
      'https://i.pinimg.com/originals/08/45/81/084581e3155d339376bf1d0e17979dc6.jpg',
    ),
    deliveryProcesses: [
      DeliveryProcess(
        'Package Process',
        messages: [
          DeliveryMessage('8:30am', 'Package received by driver'),
          DeliveryMessage('11:30am', 'Reached halfway mark'),
        ],
      ),
      DeliveryProcess(
        'In Transit',
        messages: [
          DeliveryMessage('13:00pm', 'Driver arrived at destination'),
          DeliveryMessage('11:35am', 'Package delivered by m.vassiliades'),
        ],
      ),
      DeliveryProcess.complete(),
    ],
  )});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final data = _data(index + 1);
          return Center(
            child: Container(
              width: 360.0,
              child: Card(
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: _OrderTitle(
                        orderInfo: data,
                      ),
                    ),
                    const Divider(height: 1.0),
                    _DeliveryProcesses(processes: data.deliveryProcesses),
                    const Divider(height: 1.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: _OnTimeBar(driver: data.driverInfo),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _OrderTitle extends StatelessWidget {
  const _OrderTitle({
    Key? key,
    required this.orderInfo,
  }) : super(key: key);

  final OrderInfo orderInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ORDER NUMBER
        Text(
          'Delivery #${orderInfo.id}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        //  ORDER DATE
        Text(
          '${orderInfo.date.day}/${orderInfo.date.month}/${orderInfo.date.year}',
          style: const TextStyle(
            color: Color(0xffb6b2b2),
          ),
        ),
      ],
    );
  }
}

class _InnerTimeline extends StatelessWidget {
  const _InnerTimeline({
    required this.messages,
  });

  final List<DeliveryMessage> messages;

  @override
  Widget build(BuildContext context) {
    bool isEdgeIndex(int index) {
      return index == 0 || index == messages.length + 1;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FixedTimeline.tileBuilder(
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
            thickness: 1.0,
          ),
          indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
            size: 10.0,
            position: 0.5,
          ),
        ),
        builder: TimelineTileBuilder(
          indicatorBuilder: (_, index) =>
          !isEdgeIndex(index) ? Indicator.outlined(borderWidth: 1.0) : null,
          startConnectorBuilder: (_, index) => Connector.solidLine(),
          endConnectorBuilder: (_, index) => Connector.solidLine(),
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }

            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(messages[index - 1].toString()),
            );
          },
          itemExtentBuilder: (_, index) => isEdgeIndex(index) ? 10.0 : 30.0,
          nodeItemOverlapBuilder: (_, index) =>
          isEdgeIndex(index) ? true : null,
          itemCount: messages.length + 2,
        ),
      ),
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({Key? key, required this.processes})
      : super(key: key);

  final List<DeliveryProcess> processes;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Color(0xff9b9b9b),
        fontSize: 12.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: const Color(0xff989898),
            indicatorTheme: const IndicatorThemeData(
              position: 0,
              size: 20.0,
            ),
            connectorTheme: const ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              if (processes[index].isCompleted) return null;

              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      processes[index].name,
                      style: DefaultTextStyle.of(context).style.copyWith(
                        fontSize: 18.0,
                      ),
                    ),
                    _InnerTimeline(messages: processes[index].messages),
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              if (processes[index].isCompleted) {
                return const DotIndicator(
                  color: Color(0xff66c97f),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12.0,
                  ),
                );
              } else {
                return const OutlinedDotIndicator(
                  borderWidth: 2.5,
                );
              }
            },
            //  INDEX HERE CONTROLS THE RED LINE SHOWING DELIVERY PROGRESS
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              color: processes[index].isCompleted ? Colors.red : null,
            ),
          ),
        ),
      ),
    );
  }
}

class _OnTimeBar extends StatelessWidget {
  const _OnTimeBar({Key? key, required this.driver}) : super(key: key);

  final DriverInfo driver;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('On-time!'),
              ),
            );
          },
          elevation: 0,
          shape: const StadiumBorder(),
          color: const Color(0xff66c97f),
          textColor: Colors.white,
          child: const Text('Contact Support'),
        ),
        const Spacer(),
        Text(
          'Driver\n${driver.name}',
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: 12.0),
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                driver.thumbnailUrl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

OrderInfo _data(int id) => OrderInfo(
  id: id,
  date: DateTime.now(),
  driverInfo: const DriverInfo(
    name: 'Philipe',
    thumbnailUrl:
    'https://i.pinimg.com/originals/08/45/81/084581e3155d339376bf1d0e17979dc6.jpg',
  ),
  deliveryProcesses: [
    const DeliveryProcess(
      'Package Process',
      messages: [
        DeliveryMessage('8:30am', 'Package received by driver'),
        DeliveryMessage('11:30am', 'Reached halfway mark'),
      ],
    ),
    const DeliveryProcess(
      'In Transit',
      messages: [
        DeliveryMessage('13:00pm', 'Driver arrived at destination'),
        DeliveryMessage('11:35am', 'Package delivered by m.vassiliades'),
      ],
    ),
    const DeliveryProcess.complete(),
  ],
);







