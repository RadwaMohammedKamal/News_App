import 'package:dio/dio.dart';
import 'package:news_app/models/article_modlel.dart';
class NewsService {
  final Dio dio;

  NewsService(this.dio);

 Future<List<ArticleModel>> getNews() async {
  try {
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=f7a7259f19124b68a1da146643b99410&category=general');
    Map<String, dynamic>jsonData = response.data;

    List<dynamic> articles = jsonData["articles"];
//this is the list that we need to deal with
    List<ArticleModel> articleslist = [];

    for (var article in articles) {
      ArticleModel articleModel = ArticleModel(
          image: article["urlToImage"],
          title: article["title"],
          subtitle: article["description"]
      );
      articleslist.add(articleModel);
    }

    print(articleslist);
    return articleslist;
  }catch(e){
    return[];
  }
  }
}
// for(var article in articles)
//  {  print(article["author"]);}
//   }


// import 'package:dio/dio.dart';
// import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
// import 'end_points.dart';
//
// //Dio Helper That's Connect and Talk to API.
// class DioHelper {
//   static late Dio dio;
//
//   //Here The Initialize of Dio and Start Connect to API Using baseUrl.
//   static init() {
//     dio = Dio(
//       BaseOptions(
//         //Here the URL of API.
//         baseUrl: baseUrl,
//         receiveDataWhenStatusError: true,
//         //Here we Put The Headers Needed in The API.
//         headers: {
//           'Content-Type': 'application/json',
//           //'lang':'en'
//         },
//       ),
//     );
//     dio.interceptors.add(CurlLoggerDioInterceptor(
//       printOnSuccess: true,
//     ));
//   }
//
//   //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
//   static Future<Response> getData({
//     required String url,
//     Map<String, dynamic>? queryParameters,
//     ProgressCallback? onReceiveProgress,
//     String? token,
//   }) async {
//     try {
//       print("token $token");
//
//       dio.options.headers = {
//         'Content-Type': 'application/json',
//         //'Token': token,
//         // 'Authorization': token ,
//         'device_token': token ?? '',
//       };
//       final Response response = await dio.get(
//         baseUrl2+url,
//         queryParameters: queryParameters,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   //This Function that's Used To Post Data to API based on URL(End Points) and Headers.
//   // login register task
//   static Future<Response> postData({
//     required String url,
//     required Map<String, dynamic> data,
//     String? token,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       print("dio.options $url");
//
//       dio.options.headers = {
//         'Content-Type': 'application/json',
//         //'device_token': token ?? '',
//         'Authorization': token,
//       };
//       final Response response = await dio.post(
//         baseUrl+url,
//         data: data,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       print("response:$response");
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
//   static Future<Response> putData({
//     required String url,
//     Map<String, dynamic>? data,
//     required String? token,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       dio.options.headers = {
//         'Content-Type': 'application/json',
//         'Authorization': token,
//       };
//       final Response response = await dio.put(
//         baseUrl+ url,
//         data: data,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
//   static Future<Response> patchData({
//     required String url,
//     required Map<String, dynamic> data,
//     required String token,
//     bool files = false,
//   }) async {
//     dio.options.headers = {
//       'Content-Type': 'application/json',
//       'Authorization': token,
//       //'Content-Type': 'application/json',
//     };
//     return await dio.patch(
//       baseUrl+url,
//       data: data,
//     );
//   }
//
//   static Future<Response> deleteData({
//     required String url,
//     Map<String, dynamic>? data,
//     required String token,
//   }) async {
//     dio.options.headers = {
//       'Content-Type': 'application/json',
//       'Authorization': token,
//     };
//     try {
//       final Response response = await dio.delete(
//         baseUrl+ url,
//         data: data,
//       );
//       return response.data;
//     } catch (e) {
//       rethrow;
//     }
//   } }