import 'package:four_twenty_express/objects/product.dart';
import 'package:four_twenty_express/persistence/server_based_database.dart';

class Products {
  //  GET PRODUCTS
  static Future<List<Product>> getProducts() async {
    return await ServerBasedDatabase.getProducts();
  }//end get products

  static Future<List<Product>> getSampleProducts() async {
    return await Future(() {
      return [
        Product(
            id: '0', name: 'The Green Organic Dutchman | Organic Sugar Bush', type: 'bud',
            description: 'Organic Sugar Bush is a high potency Sativa that has a notably floral and sweet scent, reminiscent of ripe melon and rosewood.',
            images: ['https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbud-1.png?alt=media&token=633fc5dd-9c11-4b2c-bed4-1a4cced418af'],
            price: 44.50,
            thc: '33.33%',
            cbd: '> 1%',
            strain: 'Organic Sugar Bush ',
            supplier: 'THE GREEN ORGANIC DUTCHMAN',
            sizes: ['3.5'],
            effects: ['Energetic', 'Happy', 'Creative', 'Focused', 'Inspired']
        ),
        Product(
          id: '1', name: '420 Science | Rez Block Solution', type: 'accessory',
          description: 'There’s something about a water pipe coated in resin that just makes us feel dirty. That’s why we change our water every day. But that’s not all. Not by a long shot. We also use RezBlock. Just a few drops help prevent the resin from building up. It keeps our pieces clean, and our hits fresh and delicious.When you add RezBlock to your water, it prevents the resins from sticking to the glass and instead they float in the water allowing you to pour out that gunk along with the ash and other particulates you don\'t want. RezBlock is completely organic, which means you\'ll need to change your water out regularly. With RezBlock and regular water changes, you\'ll see drastically less buildup in your bong.',
          images: ['https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Faccessory-1.png?alt=media&token=774863c7-d3cf-4a4a-87c8-a40c5a283e67'],
          price: 2.50,
          sizes: ['3ml'],
        ),
        Product(
            id: '2', name: 'The Green Organic Dutchman | Organic Sugar Bush', type: 'bud',
            description: 'Organic Sugar Bush is a high potency Sativa that has a notably floral and sweet scent, reminiscent of ripe melon and rosewood.',
            images: ['https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbud-1.png?alt=media&token=633fc5dd-9c11-4b2c-bed4-1a4cced418af'],
            price: 44.50,
            thc: '33.33%',
            cbd: '> 1%',
            strain: 'Organic Sugar Bush ',
            supplier: 'THE GREEN ORGANIC DUTCHMAN',
            sizes: ['3.5'],
            effects: ['Energetic', 'Happy', 'Creative', 'Focused', 'Inspired']
        ),
        Product(
            id: '3', name: 'The Green Organic Dutchman | Organic Sugar Bush', type: 'bud',
            description: 'Organic Sugar Bush is a high potency Sativa that has a notably floral and sweet scent, reminiscent of ripe melon and rosewood.',
            images: ['https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbud-1.png?alt=media&token=633fc5dd-9c11-4b2c-bed4-1a4cced418af'],
            price: 44.50,
            thc: '33.33%',
            cbd: '> 1%',
            strain: 'Organic Sugar Bush ',
            supplier: 'THE GREEN ORGANIC DUTCHMAN',
            sizes: ['3.5'],
            effects: ['Energetic', 'Happy', 'Creative', 'Focused', 'Inspired']
        ),
        Product(
          id: '4', name: '420 Science | Rez Block Solution', type: 'accessory',
          description: 'There’s something about a water pipe coated in resin that just makes us feel dirty. That’s why we change our water every day. But that’s not all. Not by a long shot. We also use RezBlock. Just a few drops help prevent the resin from building up. It keeps our pieces clean, and our hits fresh and delicious.When you add RezBlock to your water, it prevents the resins from sticking to the glass and instead they float in the water allowing you to pour out that gunk along with the ash and other particulates you don\'t want. RezBlock is completely organic, which means you\'ll need to change your water out regularly. With RezBlock and regular water changes, you\'ll see drastically less buildup in your bong.',
          images: ['https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Faccessory-1.png?alt=media&token=774863c7-d3cf-4a4a-87c8-a40c5a283e67'],
          price: 2.50,
          sizes: ['3ml'],
        )
      ];
    });
  }//end get sample products

  //  GET PRODUCT
  static Future<Product> getProduct(String id) async {
    return await ServerBasedDatabase.getProduct(id);
  }//end get product

