import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../constants/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../BaseClient.dart';
import '../BaseService.dart';


class RestClient implements BaseService {

  var dioInstance = BaseNetworkClient();

  @override
  Future get({required String url, Map<String, dynamic>? params}) async {
    try {
      final response = await dioInstance
          .getNetworkClient
          .get(url, queryParameters: params);
      return response.data;
    } catch (e) {
      if (e is DioError) {
        if (e.error is LogoutException) {
          throw LogoutException(e.error.toString());
        } else {
          Map<String, dynamic> errorResponse = jsonDecode(e.response?.data ?? {});
          if(errorResponse.containsKey('message')) {
            final String message = errorResponse['message'];
            throw ServerException(message);
          }
          throw ServerException(e.message);
        }
      }
      if (kDebugMode) {
        print(e);
      }
      throw ServerException(Constants.someThingWentWrong);
    }
  }


  @override
  Future post(
      {required String url, required Map<String, dynamic> request,Map<String, dynamic>? params}) async {
    try {
      final response = await dioInstance.getNetworkClient.post(
          url,
          data: request,
          queryParameters: params
      );
      return response.data;
    } catch (e) {
      {if (e is DioError) {
        if (e.error is LogoutException) {
          throw LogoutException(e.error.toString());
        } else {
          Map<String, dynamic> errorResponse = jsonDecode(e.response?.data);
          final String message = errorResponse['message'] == null  ? null :
          errorResponse['message'];
          throw ServerException(e.message);
        }
      }
      if (kDebugMode) {
        print(e.toString());
      }
      throw ServerException(Constants.someThingWentWrong);
      }
    }
  }

  @override
  Future put(
      {required String url, required Map<String, dynamic> request}) async {
    try {
      final response = await dioInstance
          .getNetworkClient
          .put(url, data: request);
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw ServerException(Constants.someThingWentWrong);
    }
  }

  @override
  Future delete(
      {required String url, required Map<String, dynamic> request}) async {
    try {
      final response = await dioInstance
          .getNetworkClient
          .delete(url, data: request);
      return response.data;
    } catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
    throw ServerException(Constants.someThingWentWrong);
  }

}


//import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:tradebit_app/constants/constants.dart';
// import 'package:tradebit_app/core/error/exceptions.dart';
// import 'package:tradebit_app/data/datasource/remote/services/BaseClient.dart';
// import 'package:tradebit_app/data/datasource/remote/services/BaseService.dart';
//
// class RestClient implements BaseService {
//
//   var dioInstance = BaseNetworkClient();
//
//   @override
//   Future get({required String url, Map<String, dynamic>? params}) async {
//     try {
//       final response = await dioInstance
//           .getNetworkClient
//           .get(url, queryParameters: params);
//       return response.data;
//     } catch (e) {
//       if (e is DioError) {
//         if (e.error is LogoutException) {
//           throw LogoutException(e.error.toString());
//         } else {
//           Map<String, dynamic> errorResponse = jsonDecode(e.response?.data ?? {});
//           if(errorResponse.containsKey('message')) {
//             final String message = errorResponse['message'];
//             throw ServerException(message);
//           }
//           throw ServerException(e.message);
//         }
//       }
//       if (kDebugMode) {
//         print(e);
//       }
//       throw ServerException(Constants.someThingWentWrong);
//     }
//   }
//
//
//   @override
//   Future post(
//       {required String url, required Map<String, dynamic> request,Map<String, dynamic>? params}) async {
//     try {
//       final response = await dioInstance.getNetworkClient.post(
//           url,
//           data: request,
//           queryParameters: params
//       );
//       return response.data;
//     } catch (e) {
//       {if (e is DioError) {
//           if (e.error is LogoutException) {
//             throw LogoutException(e.error.toString());
//           } else {
//             Map<String, dynamic> errorResponse = jsonDecode(e.response?.data);
//             final String message = errorResponse['message'] == null  ? null :
//             errorResponse['message'];
//             throw ServerException(e.message);
//           }
//         }
//         if (kDebugMode) {
//           print(e.toString());
//         }
//         throw ServerException(Constants.someThingWentWrong);
//       }
//     }
//   }
//
//   @override
//   Future put(
//       {required String url, required Map<String, dynamic> request}) async {
//     try {
//       final response = await dioInstance
//           .getNetworkClient
//           .put(url, data: request);
//       return response.data;
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       throw ServerException(Constants.someThingWentWrong);
//     }
//   }
//
//   @override
//   Future delete(
//       {required String url, required Map<String, dynamic> request}) async {
//     try {
//       final response = await dioInstance
//           .getNetworkClient
//           .delete(url, data: request);
//       return response.data;
//     } catch(e){
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     throw ServerException(Constants.someThingWentWrong);
//   }
//
// }