import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/responsive_widget.dart';
import 'package:medicque_app/core/utils/app_roles.dart';
import 'package:medicque_app/features/patient/slot_managment/presentaion/screen/mobile/mobile_slot_confirmation.dart';

import '../../../../../router/portal_wrapper.dart';
import '../screen/web/web_slot_confirmation.dart' show WebSlotConfirmation;

// class SlotConfirmationRouter extends StatelessWidget {
//   const SlotConfirmationRouter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveWidget(
//       mobile: MobileSlotConfirmation(),
//       tablet: WebSlotConfirmation(),
//       desktop: WebSlotConfirmation(),
//     );
//   }

class SlotConfirmationRouter extends StatelessWidget {
  const SlotConfirmationRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return PortalWrapper(
      appRole: AppRole.patient,
      showMenuInAppBar: true,
      child: ResponsiveWidget(
        mobile: MobileSlotConfirmation(),
        tablet: WebSlotConfirmation(),
        desktop: WebSlotConfirmation(),
      ),
    );
  }
}
