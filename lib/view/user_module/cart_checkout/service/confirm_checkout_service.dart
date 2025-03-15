import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jewellery_app/view/constants/urls.dart';
import 'package:jewellery_app/view/user_module/checkout_screen/model/confirm_checkout_model.dart';

Future<ConfirmCheckoutModel> confirmCheckoutScreenService({
  required String visit_date,
  required String visit_time,
}) async {
  try {
   
    Map<String, dynamic> param = {
      "user": 18.toString(),
      "visit_date": visit_date, 
      "visit_time": visit_time, 
    
    };

    final resp = await http.post(
      Uri.parse(UserUrl.cart_checkout_details),
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );

    if (resp.statusCode == 201) {
      final dynamic decoded = jsonDecode(resp.body);
      final response = ConfirmCheckoutModel.fromJson(decoded);
      return response;
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
      throw Exception(
        '${errorResponse['message'] ?? 'Unknown error'}',
      );
    }
  } on SocketException {
    throw Exception('No Internet connection');
  } on HttpException {
    throw Exception('Server error');
  } on FormatException {
    throw Exception('Bad response format');
  } catch (e) {
    throw Exception('Unexpected error: ${e.toString()}');
  }
}
