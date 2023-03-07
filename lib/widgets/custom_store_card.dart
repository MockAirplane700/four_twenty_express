import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:four_twenty_express/constants/variables.dart';
import 'package:four_twenty_express/logic/stores.dart';
import 'package:four_twenty_express/objects/store.dart';

///------------------------------------------------------------------------------
///         DESIGNED AFTER SKIP THE DISHES AND DOOR DASH HOME
/// -----------------------------------------------------------------------------

class StoresDashboardCard extends StatefulWidget {
  final Store store;
  final String banner;
  final String thumbnail;
  final String name;
  final String duration;
  final String fee;
  final String googleRating;
  final Function() onTap;

  const StoresDashboardCard({
    Key? key ,required this.store,  required this.banner, required this.thumbnail,
    required this.name, required this.duration, required this.fee,
    required this.googleRating, required this.onTap
  }) : super(key: key);

  @override
  State<StoresDashboardCard> createState() => _StoresDashboardCardState();
}

class _StoresDashboardCardState extends State<StoresDashboardCard> {
  Color tempIconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        // BACKGROUND IMAGE OF STORE BANNER
        child: Column(
          children: [
            Image.network(widget.banner,fit: BoxFit.cover ,height: height/6,),
            Row(
              children:  [
                // STORE LOGO
                Expanded(
                  flex: 2,
                  child: Card(
                    child: Image.network(widget.thumbnail, fit: BoxFit.scaleDown, height: height/4.5,),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding:  EdgeInsets.all(height/80),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // STORE NAME
                              Expanded(child: Text(widget.name, style: titleTextStyle,)),
                              // ICON BUTTON TO BOOKMARK STORE
                              Expanded(child:  IconButton(
                                  onPressed: () {
                                    if (tempIconColor == Colors.grey){
                                      setState(() {
                                        tempIconColor = Colors.red;
                                      });
                                      // add to bookmarks
                                      Stores.bookmarkStore(widget.store);
                                    }else{
                                      setState(() {
                                        tempIconColor = Colors.grey;
                                      });
                                      //remove stores
                                      Stores.removeBookmarkedStore(widget.store);
                                    }//end if-else
                                  },
                                  icon:FaIcon(FontAwesomeIcons.solidHeart, color: tempIconColor,)
                              ))
                            ],
                          ),

                          // DELIVERY DURATION
                          Row(
                            children: [
                              Text(widget.duration , style: subtitleTextStyle,)
                            ],
                          ),
                          SizedBox(height: height/100,),
                          // DELIVERY FEE
                          Row(
                            children: [
                              Text('\$ ${widget.fee}', style: generalTextStyle,)
                            ],
                          ),
                          SizedBox(height: height/100,),
                          // GOOGLE RATING
                          Row(
                            children: [
                              const FaIcon(FontAwesomeIcons.solidStar, color: Colors.yellow,),
                              SizedBox(width: width/100,),
                              Text(widget.googleRating)
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}