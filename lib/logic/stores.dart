import 'package:four_twenty_express/objects/store.dart';
import 'package:four_twenty_express/persistence/server_based_database.dart';
import 'package:four_twenty_express/persistence/sql_database.dart';

class Stores {
  //  GET STORES
  static Future<List<Store>> getStores() async {
    return ServerBasedDatabase.getStores();
  }//end get stores

  static Future<List<Store>> getSampleStores() async {
    return await Future(() {
      return [
        Store(
            id: '13', name: 'Star Cannabis co ',
            description: 'STAR BUDS is YOUR friendly neighbourhood cannabis store.     We provide a comfortable setting to learn about and purchase cannabis & accessories. Our carefully curated selection has something for everyone, from the occasional user to the daily consumer.  We are home to a top-notch selection of cannabis flower, plus a wide array of cannabis concentrates, edibles and more!  Check out our product selection in Ontario, Manitoba and Alberta!',
            images: [
              'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fstar-logo.png?alt=media&token=20ce4ec4-716a-4153-b88b-bef45245c0cc',
              'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbanner-star.png?alt=media&token=70009ab4-24ec-4db5-ad79-6ee09d482d23',
              'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2F2022-02-12.png?alt=media&token=8515d13d-7316-47f6-9b25-74d5b070f3f5'
            ],

            products: ['0' , '1' , '2'],
            address: ['1566 Pembina Hwy, Winnipeg, MB R3T 2E9'],
            website: 'https://www.starbuds.co/', phone: '4313343047',
            email: 'sizibamthandazo@yahoo.com', rating: '4.5'
        ),
        Store(
            id: '1', name: 'Star Cannabis co ',
            description: 'STAR BUDS is YOUR friendly neighbourhood cannabis store.     We provide a comfortable setting to learn about and purchase cannabis & accessories. Our carefully curated selection has something for everyone, from the occasional user to the daily consumer.  We are home to a top-notch selection of cannabis flower, plus a wide array of cannabis concentrates, edibles and more!  Check out our product selection in Ontario, Manitoba and Alberta!',
            images: [
              'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fstar-logo.png?alt=media&token=20ce4ec4-716a-4153-b88b-bef45245c0cc',
              'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbanner-star.png?alt=media&token=70009ab4-24ec-4db5-ad79-6ee09d482d23',
              'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2F2022-02-12.png?alt=media&token=8515d13d-7316-47f6-9b25-74d5b070f3f5'
            ],

            products: ['0' , '1' , '2'],
            address: ['1566 Pembina Hwy, Winnipeg, MB R3T 2E9'],
            website: 'https://www.starbuds.co/', phone: '4313343047',
            email: 'sizibamthandazo@yahoo.com', rating: '4.5'
        ),
        Store(
            id: '2', name: 'Star Cannabis co ',
            description: 'STAR BUDS is YOUR friendly neighbourhood cannabis store.     We provide a comfortable setting to learn about and purchase cannabis & accessories. Our carefully curated selection has something for everyone, from the occasional user to the daily consumer.  We are home to a top-notch selection of cannabis flower, plus a wide array of cannabis concentrates, edibles and more!  Check out our product selection in Ontario, Manitoba and Alberta!',
            images: [
              'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fstar-logo.png?alt=media&token=20ce4ec4-716a-4153-b88b-bef45245c0cc',
              'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbanner-star.png?alt=media&token=70009ab4-24ec-4db5-ad79-6ee09d482d23',
              'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2F2022-02-12.png?alt=media&token=8515d13d-7316-47f6-9b25-74d5b070f3f5'
            ],

            products: ['0' , '1' , '2'],
            address: ['1566 Pembina Hwy, Winnipeg, MB R3T 2E9'],
            website: 'https://www.starbuds.co/', phone: '4313343047',
            email: 'sizibamthandazo@yahoo.com', rating: '4.5'
        ),
        Store(
            id: '3', name: 'Star Cannabis co ',
            description: 'STAR BUDS is YOUR friendly neighbourhood cannabis store.     We provide a comfortable setting to learn about and purchase cannabis & accessories. Our carefully curated selection has something for everyone, from the occasional user to the daily consumer.  We are home to a top-notch selection of cannabis flower, plus a wide array of cannabis concentrates, edibles and more!  Check out our product selection in Ontario, Manitoba and Alberta!',
            images: [
              'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fstar-logo.png?alt=media&token=20ce4ec4-716a-4153-b88b-bef45245c0cc',
              'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbanner-star.png?alt=media&token=70009ab4-24ec-4db5-ad79-6ee09d482d23',
              'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2F2022-02-12.png?alt=media&token=8515d13d-7316-47f6-9b25-74d5b070f3f5'
            ],

            products: ['0' , '1' , '2'],
            address: ['1566 Pembina Hwy, Winnipeg, MB R3T 2E9'],
            website: 'https://www.starbuds.co/', phone: '4313343047',
            email: 'sizibamthandazo@yahoo.com', rating: '4.5'
        ),
      ];
    });
  }//end get sample stores

  //  GET STORE
  static Future<Store> getStore(String id) async{
    return ServerBasedDatabase.getStore(id);
  }//end get store

  static Future<Store> getSampleStore(String id) async{
    return Future(() {
      return Store(
          id: '0', name: 'Star Cannabis co ',
          description: 'STAR BUDS is YOUR friendly neighbourhood cannabis store.     We provide a comfortable setting to learn about and purchase cannabis & accessories. Our carefully curated selection has something for everyone, from the occasional user to the daily consumer.  We are home to a top-notch selection of cannabis flower, plus a wide array of cannabis concentrates, edibles and more!  Check out our product selection in Ontario, Manitoba and Alberta!',
          images: [
            'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fstar-logo.png?alt=media&token=20ce4ec4-716a-4153-b88b-bef45245c0cc',
            'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbanner-star.png?alt=media&token=70009ab4-24ec-4db5-ad79-6ee09d482d23',
            'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2F2022-02-12.png?alt=media&token=8515d13d-7316-47f6-9b25-74d5b070f3f5'
          ],

          products: ['0' , '1' , '2'],
          address: ['1566 Pembina Hwy, Winnipeg, MB R3T 2E9'],
          website: 'https://www.starbuds.co/', phone: '4313343047',
          email: 'sizibamthandazo@yahoo.com', rating: '4.5'
      );
    });
  }//end get sample

  //  BOOKMARK STORE
  static bookmarkStore(Store store) async {
    await SQLDatabase.insertStore(store);
  }
  //  REMOVE BOOKMARKED STORE
  static removeBookmarkedStore(Store store) async {
    await SQLDatabase.deleteStore(store);
  }//end remove bookmarked store

  //  GET STORE BOOKMARKS
  static Future<List<Store>> getStoreBookmarks() async {
    return await SQLDatabase.getStores();
  }

  //  CHECK IF STORE IS ALREADY IN THE DATABASE
  static Future<bool> isBookmarked(Store store) async{
    List<Store> stores = await getStoreBookmarks();
    bool result = false;
    for (var temp in stores) {
      int storeId = int.parse(temp.id);
      int storeTempId = int.parse(store.id);
      if ( storeId == storeTempId ){
        return true;
      }
    }//end for loop
    return result;
  }//end is bookmarked
}//end stores