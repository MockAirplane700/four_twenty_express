import 'package:flutter/material.dart';
import 'package:four_twenty_express/constants/variables.dart';
import 'package:four_twenty_express/objects/store.dart';
import 'package:four_twenty_express/widgets/custom_search_delegate_tile.dart';

class StoresSearchDelegate extends SearchDelegate{
  final List<Store> stores = [];
  int indexValue = 0;

  @override
  List<Widget>? buildActions(BuildContext context)=> [
    IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear, color: iconColor,)
    )
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back, color: iconColor,)
  );

  @override
  Widget buildResults(BuildContext context) => stores[indexValue].name.toLowerCase().contains(query.toLowerCase()) ?
  SearchDelegateTile(
      leading: Image.network(stores[indexValue].images[0], fit: BoxFit.cover,),
      title: stores[indexValue].name,
      subtitle: stores[indexValue].address[0],
      trailing: Container(),
      onPressed: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
      }
  )
      : Center(child: Text('Could not find $query'),);


  @override
  Widget buildSuggestions(BuildContext context) {
    List<Store> suggestions = stores.where((element) {
      final elementNameComparison = element.name.toLowerCase();
      final input = query.toLowerCase();
      return elementNameComparison.contains(input);
    }).toList();

    return ListView.builder(
      itemBuilder: (context , index) {
        if (suggestions.isEmpty) {
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Text('Data not currently available please wait')
            ],
          ),);
        }else{
          SearchDelegateTile(
              leading: Image.network(suggestions[index].images[0], fit: BoxFit.cover,),
              title: suggestions[index].name,
              subtitle: suggestions[index].address[0],
              trailing: Container(),
              onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
              }
          );
        }//end if-else
      },
      itemCount: suggestions.length,
    );
  }

}//end class