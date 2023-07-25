import 'dart:io';

import 'package:appsivalmattel/app/data/models/resquest/request_matteldesabaste_model.dart';
import 'package:dio/dio.dart';

class MatteldesabasteProvider {
  Map<String, dynamic> fromMapFile = {};

  Future<String> save(RequestMatteldesabasteModel request) async {
    final dio = Dio();
    final response = await dio.post(
      'http://www.sivalaplicativos.com/matteldesabastesSubir',
      data: request.toMap(),
    );
    print(response.data);
    return "";
  }

  Future<void> addValueMap({
    required String key,
    required String fileName,
    required dynamic value,
  }) async {
    if (fileName.isNotEmpty) {
      fromMapFile[key] = await MultipartFile.fromFile(
        (value as File).path,
        filename: fileName,
      );
    }
  }

  Future<String> uploadFile(Map<String, dynamic> file) async {
    final dio = Dio();
    fromMapFile.clear();
    //PREGUNTA 1
    await addValueMap(
      key: "F01",
      fileName: file["F01_NAME"],
      value: file["F01"],
    );
    await addValueMap(
      key: "F011",
      fileName: file["F011_NAME"],
      value: file["F011"],
    );

    //PREGUNTA 2
    await addValueMap(
      key: "F02",
      fileName: file["F02_NAME"],
      value: file["F02"],
    );
    await addValueMap(
      key: "F021",
      fileName: file["F021_NAME"],
      value: file["F021"],
    );

    //Definir imagen
    FormData formData = FormData.fromMap(fromMapFile);
    final response = await dio.post(
      'http://www.sivalaplicativos.com/matteldesabastesSubirImagen',
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
        followRedirects: false,
      ),
    );
    return "";
  }
}
