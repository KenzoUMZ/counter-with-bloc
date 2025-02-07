import 'package:flutter/material.dart';

class Responsive extends StatelessWidget{
  final Widget mobile;
  final Widget? table;

  const Responsive({
    super.key,
    required this.mobile,
    this.table,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;
  
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;



      @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

      if(size.width >= 850 && table != null){
        return table!;
      }else{
        return mobile;
      }
  }
}