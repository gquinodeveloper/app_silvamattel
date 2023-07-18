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

  void addValueMap({
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

    //PREGUNTA 1
    addValueMap(
      key: "F01",
      fileName: file["F01_NAME"],
      value: file["F01"],
      /* value: MultipartFile.fromFile(
        (file["F01"] as File).path,
        filename: file["F01_NAME"],
      ), */
    );
    addValueMap(
      key: "F011",
      fileName: file["F011_NAME"],
      value: file["F011_NAME"],
      /* value: await MultipartFile.fromFile(
        (file["F011"] as File).path,
        filename: file["F011_NAME"],
      ), */
    );
    //PREGUNTA 2
    addValueMap(
      key: "F02",
      fileName: file["F02_NAME"],
      value: file["F02"],
      /* value: await MultipartFile.fromFile(
        (file["F02"] as File).path,
        filename: file["F02_NAME"],
      ), */
    );
    addValueMap(
      key: "F021",
      fileName: file["F021_NAME"],
      value: file["F021"],
      /* value: await MultipartFile.fromFile(
        (file["F021"] as File).path,
        filename: file["F021_NAME"],
      ), */
    );

    //Definir imagen
    FormData formData = FormData.fromMap(fromMapFile);

    /* FormData formData = FormData.fromMap({
      
      /* //PREGUNTA 1
      'F01': await MultipartFile.fromFile(
        (file["F01"] as File).path,
        filename: file["F01_NAME"],
      ),
      'F011': await MultipartFile.fromFile(
        (file["F011"] as File).path,
        filename: file["F011_NAME"],
      ),

      //PREGUNTA 2
      'F02': await MultipartFile.fromFile(
        (file["F02"] as File).path,
        filename: file["F02_NAME"],
      ),
      'F021': await MultipartFile.fromFile(
        (file["F021"] as File).path,
        filename: file["F021_NAME"],
      ), */

      /* //PREGUNTA 3
      'F03': await MultipartFile.fromFile(
        (file["F03"] as File).path,
        filename: file["F03_NAME"],
      ),
      'F031': await MultipartFile.fromFile(
        (file["F031"] as File).path,
        filename: file["F031_NAME"],
      ),
      //PREGUNTA 4
      'F04': await MultipartFile.fromFile(
        (file["F04"] as File).path,
        filename: file["F04_NAME"],
      ),
      'F041': await MultipartFile.fromFile(
        (file["F041"] as File).path,
        filename: file["F041_NAME"],
      ),
      //PREGUNTA 5
      'F05': await MultipartFile.fromFile(
        (file["F05"] as File).path,
        filename: file["F05_NAME"],
      ),
      'F051': await MultipartFile.fromFile(
        (file["F051"] as File).path,
        filename: file["F051_NAME"],
      ),
      //PREGUNTA 6
      'F06': await MultipartFile.fromFile(
        (file["F06"] as File).path,
        filename: file["F06_NAME"],
      ),
      'F061': await MultipartFile.fromFile(
        (file["F061"] as File).path,
        filename: file["F061_NAME"],
      ),
      //PREGUNTA 7
      'F07': await MultipartFile.fromFile(
        (file["F07"] as File).path,
        filename: file["F07_NAME"],
      ),
      'F071': await MultipartFile.fromFile(
        (file["F071"] as File).path,
        filename: file["F071_NAME"],
      ), */
    }); */

    final response = await dio.post(
      'http://www.sivalaplicativos.com/matteldesabastesSubirImagen',
      data: formData,
    );
    return "";
  }
}
