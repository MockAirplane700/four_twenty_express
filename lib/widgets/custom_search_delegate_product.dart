import 'package:flutter/material.dart';
import 'package:four_twenty_express/constants/variables.dart';
import 'package:four_twenty_express/objects/product.dart';
import 'package:four_twenty_express/widgets/custom_search_delegate_tile.dart';

class ProductSearchDelegate extends SearchDelegate {
  final List<Product> products = [];
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
  Widget buildResults(BuildContext context) => products[indexValue].name.toLowerCase().contains(query.toLowerCase()) ?
  SearchDelegateTile(
      leading: Image.network(products[indexValue].images[0], fit: BoxFit.cover,),
      title: products[indexValue].name,
      subtitle: '\$ ${products[indexValue].price.toStringAsFixed(2)}',
      trailing: Container(),
      onPressed: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
      }
  )
      : Center(child: Text('Could not find $query'),);


  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> suggestions = products.where((element) {
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
              subtitle: '\$ ${suggestions[index].price.toStringAsFixed(2)}',
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