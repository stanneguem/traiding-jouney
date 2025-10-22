import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading_journey/core/utils/colors.dart';
import 'package:trading_journey/features/home/widgets/custom_drawer.dart';
import 'package:trading_journey/features/home/widgets/custom_title.dart';
import 'widgets/header_widget.dart';
import 'widgets/period_widget.dart';
import 'widgets/account_widget.dart';
import 'widgets/capital_widget.dart';
import 'widgets/general_widget.dart';
import 'widgets/symbol_widget.dart';
import 'widgets/positions_widget.dart';
import 'widgets/gain_loss_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(),
              SizedBox(height: 16.h),
              CustomTitle(title: 'Période',),
              SizedBox(height: 5.h),
              const PeriodWidget(),
              SizedBox(height: 25.h),
              CustomTitle(title: 'Compte',),
              SizedBox(height: 5.h),
              const AccountWidget(),
              SizedBox(height: 16.h),
              CustomTitle(title: 'General',),
              SizedBox(height: 5.h),
              const CapitalWidget(),
              SizedBox(height: 16.h),
              CustomTitle(title: 'Symbole',),
              SizedBox(height: 5.h),
              const SymbolWidget(),
              SizedBox(height: 16.h),
              CustomTitle(title: 'Positions',),
              SizedBox(height: 5.h),
              const PositionsWidget(),
              SizedBox(height: 16.h),
              CustomTitle(title: 'Gain/Perte',),
              SizedBox(height: 5.h),
              const GainLossWidget(),
            ],
          ),
        ),
      ),
        drawer: CustomDrawer(
          userName: "Daina",
          userEmail: "example@gmail.com",
          onItemSelected: (page) {
            // setState(() => selectedPage = page);
            Navigator.pop(context);
          },
          onLogout: () {
            // Déconnexion ici
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Déconnecté")),
            );
          },
        )
    );
  }
}