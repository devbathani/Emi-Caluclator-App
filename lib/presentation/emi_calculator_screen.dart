import 'package:emi_calculator/presentation/widgets/car_loan_calculator.dart';
import 'package:emi_calculator/presentation/widgets/home_loan_calculator.dart';
import 'package:emi_calculator/presentation/widgets/personal_loan_calculator.dart';
import 'package:flutter/material.dart';

class EmiCalculatorScreen extends StatelessWidget {
  const EmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Emi Calculator"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Home Loan',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Personal Loan',
                icon: Icon(Icons.person),
              ),
              Tab(
                text: 'Car Loan',
                icon: Icon(Icons.directions_car),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeLoanCalculator(),
            PersonalLoanCalculator(),
            CarLoanCalculator(),
          ],
        ),
      ),
    );
  }
}
