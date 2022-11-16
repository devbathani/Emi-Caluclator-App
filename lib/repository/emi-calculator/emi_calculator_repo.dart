import 'dart:developer';

import 'package:dio/dio.dart';

class EmiCalculatorRepo {
  static Future<Response> getEmiValue(
      int loanAmount, int interestRate, int durationYears) async {
    final dio = Dio();
    final response = await dio.get(
      "https://api.api-ninjas.com/v1/mortgagecalculator?loan_amount=$loanAmount&interest_rate=$interestRate&duration_years=$durationYears",
      options: Options(
        headers: {
          'X-Api-Key': 'chR9U7ZXBCDc824SC6wAcg==fzA8NaNbtEmrMltF',
        },
      ),
    );
    log("Response : $response");
    return response;
  }
}
