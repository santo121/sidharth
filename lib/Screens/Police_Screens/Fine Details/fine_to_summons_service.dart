
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart'as http;
import 'package:sidarth_new/urls.dart';


class FineToSummonsModal {
  String? data;
  String? fineId;
  int? statusCode;

  FineToSummonsModal.statusCode(this.statusCode);

  Map<String,String> toJson(){
    return{'fine_id':fineId.toString()};
  }


  FineToSummonsModal({this.fineId});

  FineToSummonsModal.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

}



class FineToSummons{

  Future<FineToSummonsModal>sentFineToSummons(FineToSummonsModal data)async{
    final response = await http.post(Uri.parse(fineToSummons()),body:data.toJson());

    try {
      switch (response.statusCode) {
        case 200:
          return FineToSummonsModal.fromJson(jsonDecode(response.body));
          
        default : FineToSummonsModal.statusCode(response.statusCode);
        
      }
    } catch (e) {
      log(e.toString());
    }
    return FineToSummonsModal.statusCode(response.statusCode);
  }

}