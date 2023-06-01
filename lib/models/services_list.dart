

import 'package:flutter/material.dart';

import '../utils/routes.dart';

class ServicesList{

  final String title;
  final String icon;
  final Function()? onTap;
  BuildContext? context;

  ServicesList({ required this.title,required this.icon,this.onTap});
}

BuildContext context= context;

final servicesList= [
   ServicesList(title: 'Credit Card', icon: 'assets/svg/credit_card_icon.svg', onTap: (){
                     Navigator.of(context).pushNamed(
                                RouteGenerator.transferPage,
                              );
   },),
   ServicesList(title: 'Tax', icon: 'assets/svg/tax_icon.svg', onTap: (){},),
   ServicesList(title: 'Insurance', icon: 'assets/svg/insurance_icon.svg', onTap: (){},),
   ServicesList(title: 'Internet', icon: 'assets/svg/internet_icon.svg', onTap: (){},),
   ServicesList(title: 'Loan', icon: 'assets/svg/loan_icon.svg', onTap: (){},),
   ServicesList(title: 'Electricity', icon: 'assets/svg/electricity_icon.svg', onTap: (){},),
   ServicesList(title: 'Entertain', icon: 'assets/svg/entertain_icon.svg', onTap: (){},),
];