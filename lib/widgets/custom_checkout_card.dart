import 'package:flutter/material.dart';
import 'package:four_twenty_express/constants/variables.dart';

class CheckoutTile extends StatelessWidget {
  final String title;
  final String thumbnail;
  final double total;
  final int quantity;
  final Function() onPressed;
  final IconButton delete;
  final Widget quantityWidget;

  const CheckoutTile({
    Key? key, required this.title, required this.thumbnail,
    required this.total, required this.quantity,
    required this.onPressed, required this.delete, required this.quantityWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: Image.network(thumbnail, fit: BoxFit.cover,),
      title: Text(title, style: titleTextStyle,),
      subtitle: Column(
        children: [
          Row(
            children: const [
              //Expanded(child: quantityWidget),
              Expanded(child: SizedBox(width: 0,))
            ],
          ),
          Row(
            children: [
              Text('\$ ${total.toStringAsFixed(2)}', style: subtitleTextStyle,),
            ],
          )
        ],),
      trailing: delete,
      visualDensity:const VisualDensity(vertical: VisualDensity.maximumDensity),
      onTap:onPressed ,
    );
  }
}