import 'package:flutter/material.dart';
import 'package:four_twenty_express/constants/variables.dart';
import 'package:four_twenty_express/logic/checkout_bloc.dart';
import 'package:four_twenty_express/objects/product.dart';
import 'package:four_twenty_express/pages/product_display_flower_etc.dart';

class CustomProductCard extends StatefulWidget {
  final Product product;
  const CustomProductCard({Key? key,required this.product,}) : super(key: key);

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
  String dropdownValue = '';
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

    List list = widget.product.sizes;
    dropdownValue = list.first;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DisplayCannabisInfusedProduct(product:widget.product )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height/80),
        ),
        shadowColor: shadowColor,
        child: Row(
          children:  [
            //  PRODUCT IMAGE
            Expanded(flex: 3,
                child: Image.network(widget.product.images[0], fit: BoxFit.cover, )),
            SizedBox(width: width/80,),
            //  PRODUCT DETAILS - INCLUDING PURCHASE BUTTON
            Expanded(
              flex: 7,
                child: SizedBox(height: height/8,child: Column(
                  children:  [
                    //  NAME OF PRODUCT
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Text(widget.product.name, style: titleTextStyle,),
                        ],
                      ),
                    ),
                    //  SUPPLIER
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Text(widget.product.supplier, style: subtitleTextStyle,),
                        ],
                      ),
                    ),
                    //  STRAIN . THC CONTENT | CBD CONTENT
                    Expanded(
                      flex: 1,
                        child: Row(
                      children: [
                        Text('THC: ${widget.product.thc} | CBD: ${widget.product.cbd}',
                          style: generalTextStyle,
                        ),
                      ],
                    )),
                    //  PURCHASE BUTTON
                   Expanded(
                     flex: 1,
                       child:  Row(
                     children: [
                       ElevatedButton(
                           onPressed: () {
                             showDialog(context: context, builder: (context)=> AlertDialog(
                               content: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   //  PRODUCT IMAGE
                                   Image.network(widget.product.images[0], fit: BoxFit.cover,),
                                   //  SELECT WEIGHT
                                   DropdownButton(
                                     items: list.map<DropdownMenuItem<String>>((value) {
                                       return DropdownMenuItem<String>(
                                           value: value,
                                           child: Text(value)
                                       );
                                     }).toList(),
                                     onChanged: (value) {
                                       setState(() {
                                         dropdownValue = value.toString();
                                       });
                                     },
                                     value: dropdownValue,
                                     icon: const Icon(Icons.arrow_drop_down, color: iconColor,),

                                   ),
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
                                   //  ADD TO CART
                                   ElevatedButton(
                                       onPressed: (){
                                         //  ADD TO CART
                                         bloc.addToCart(
                                             {
                                               'name' : widget.product.name,
                                               'type' : widget.product.type,
                                               'description' : widget.product.description,
                                               'images' : widget.product.images,
                                               'price' : widget.product.price,
                                               'quantity' : quantity,
                                               // NULLABLE
                                               'strain':widget.product.strain,
                                               'thc':widget.product.thc,
                                               'cbd':widget.product.cbd,
                                               'supplier':widget.product.supplier,
                                               'sizes':widget.product.sizes
                                             },
                                             context
                                         );
                                         // ALERT THE USER IN CHANGE STATE
                                         ScaffoldMessenger.of(context).showSnackBar(
                                           const SnackBar(content: Text('Added to cart'))
                                         );
                                       },
                                       style: ElevatedButton.styleFrom(
                                         backgroundColor: dialogBoxColor,
                                         side: const BorderSide(
                                           color: buttonColor
                                         )
                                       ),
                                       child: const Text('Add to cart', style: buttonTextStyle,)
                                   )
                                 ],
                               ),
                             ));
                           },
                           style: ElevatedButton.styleFrom(
                               backgroundColor: cardColor,
                               side: const BorderSide(
                                 color: buttonColor,
                               )
                           ),
                           //  HERE WE PUT THE PRICE OF THE PRODUCT
                           child: Text('\$${widget.product.price.toStringAsFixed(2)}' , style: buttonTextStyle,)
                       ),
                     ],
                   ))
                  ],
                ),))
          ],
        ),
      ),
    );
    //  THE PRODUCT TYPE IS AN ACCESSORY

  }
}
