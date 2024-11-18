import 'package:flutter/material.dart';
import 'package:money_trail_proj/data/dummy_Data/carouseldata/annual_expense_dummy.dart';
import 'package:money_trail_proj/data/dummy_Data/carouseldata/financial_health_dummy.dart';
import 'package:money_trail_proj/data/dummy_Data/carouseldata/ontime_payment_dummy.dart';
import 'package:money_trail_proj/data/dummy_Data/carouseldata/total_balance_dummy.dart';
import 'package:money_trail_proj/presentation/component/carousel_component/carousel_total_balance.dart';
import 'package:money_trail_proj/presentation/component/carousel_component/financial_health_card.dart';
import 'carousel_slider.dart';

import 'on_time_payment_card.dart';
import 'annual_expense_card.dart';

class CarouselComponent extends StatelessWidget {
  const CarouselComponent({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CarouselSliderComponent(
        cards: [
          TotalbalanceCard(totalBalance: totalBalances[0]),
          FinancialHealthCard(financialHealth: financialhealth[0]),
          OnTimePaymentCard(onTimePayment: ontimepaymen[0]),
          AnnualExpenseCard(annualExpense: annualExpense[0]),
        ],
      ),
    );
  }
}
