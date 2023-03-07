import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:four_twenty_express/constants/functions.dart';
import 'package:four_twenty_express/constants/variables.dart';
import 'package:four_twenty_express/objects/product.dart';
import 'package:four_twenty_express/objects/supplier.dart';
///-----------------------------------------------------------------------------
///     DISPLAY DESIGNED AFTER, STAR CANNABIS WEBSITE - CANNABIS INFUSED PRODUCT
/// ----------------------------------------------------------------------------

class DisplayCannabisInfusedProduct extends StatefulWidget {
  final Product product;
  const DisplayCannabisInfusedProduct({Key? key, required this.product}) : super(key: key);

  @override
  State<DisplayCannabisInfusedProduct> createState() => _DisplayCannabisInfusedProductState();
}

class _DisplayCannabisInfusedProductState extends State<DisplayCannabisInfusedProduct> {
  Color sativa = Colors.orangeAccent;
  Color indica = Colors.deepPurple;
  Color hybrid = Colors.purple;
  Color sativaShadow = shadowColor;
  Color indicaShadow = shadowColor;
  Color hybridShadow = shadowColor;
  String weight = '3.5';
  int quantity = 1;


  _increment() {
    setState(() {
      quantity++;
    });
  }

  _decrement() {
    setState(() {
      quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Product product = widget.product;
    List list = product.sizes;
    weight = list.first;

    //  DETERMINE SHADOW COLOR
    if (product.strainType.contains('Sativa')) {

        sativaShadow = sativa;

    }else if (product.strainType.contains('Indica')){

        indicaShadow = indica;

    }else{
      //  HYBRID

        hybridShadow = hybrid;

    }//end if-else
    //  TODO: SWITCH OUT WITH SUPPLIER OBTAINED FROM ID
    Supplier supplier = Supplier(
        id: '', name: '', image: '',
        description: '', website: '');
    //  TODO: ADD BACKGROUND PICTURE THAT EXTENDS TO THE APP BAR
    return Scaffold(
      appBar: AppBar(
        title: const Text('', style: generalTextStyle,),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
      ),
      backgroundColor: appBackgroundColor,
      body: SingleChildScrollView(child: Column(
        children: [
          //  IMAGE
          Image.network(product.images[0], fit: BoxFit.cover,),
          //  PRODUCT NAME
          Text(product.name, style: titleTextStyle,),
          //  PRODUCT SUPPLIER - TEXT BUTTON VIEW DIALOG BOX
          TextButton(
              onPressed: (){
                showDialog(context: context, builder: (context)=> AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:[
                      //  SUPPLIER LOGO
                      Image.network(supplier.image, fit: BoxFit.cover,),
                      //  DESCRIPTION
                      Text(supplier.description, style: generalTextStyle,),
                      //  WEBSITE
                      IconButton(
                          onPressed: () {
                            launchWebSiteUrl(supplier.website);
                          },
                          icon: const FaIcon(FontAwesomeIcons.globe, color: iconColor,)
                      )
                    ],
                  ),
                ));
              },
              child: Text(product.supplier, style: subtitleTextStyle,)
          ),
          //  SATIVA, INDICA , HYBRID
          Row(
            //  TODO: HIGHLIGHT WITH COLOR TO INDICATE --> SHADOW COLOR
            children:  [
              //  SATIVA
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
                color: cardColor,
                elevation: 8,
                shadowColor: sativaShadow,
                child: Padding(
                  padding: EdgeInsets.all(height/80),
                  child: Row(
                    children: [
                      //  ICON
                      FaIcon(FontAwesomeIcons.boltLightning, color: sativa,),
                      SizedBox(width: width/80,),
                      const Text('|', style: titleTextStyle,),
                      SizedBox(width: width/80,),
                      //  TEXT
                      const Text('Sativa', style: generalTextStyle,)
                    ],
                  ),
                ),
              ),
              //  INDICA
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
                color: cardColor,
                elevation: 8,
                shadowColor: indicaShadow,
                child: Padding(
                  padding:  EdgeInsets.all(height/80),
                  child: Row(
                    children: [
                      //  ICON
                      FaIcon(FontAwesomeIcons.mugHot, color: indica,),
                      SizedBox(width: width/80,),
                      const Text('|', style: titleTextStyle,),
                      SizedBox(width: width/80,),
                      //  TEXT
                      const Text('Indica', style: generalTextStyle,)
                    ],
                  ),
                ),
              ),
              //  HYBRID
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
                color: cardColor,
                elevation: 8,
                shadowColor: hybridShadow,
                child: Padding(
                  padding: EdgeInsets.all(height/80),
                  child: Row(
                    children: [
                      //  ICON
                      FaIcon(FontAwesomeIcons.cannabis, color: hybrid,),
                      SizedBox(width: width/80,),
                      const Text('|', style: titleTextStyle,),
                      SizedBox(width: width/80,),
                      //  TEXT
                      const Text('Sativa', style: generalTextStyle,)
                    ],
                  ),
                ),
              ),

            ],
          ),
          //  AND THC CBD INDICATOR
          Row(
            children: [
              //  THC
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
                color: cardColor,
                elevation: 8,
                shadowColor: shadowColor,
                child: Padding(
                  padding:  EdgeInsets.all(height/80),
                  child: Text('THC | ${product.thc}', style: generalTextStyle,),
                ),
              ),
              //  CBD
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
                color: cardColor,
                elevation: 8,
                shadowColor: shadowColor,
                child: Padding(
                  padding:EdgeInsets.all(height/80),
                  child: Text('CBD | ${product.cbd}', style: generalTextStyle,),
                ),
              ),
            ],
          ),
          //  DESCRIPTION
          Padding(
            padding: EdgeInsets.all(height/50),
            child: Text(product.description, style: generalTextStyle,),
          ),
          //  EFFECTS - TODO: LIST TILE OF EFFECTS - ROW
          Padding(
            padding: EdgeInsets.all(height/80),
            child: SizedBox(
              height: height/10,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return  Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
                      color: cardColor,
                      elevation: 8,
                      shadowColor: shadowColor,
                      child: Padding(
                        padding: EdgeInsets.all(height/80),
                        child: Row(
                          children: [
                            //  ICON
                            const FaIcon(FontAwesomeIcons.sprayCanSparkles, color: iconColor,),
                            SizedBox(width: width/80,),
                            //  TEXT
                            Text(product.effects[index], style: generalTextStyle,)
                          ],
                        ),
                      ),
                    );
                  },
                itemCount: product.effects.length,
              ),
            ),
          ),
          //  WEIGHT AND QUANTITY SELECTION
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  WEIGHT SELECTION
              DropdownButton<String>(
                  items: list.map<DropdownMenuItem<String>>((string) {
                    return DropdownMenuItem<String>(
                      value: string,
                        child: Text(string)
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      weight = value.toString();
                    });
                  },
                value: weight,
                icon: const Icon(Icons.arrow_drop_down, color: iconColor,),
              ),
              //  QUANTITY SELECTION
              //  SET QUANTITY
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        // add to the quantity by 1
                        _increment();
                      },
                      icon: const Icon(Icons.add)
                  ),
                  Container(decoration: const BoxDecoration(shape: BoxShape.rectangle,), child: Text('$quantity'),),
                  IconButton(
                      onPressed: (){
                        //decrement the amount
                        if (quantity > 1) {
                          _decrement();
                        }
                      },
                      icon: const Icon(Icons.remove)
                  )
                ],
              ),
            ],
          ),
          //  ADD TO CART
          ElevatedButton(
              onPressed: () {
                // TODO: ADD TO CART
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor
              ),
              child: const Text('Add to cart', style: buttonTextStyle,)
          )
        ],
      ),),
    );
  }
}
