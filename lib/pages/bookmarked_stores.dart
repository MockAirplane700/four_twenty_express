import 'package:flutter/material.dart';
import 'package:four_twenty_express/constants/variables.dart';
import 'package:four_twenty_express/logic/stores.dart';
import 'package:four_twenty_express/objects/store.dart';
import 'package:four_twenty_express/pages/store_display.dart';
import 'package:four_twenty_express/widgets/custom_store_card.dart';

class BookmarkedStores extends StatefulWidget {
  const BookmarkedStores({Key? key}) : super(key: key);

  @override
  State<BookmarkedStores> createState() => _BookmarkedStoresState();
}

class _BookmarkedStoresState extends State<BookmarkedStores> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked stores', style: generalTextStyle,),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
      ),
      backgroundColor: appBackgroundColor,
      body: FutureBuilder(
          builder: (context, snapshot){
            if (snapshot.hasData){
              List<Store> stores = snapshot.data as List<Store>;
              if (stores.isNotEmpty){
                return ListView.builder(
                    itemBuilder: (context, index){
                      return StoresDashboardCard(
                          store: stores[index], banner: stores[index].images[0], thumbnail: stores[index].images[0],
                          name: stores[index].name, duration: '20 mins', fee: '2.99',
                          googleRating: stores[index].rating,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> StoreDisplayPage(store: stores[index])))
                      );
                    },
                  itemCount: stores.length,
                );
              }else{
                return const Center(child: Text('There are no bookmarked stores'),);
              }//end if-else
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }//end if-else
          },
        future: Stores.getStoreBookmarks(),
      ),
    );
  }
}
