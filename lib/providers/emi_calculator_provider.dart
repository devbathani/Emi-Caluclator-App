import 'dart:developer';

import 'package:emi_calculator/repository/emi-calculator/emi_calculator_entity.dart';
import 'package:emi_calculator/repository/emi-calculator/emi_calculator_repo.dart';
import 'package:flutter/cupertino.dart';

class EmiCalculatorProvider extends ChangeNotifier {
  EmiCalculatorEntity? emiCalculatorEntity;

  final loanAmountController = TextEditingController();
  final interestRateController = TextEditingController();
  final durationYearsController = TextEditingController();

  int loanAmountSliderValue = 5000000;
  int intersetRateSliderValue = 8;
  int durationYearSliderValue = 20;

  Future getEmiValue() async {
    final response = await EmiCalculatorRepo.getEmiValue(
      int.parse(loanAmountController.text),
      int.parse(interestRateController.text),
      int.parse(durationYearsController.text),
    );

    if (response.statusCode == 200) {
      emiCalculatorEntity = EmiCalculatorEntity.fromJson(response.data);
      return;
    } else {
      log("Something Went Wrong");
    }
    notifyListeners();
  }

  setLoanAmountSliderValue(double value) {
    loanAmountSliderValue = value.toInt();
    loanAmountController.text = loanAmountSliderValue.toString();
    notifyListeners();
  }

  setIntersetRateSliderValue(double value) {
    intersetRateSliderValue = value.toInt();
    interestRateController.text = intersetRateSliderValue.toString();
    notifyListeners();
  }

  setDurationSliderValue(double value) {
    durationYearSliderValue = value.toInt();
    durationYearsController.text = durationYearSliderValue.toString();
    notifyListeners();
  }
}
