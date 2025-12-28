import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/responsive_widget.dart';
import 'package:medicque_app/features/patient/search/presentation/screen/web/search_web.dart';

class SearchRouter extends StatelessWidget {
  const SearchRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: SearchWeb(),
      tablet: SearchWeb(),
      desktop: SearchWeb(),
    );
  }
}
