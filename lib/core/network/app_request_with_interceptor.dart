// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
// import 'package:mime/mime.dart';
// import 'package:http_parser/http_parser.dart';

// class AppRequestWithInterceptor implements IAppRequest {
//   // final ICacheRepository _cacheRepository;
//   final Map<String, dynamic> _env;
//   AppRequestWithInterceptor(this._cacheRepository, this._env);
//   final AuthInterceptorService _authInterceptor = AuthInterceptorService();

//   // Callback to get AuthCubit instance
//   // AuthCubit? Function()? _getAuthCubit;

//   void setAuthCubitGetter(AuthCubit? Function() getter) {
//     _getAuthCubit = getter;
//   }

//   /// Intercept response and handle 401 errors
//   Future<Response> _interceptResponse(Response response) async {
//     if (response.statusCode == 401) {
//       final authCubit = _getAuthCubit?.call();

//       if (authCubit != null) {
//         await _authInterceptor.handleUnauthorized(authCubit);
//       }
//     }
//     return response;
//   }

//   @override
//   Future<Response> get({
//     String? endPoint,
//     Map<String, dynamic> requestBody = const {},
//     Map<String, String> header = const {},
//   }) async {
//     final token = await _cacheRepository.getUserToken();
//     final String? baseUrl = _env["apiEndPoint"];
//     final headerInfo = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       ...header,
//     };
//     if (token != null) {
//       headerInfo.addAll({'Authorization': 'Bearer $token'});
//     }

//     var request = http.Request('GET', Uri.parse("$baseUrl$endPoint"))
//       ..headers.addAll(headerInfo);

//     request.body = jsonEncode(requestBody);
//     final response = await http.Response.fromStream(await request.send());
//     return await _interceptResponse(response);
//   }

//   @override
//   Future<Response> post({
//     String? endPoint,
//     Map<String, dynamic>? requestBody,
//     Map<String, String> header = const {},
//   }) async {
//     final token = await _cacheRepository.getUserToken();
//     final String? baseUrl = _env["apiEndPoint"];
//     var uri = Uri.parse("$baseUrl$endPoint");
//     final headerInfo = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       ...header,
//     };
//     if (token != null) {
//       headerInfo.addAll({'Authorization': 'Bearer $token'});
//     }

//     final response = await http.post(
//       uri,
//       headers: headerInfo,
//       body: jsonEncode(requestBody),
//     );
//     return await _interceptResponse(response);
//   }

//   @override
//   Future<Response> delete({
//     String? endPoint,
//     Map<String, String> header = const {},
//   }) async {
//     final token = await _cacheRepository.getUserToken();
//     final String? baseUrl = _env["apiEndPoint"];
//     var uri = Uri.parse("$baseUrl$endPoint");
//     final headerInfo = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       ...header,
//     };
//     if (token != null) {
//       headerInfo.addAll({'Authorization': 'Bearer $token'});
//     }
//     final response = await http.delete(uri, headers: headerInfo);
//     return await _interceptResponse(response);
//   }

//   @override
//   Future<Response> put({
//     String? endPoint,
//     Map<String, dynamic>? requestBody,
//     Map<String, String> header = const {},
//   }) async {
//     final token = await _cacheRepository.getUserToken();
//     final String? baseUrl = _env["apiEndPoint"];
//     var uri = Uri.parse("$baseUrl$endPoint");
//     final headerInfo = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       ...header,
//     };
//     if (token != null) {
//       headerInfo.addAll({'Authorization': 'Bearer $token'});
//     }
//     final response = await http.put(
//       uri,
//       headers: headerInfo,
//       body: jsonEncode(requestBody),
//     );
//     return await _interceptResponse(response);
//   }

//   @override
//   Future<Response> patch({
//     String? endPoint,
//     Map<String, dynamic>? requestBody,
//     Map<String, String> header = const {},
//   }) async {
//     final token = await _cacheRepository.getUserToken();
//     final String? baseUrl = _env["apiEndPoint"];
//     var uri = Uri.parse("$baseUrl$endPoint");
//     final headerInfo = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       ...header,
//     };
//     if (token != null) {
//       headerInfo.addAll({'Authorization': 'Bearer $token'});
//     }
//     final response = await http.patch(
//       uri,
//       headers: headerInfo,
//       body: jsonEncode(requestBody),
//     );
//     return await _interceptResponse(response);
//   }

//   @override
//   Future<Response> muiltipartPost({
//     String? endPoint,
//     Map<String, File>? fileRequestBody,
//     Map<String, dynamic>? otherDetailsRequestBody,
//   }) async {
//     // Initialize SharedPreferences
//     final token = await _cacheRepository.getUserToken();

//     // Construct the URL
//     final String? baseUrl = _env["apiEndPoint"];
//     var uri = Uri.parse("$baseUrl$endPoint");

//     // Create a multipart request
//     final request = http.MultipartRequest('POST', uri);

//     // Add request headers
//     if (token != null) {
//       request.headers['Authorization'] = 'Bearer $token';
//     }
//     request.headers['Content-type'] = 'application/json';
//     request.headers['Accept'] = 'application/json';

//     // Add other details to the request
//     otherDetailsRequestBody?.forEach((key, value) {
//       request.fields[key] = value.toString();
//     });

//     // Attach files to the request
//     if (fileRequestBody != null) {
//       for (var entry in fileRequestBody.entries) {
//         final xfile = entry.value;
//         final mimeType = lookupMimeType(xfile.path);
//         if (mimeType == null) {
//           throw Exception('Could not determine MIME type for the file.');
//         }
//         final mimeTypeSplit = mimeType.split('/');
//         final type = mimeTypeSplit[0];
//         final subtype = mimeTypeSplit[1];
//         request.files.add(
//           await http.MultipartFile.fromPath(
//             entry.key,
//             xfile.path,
//             contentType: MediaType(type, subtype),
//           ),
//         );
//       }
//     }

//     // Send the request and await the response
//     final response = await http.Response.fromStream(await request.send());
//     return await _interceptResponse(response);
//   }

//   @override
//   Future<Response> muiltipartPut({
//     String? endPoint,
//     Map<String, dynamic>? fileRequestBody,
//     Map<String, dynamic>? otherDetailsRequestBody,
//   }) async {
//     final token = await _cacheRepository.getUserToken();
//     final String? baseUrl = _env["apiEndPoint"];
//     var uri = Uri.parse("$baseUrl$endPoint");
//     // Create a multipart request
//     final request = http.MultipartRequest('PUT', uri);
//     // Add request headers
//     if (token != null) {
//       request.headers['Authorization'] = 'Bearer $token';
//     }
//     request.headers['Content-Type'] = 'application/json';

//     // Attaching other payload details to  to request object
//     otherDetailsRequestBody?.forEach((key, value) {
//       request.fields[key] = value.toString();
//     });
//     // Attaching files to request object
//     fileRequestBody?.forEach((key, value) async {
//       if (value != null) {
//         request.files.add(await http.MultipartFile.fromPath(key, value));
//       }
//     });

//     final response = await http.Response.fromStream(await request.send());
//     return await _interceptResponse(response);
//   }
// }
