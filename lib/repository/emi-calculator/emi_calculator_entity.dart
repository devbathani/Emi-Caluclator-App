class EmiCalculatorEntity {
  EmiCalculatorEntity({
    required this.monthlyPayment,
    required this.annualPayment,
    required this.totalInterestPaid,
  });

  Payment monthlyPayment;
  Payment annualPayment;
  int totalInterestPaid;

  factory EmiCalculatorEntity.fromJson(Map<String, dynamic> json) =>
      EmiCalculatorEntity(
        monthlyPayment: Payment.fromJson(json["monthly_payment"]),
        annualPayment: Payment.fromJson(json["annual_payment"]),
        totalInterestPaid: json["total_interest_paid"],
      );

  Map<String, dynamic> toJson() => {
        "monthly_payment": monthlyPayment.toJson(),
        "annual_payment": annualPayment.toJson(),
        "total_interest_paid": totalInterestPaid,
      };
}

class Payment {
  Payment({
    required this.total,
    required this.mortgage,
    required this.propertyTax,
    required this.hoa,
    this.homeInsurance,
    this.annualHomeIns,
  });

  int total;
  int mortgage;
  dynamic propertyTax;
  double hoa;
  double? homeInsurance;
  int? annualHomeIns;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        total: json["total"],
        mortgage: json["mortgage"],
        propertyTax: json["property_tax"],
        hoa: json["hoa"],
        homeInsurance: json["home_insurance"],
        annualHomeIns: json["annual_home_ins"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "mortgage": mortgage,
        "property_tax": propertyTax,
        "hoa": hoa,
        "home_insurance": homeInsurance,
        "annual_home_ins": annualHomeIns,
      };
}
