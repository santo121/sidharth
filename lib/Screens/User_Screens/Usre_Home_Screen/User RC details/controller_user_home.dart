import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:sidarth_new/Functions/storage.dart';
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/list%20of%20summons%20service/user_summons_list.dart';

class UserHomeController with ChangeNotifier {
  UserSummonsListService rcSummons = UserSummonsListService();
  int count = 0;
  final val = LocalStorage.getNotificationIndex() ?? 0;
  void futMethod(userId) async {
    await rcSummons.getUserSummonsList(userId).then((value) {
      count = value.data!.length - val;
    });
    log(count.toString());
    notifyListeners();

  }
}
