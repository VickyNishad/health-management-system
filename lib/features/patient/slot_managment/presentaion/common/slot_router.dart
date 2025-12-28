import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/responsive_widget.dart';
import 'package:medicque_app/core/utils/app_roles.dart';
import 'package:medicque_app/features/patient/slot_managment/presentaion/screen/web/web_slot.dart';

import '../../../../../core/services/assets_json_loader.dart';
import '../../../../../router/portal_wrapper.dart';
import '../../../dashboard/data/models/doctor_slot.dart';
import '../screen/mobile/mobile_slot.dart';

// class SlotRouter extends StatelessWidget {
//   const SlotRouter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveWidget(
//       mobile: MobileSlot(),
//       tablet: WebSlot(),
//       desktop: WebSlot(),
//     );
//   }
// }

class SlotRouter extends StatefulWidget {
  const SlotRouter({super.key});

  @override
  State<SlotRouter> createState() => _SlotRouterState();
}

class _SlotRouterState extends State<SlotRouter> {
  DoctorSlotModel? doctor;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final json = await AssetJsonLoader.loadJsonAsset('doctor_appointment.json');
    doctor = DoctorSlotModel.fromJson(json);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // wait until the data is loaded
    if (doctor == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return PortalWrapper(
      appRole: AppRole.patient,
      showMenuInAppBar: true,
      child: ResponsiveWidget(
        mobile: MobileSlot(doctor: doctor!),
        tablet: MobileSlot(doctor: doctor!),
        desktop: WebSlot(doctor: doctor!),
      ),
    );
  }
}
