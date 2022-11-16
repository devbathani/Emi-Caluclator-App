import 'package:emi_calculator/presentation/widgets/custom_textfield.dart';
import 'package:emi_calculator/providers/emi_calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PersonalLoanCalculator extends StatelessWidget {
  const PersonalLoanCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EmiCalculatorProvider>(
      builder: (context, personalLoanState, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Personal Loan Amount :",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 180.w,
                      height: 50.h,
                      child: CustomTextdfield(
                        icon: Icons.attach_money_outlined,
                        hintText: "Amount",
                        controller: personalLoanState.loanAmountController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Slider(
                  min: 0,
                  value: personalLoanState.loanAmountSliderValue.toDouble(),
                  max: 20000000,
                  divisions: 9,
                  label: personalLoanState.loanAmountSliderValue.toString(),
                  onChanged: (double value) {
                    personalLoanState.setLoanAmountSliderValue(value);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Interset Rate :",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 200.w,
                      height: 50.h,
                      child: CustomTextdfield(
                        icon: Icons.percent,
                        hintText: "Rate",
                        controller: personalLoanState.interestRateController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Slider(
                  min: 5,
                  value: personalLoanState.intersetRateSliderValue.toDouble(),
                  max: 20,
                  divisions: 9,
                  label: personalLoanState.intersetRateSliderValue.toString(),
                  onChanged: (double value) {
                    personalLoanState.setIntersetRateSliderValue(value);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Duration(Years) :",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 200.w,
                      height: 50.h,
                      child: CustomTextdfield(
                        icon: Icons.timer,
                        hintText: "Duration",
                        controller: personalLoanState.durationYearsController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Slider(
                  min: 0,
                  value: personalLoanState.durationYearSliderValue.toDouble(),
                  max: 30,
                  divisions: 9,
                  label: personalLoanState.durationYearSliderValue.toString(),
                  onChanged: (double value) {
                    personalLoanState.setDurationSliderValue(value);
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await personalLoanState.getEmiValue();
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: SizedBox(
                              height: 200.h,
                              width: 200.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Annual Payment : ${personalLoanState.emiCalculatorEntity!.monthlyPayment.total}",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Montly Payment : ${personalLoanState.emiCalculatorEntity!.annualPayment.total}",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total Interset Paid : ${personalLoanState.emiCalculatorEntity!.totalInterestPaid}",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 45.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            "Check Home EMI",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
