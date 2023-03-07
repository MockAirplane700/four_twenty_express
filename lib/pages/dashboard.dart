import 'package:flutter/material.dart';
import 'package:four_twenty_express/constants/variables.dart';
import 'package:four_twenty_express/logic/stores.dart';
import 'package:four_twenty_express/objects/store.dart';
import 'package:four_twenty_express/pages/store_display.dart';
import 'package:four_twenty_express/widgets/custom_carasoul_slider.dart';
import 'package:four_twenty_express/widgets/custom_store_card.dart';
///-----------------------------------------------------------------------------
///   DASHBOARD DESIGNED AFTER SKIP AND DOORDASH -
///   BANNER SHOWS CURRENT HIGHLIGHTED PRODUCTS
///   DISPLAY STORES IN THE AREA
///-----------------------------------------------------------------------------


class HomeDashBoard extends StatefulWidget {
  const HomeDashBoard({Key? key}) : super(key: key);

  @override
  State<HomeDashBoard> createState() => _HomeDashBoardState();
}

class _HomeDashBoardState extends State<HomeDashBoard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(
        title: const Text('Dashboard', style: generalTextStyle,),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
      ),
      backgroundColor: appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  BANNER DISPLAY
           const BannerSlider(images: [
              'https://images.dutchie.com/ebb3fdf7de43bccff2a39b053c2ea745?auto=format&fit=fill&fill=solid&fillColor=%23fff&ixlib=react-9.0.2&w=1074',
             'https://images.dutchie.com/flower-stock-12-v1.jpg?auto=format&fit=fill&fill=solid&fillColor=%23fff&__typename=ImgixSettings&ixlib=react-9.0.2&h=344&w=344&q=75&dpr=1'
            ]),
            //  LIST VIEW OF AVAILABLE STORES
            SizedBox(height: height, child: FutureBuilder(
                builder: (context, snapshot){
                  if (snapshot.hasData){
                    List<Store> stores = snapshot.data as List<Store>;
                    if (stores.isNotEmpty){
                      return ListView.builder(
                        itemBuilder: (context , index) {
                          return StoresDashboardCard(
                              store: stores[index], banner: stores[index].images[0], thumbnail: stores[index].images[0],
                              name: stores[index].name, duration: '20 mins', fee: '2.99',
                              googleRating: stores[index].rating,
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> StoreDisplayPage(store: stores[index])))
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      );
                    }else{
                      return const Center(child: Text('There are currently no listed stores'),);
                    }//end if-else
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }//end if-else
                },
              future: Stores.getSampleStores(),
            ),)
          ],
        ),
      ),
    );
  }
}
