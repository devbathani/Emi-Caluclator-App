import 'package:emi_calculator/presentation/widgets/custom_textfield.dart';
import 'package:emi_calculator/providers/emi_calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeLoanCalculator extends StatelessWidget {
  const HomeLoanCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EmiCalculatorProvider>(
      builder: (context, homeLoanState, child) {
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
                      "Home Loan Amount :",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 200.w,
                      height: 50.h,
                      child: CustomTextdfield(
                        icon: Icons.attach_money_outlined,
                        hintText: "Amount",
                        controller: homeLoanState.loanAmountController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Slider(
                  min: 0,
                  value: homeLoanState.loanAmountSliderValue.toDouble(),
                  max: 20000000,
                  divisions: 9,
                  label: homeLoanState.loanAmountSliderValue.toString(),
                  onChanged: (double value) {
                    homeLoanState.setLoanAmountSliderValue(value);
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
                        controller: homeLoanState.interestRateController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Slider(
                  min: 5,
                  value: homeLoanState.intersetRateSliderValue.toDouble(),
                  max: 20,
                  divisions: 9,
                  label: homeLoanState.intersetRateSliderValue.toString(),
                  onChanged: (double value) {
                    homeLoanState.setIntersetRateSliderValue(value);
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
                        controller: homeLoanState.durationYearsController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Slider(
                  min: 0,
                  value: homeLoanState.durationYearSliderValue.toDouble(),
                  max: 30,
                  divisions: 9,
                  label: homeLoanState.durationYearSliderValue.toString(),
                  onChanged: (double value) {
                    homeLoanState.setDurationSliderValue(value);
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
                        await homeLoanState.getEmiValue();

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
                                        "Annual Payment : ${homeLoanState.emiCalculatorEntity!.monthlyPayment.total}",
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
                                        "Montly Payment : ${homeLoanState.emiCalculatorEntity!.annualPayment.total}",
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
                                        "Total Interset Paid : ${homeLoanState.emiCalculatorEntity!.totalInterestPaid}",
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
