// import'package:flutter/material.dart';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sidarth_new/urls.dart';
import 'package:http_parser/http_parser.dart' as mime;

class FileAttachmentService {
  Future<int> sendFileToSummons(ModelForSummonsFileAttachment data) async {
    final request = http.MultipartRequest('POST', Uri.parse(attachFile()));
    request.files.add(await http.MultipartFile.fromPath("photo", data.photo.path,
        contentType: mime.MediaType('image', 'jpeg')));
    request.fields['summons_id']=data.summonsId;    
    final response = await request.send();
    if (response.statusCode == 200) {
      return 200;
    } else {
      return response.statusCode ;
    }
  }
}

class ModelForSummonsFileAttachment {
  String summonsId;
  File photo;
  ModelForSummonsFileAttachment({required this.photo, required this.summonsId});

  Map<String, String> toJson() {
    return {'summons_id': summonsId, 'photo': photo.path};
  }
}
