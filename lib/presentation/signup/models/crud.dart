import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as https;
import 'package:training/core/network/checkinternet.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      // Check if there is an internet connection
      if (await checkinternet()) {
        var response = await https.post(Uri.parse(linkUrl), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> rawAddressBody = jsonDecode(response.body);
          return Right(rawAddressBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } on SocketException {
      // Handle specific network-related exceptions
      return const Left(StatusRequest.offlinefailure);
    } catch (e) {
      // Handle any other exceptions
      print('Unexpected error: $e');
      return const Left(StatusRequest.serverfailure);
    }
  }
}
