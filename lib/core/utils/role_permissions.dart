import '../utils/app_roles.dart';

class RolePermissions {
  static const Map<AppRole, List<String>> defaultPermissions = {
    AppRole.patient: ['P_VIEW_APPOINTMENTS', 'P_EDIT_PROFILE'],
    AppRole.doctor: [
      'D_VIEW_APPOINTMENTS',
      'D_VIEW_PATIENTS',
      'D_EDIT_PROFILE',
    ],
    AppRole.admin: [
      'A_MANAGE_DOCTORS',
      'A_MANAGE_PATIENTS',
      'A_SYSTEM_SETTINGS',
    ],
  };
}
