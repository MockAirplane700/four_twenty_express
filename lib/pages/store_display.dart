import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Store store = widget.store;
    List products = store.products;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //  TODO: CREATE A LIST OF LIST VIEW TO SELECT FROM
    List views = [
      //  BUDS
      //  EXTRACTS
      //  EDIBLES
      //  PRE-ROLLS
      //  ACCESSORIES
    ];

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
          //  LIST STORE PRODUCTS -
          //  NAV BAR FOR FILTER
          NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            destinations: const [
              // FLOWER
              NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.leaf),
                  label: 'Flower'
              ),
              // EDIBLES
              NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.candyCane),
                  label: 'Edibles'
              ),
              // EXTRACTS
              NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.droplet),
                  label: 'Extracts'
              ),
              // PRE-ROLLS
              NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.smoking),
                  label: 'Pre-rolls'
              ),
            ],

          ),
          FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  Map<String,dynamic> map = snapshot.data as Map<String,dynamic>;
                  views.add(map['FLOWER']);
                  views.add(map['EXTRACTS']);
                  views.add(map['EDIBLES']);
                  views.add(map['PRE-ROLLS']);
                  views.add(map['ACCESSORIES']);

                  return  ListView.builder(
                    itemBuilder: (context , index) {
                      if (views[_selectedIndex].isEmpty) {
                        return const Center(child: Text('There are currently no products in this store', style: generalTextStyle,),);
                      }else{
                        Product temp = views[_selectedIndex][index] as Product;
                        return CustomProductCard(product: temp);
                          FutureBuilder(
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
                    itemCount: views[_selectedIndex].length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  );
                }else{
                  return const Center(child: CircularProgressIndicator(),);
                }//end if-else
              },
            future: Products.getProductByType(widget.store.products),
          ),


        ],
      ),),
    );
  }
}