  static Future<Product> getSampleProduct(String id) async {

    List<Product> list = [
      Product(
          id: '0', name: 'Organic Sugar Bush', type: 'flower',
          description: 'Organic Sugar Bush is a high potency Sativa that has a notably floral and sweet scent, reminiscent of ripe melon and rosewood.',
          images: ['https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbud-1.png?alt=media&token=633fc5dd-9c11-4b2c-bed4-1a4cced418af'],
          price: 44.50,
          thc: '33.33%',
          cbd: '> 1%',
          strain: 'Organic Sugar Bush ',
          supplier: 'THE GREEN ORGANIC DUTCHMAN',
          sizes: ['3.5'],
          effects: ['Energetic', 'Happy', 'Creative', 'Focused', 'Inspired'],
        strainType: 'Sativa'
      ),
      Product(
          id: '1', name: 'Organic Sugar Bush', type: 'flower',
          description: 'Organic Sugar Bush is a high potency Sativa that has a notably floral and sweet scent, reminiscent of ripe melon and rosewood.',
          images: ['https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbud-1.png?alt=media&token=633fc5dd-9c11-4b2c-bed4-1a4cced418af'],
          price: 44.50,
          thc: '33.33%',
          cbd: '> 1%',
          strain: 'Organic Sugar Bush ',
          supplier: 'THE GREEN ORGANIC DUTCHMAN',
          sizes: ['3.5'],
          effects: ['Energetic', 'Happy', 'Creative', 'Focused', 'Inspired'],
          strainType: 'Indica'
      ),
      Product(
          id: '2', name: 'Organic Sugar Bush', type: 'edibles',
          description: 'Organic Sugar Bush is a high potency Sativa that has a notably floral and sweet scent, reminiscent of ripe melon and rosewood.',
          images: ['https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbud-1.png?alt=media&token=633fc5dd-9c11-4b2c-bed4-1a4cced418af'],
          price: 44.50,
          thc: '33.33%',
          cbd: '> 1%',
          strain: 'Organic Sugar Bush ',
          supplier: 'THE GREEN ORGANIC DUTCHMAN',
          sizes: ['3.5'],
          effects: ['Energetic', 'Happy', 'Creative', 'Focused', 'Inspired'],
          strainType: 'Hybrid'
      ),
    ];
    for (var element in list) {
      if(element.id.contains(id)){
        return await Future(() {
          return element;
        });
      }
    }//end for loop
    return await Future(() {
      return Product(
        id: '1', name: '420 Science | Rez Block Solution', type: 'accessory',
        description: 'There’s something about a water pipe coated in resin that just makes us feel dirty. That’s why we change our water every day. But that’s not all. Not by a long shot. We also use RezBlock. Just a few drops help prevent the resin from building up. It keeps our pieces clean, and our hits fresh and delicious.When you add RezBlock to your water, it prevents the resins from sticking to the glass and instead they float in the water allowing you to pour out that gunk along with the ash and other particulates you don\'t want. RezBlock is completely organic, which means you\'ll need to change your water out regularly. With RezBlock and regular water changes, you\'ll see drastically less buildup in your bong.',
        images: ['https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Faccessory-1.png?alt=media&token=774863c7-d3cf-4a4a-87c8-a40c5a283e67'],
        price: 2.50,
        sizes: ['3ml'],
      );
    });
  }//end get sample product

  static Future<Map<String,dynamic>> getProductByType(List products) async {
    List flower = [];
    List edibles = [];
    List extracts = [];
    List preRolls = [];
    List accessories = [];
    Map<String,dynamic> results = {};

    for (var product in products) {
      Product tempProduct = await getSampleProduct(product);
      String type = tempProduct.type;
      if (type.contains('flower')){
        flower.add(tempProduct);
      } else if (type.contains('edibles')){
        edibles.add(tempProduct);
      } else if (type.contains('extracts')){
        extracts.add(tempProduct);
      } else if (type.contains('preRolls')) {
        preRolls.add(tempProduct);
      }else{
        accessories.add(tempProduct);
      }//end if -else
    }//end for loop

    results = {
      //  FLOWER
      'FLOWER' : flower,
      //  EDIBLES
      'EDIBLES': edibles,
      //  EXTRACTS
      'EXTRACTS': extracts,
      //  PRE-ROLLS
      'PRE-ROLLS': preRolls,
      //  ACCESSORIES
      'ACCESSORIES' : accessories
    };
    return Future(() => results);
  }//end get product by type
}//end products