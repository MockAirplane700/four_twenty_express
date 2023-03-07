import 'package:flutter/material.dart';
import 'package:four_twenty_express/constants/variables.dart';
import 'package:four_twenty_express/logic/checkout_bloc.dart';
import 'package:four_twenty_express/pages/product_display_flower_etc.dart';
import 'package:four_twenty_express/widgets/custom_checkout_card.dart';
///-----------------------------------------------------------------------------
///   TYPICAL CHECKOUT -
///-----------------------------------------------------------------------------

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  double total = 0.0;
  double taxFee = 0.0;
  double serviceFees = 0.0;
  double deliveryFees = 0.0;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double tax = 0.13;
    double service = 0.030;
    double delivery = 5.99;
    double subtotal = total;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: generalTextStyle,),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
      ),
      backgroundColor: appBackgroundColor,
      body: SingleChildScrollView(child: Column(
        children:  [
          //  CHECKOUT LIST VIEW
          SizedBox(
            height: height/2,
            child: StreamBuilder(
                builder: (context, snapshot){
                  if (snapshot.hasData){
                    var items = snapshot.data['cart items'];
                    //  LIST VIEW OF SHOP
                    return ListView.builder(
                        itemBuilder: (context, index){
                          // 'product_id' : product.id,
                          // 'name' : product.name,
                          // 'type': product.type,
                          // 'description' : product.description,
                          // 'images' : product.images,
                          // 'price' : product.price,
                          // 'quantity' : quantity,
                          // 'total' : quantity * product.price,
                          // 'product_object' : product

                          return CheckoutTile(
                              title: items[index]['name'],
                              thumbnail: items[index]['images'][0],
                              total: items[index]['total'],
                              quantity: items[index]['quantity'],
                              onPressed: items[index]['onPressed'],
                              delete: IconButton(onPressed: () {
                                bloc.removeFromCart(items[index]);
                              }, icon: const Icon(Icons.delete, color: Colors.red,)),
                              quantityWidget: Container()
                          );
                        },
                      itemCount: items.length,
                    );
                  }else{
                    return const Center(child: Text('There are currently no items to be checked out'),);
                  }//end if-else
                },
              stream: bloc.getStream,
              initialData: bloc.allItems,
            ),
          ),
          //  SHOW CASE TOTALS AND FEES
          SizedBox(
            height: height/8,
            child: StreamBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData){
                    // THEY ARE POPULATED
                    var items = bloc.allItems['cart items'];
                    for (var item in items){
                      double temp = double.parse(item['price'].toString());
                      total += item['price'];
                    }//end for loop

                    subtotal = total;
                    deliveryFees = delivery;
                    serviceFees = service * subtotal;
                    taxFee = tax * total;
                    total = taxFee + serviceFees + deliveryFees + subtotal;

                  }else{
                    // THEY ARE ALL EMPTY
                    subtotal = 0.0;
                    deliveryFees = 0.0;
                    serviceFees = 0.0;
                    taxFee = 0.0;
                    total = 0.0;
                  }//end if-else
                  return Card(
                    color: cardColor,
                    shadowColor: shadowColor,
                    elevation: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //  SUB-TOTAL
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(child: Text('Subtotal', style: subtitleTextStyle,)),
                            Expanded(child: Text('\$${subtotal.toStringAsFixed(2)}' ,style: subtitleTextStyle,)),
                          ],
                        ),
                        //  TAX
                        Row(
                          children: [
                            const Expanded(child: Text('Tax', style: subtitleTextStyle,)),
                            Expanded(child: Text('\$${tax.toStringAsFixed(2)}' ,style: subtitleTextStyle,)),
                          ],
                        ),
                        //  DELIVERY
                        Row(
                          children: [
                            const Expanded(child: Text('Delivery', style: subtitleTextStyle,)),
                            Expanded(child: Text('\$${deliveryFees.toStringAsFixed(2)}' ,style: subtitleTextStyle,)),
                          ],
                        ),
                        //  SERVICE FEES
                        Row(
                          children: [
                            const Expanded(child: Text('Service fees', style: subtitleTextStyle,)),
                            Expanded(child: Text('\$${serviceFees.toStringAsFixed(2)}' ,style: subtitleTextStyle,)),
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(child: Text('Total', style: subtitleTextStyle,)),
                            Expanded(child: Text('\$${total.toStringAsFixed(2)}' ,style: subtitleTextStyle,)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              stream: bloc.getStream,
            ),
          ),
          //  CHECKOUT
          ElevatedButton(
              onPressed: (){
                // TODO: CALL PAYMENT INTENT
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
              ),
              child: const Text('Checkout', style: buttonTextStyle,)
          )
        ],
      ),),
    );
  }
}
