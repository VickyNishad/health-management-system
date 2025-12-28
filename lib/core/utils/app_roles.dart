enum AppRole { guest, patient, doctor, admin, nurse, staff }

extension AppRoleName on AppRole {
  String get nameString {
    switch (this) {
      case AppRole.admin:
        return 'admin';
      case AppRole.doctor:
        return 'doctor';
      case AppRole.patient:
        return 'patient';
      default:
        return 'guest';
    }
  }
}
