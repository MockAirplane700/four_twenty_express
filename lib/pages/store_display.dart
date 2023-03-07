import 'package:flutter/material.dart';
import 'package:four_twenty_express/constants/functions.dart';
import 'package:four_twenty_express/constants/variables.dart';
import 'package:four_twenty_express/logic/products.dart';
import 'package:four_twenty_express/objects/product.dart';
import 'package:four_twenty_express/objects/store.dart';
import 'package:four_twenty_express/widgets/custom_product_card.dart';

///-----------------------------------------------------------------------------
///   STORE DISPLAY BASED OF SKIP AND DOOR DASH
///   DISPLAY STORE DETAILS IN THIS PAGE - DIALOG BOX EXPANSION
///----------------------------------------------------------------------------

class StoreDisplayPage extends StatefulWidget {
  final Store store;
  const StoreDisplayPage({Key? key, required this.store}) : super(key: key);

  @override
  State<StoreDisplayPage> createState() => _StoreDisplayPageState();
}

class _StoreDisplayPageState extends State<StoreDisplayPage> {
  @override
  Widget build(BuildContext context) {
    Store store = widget.store;
    List products = store.products;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(store.name, style: generalTextStyle,),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
      ),
      backgroundColor: appBackgroundColor,
      body: SingleChildScrollView(child: Column(
        children: [
          // BANNER IMAGE
          Image.network(store.images[0], fit: BoxFit.cover,),
          // STORE DETAILS
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //  STORE NAME ,
              Flexible(child: Text(store.name, style: titleTextStyle,)),
              //  ADDRESS | RATING
              Flexible(child: Row(
                children: [
                  Text(store.address[0] , style: subtitleTextStyle,),

                ],
              )),
              Flexible(child:  Row(
                children: [
                  Icon(Icons.star, color: iconColor, size: height/30,),
                  Text(store.rating, style: subtitleTextStyle,)
                ],
              )),
              //  DELIVERY FEE | MORE
              Flexible(
                  child: Row(
                children: [
                  const Text('\$ 2.99' , style: subtitleTextStyle,),
                  const Text('|', style: subtitleTextStyle,),
                  TextButton(
                      onPressed: () {
                        launchWebSiteUrl(store.website);
                      },
                      child: const Text('More', style: subtitleTextStyle,)
                  )
                ],
              )),
            ],
          ),
          //  LIST STORE PRODUCTS - TODO: ADD TOP NAV BAR LIKE IN SKIP AND DOORDASH
          ListView.builder(
              itemBuilder: (context , index) {
                if (products.isEmpty) {
                  return const Center(child: Text('There are currently no products in this store'),);
                }else{
                  return FutureBuilder(
                      builder: (context , snapshot) {
                        if (snapshot.hasData){
                          Product tempProduct = snapshot.data as Product;
                          return CustomProductCard(product: tempProduct);
                        }else{
                          return const Center(child:CircularProgressIndicator(),);
                        }//end if-else
                      },
                      future: Products.getSampleProduct(products[index]),

                  );
                }//end if-else
              },
            itemCount: store.products.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          )
        ],
      ),),
    );
  }
}
