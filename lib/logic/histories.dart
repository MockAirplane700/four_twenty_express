import 'package:four_twenty_express/objects/history.dart';
import 'package:four_twenty_express/persistence/sql_database.dart';

class Histories {
  //  ADD ITEM TO HISTORY
  static addItemToHistory(History history) async  {
    return await SQLDatabase.insertHistory(history);
  }// end method
}//end class