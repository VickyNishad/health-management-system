enum PortalType { patient, doctor, admin }

class PortalDetector {
  /// Uses browser host (Uri.base.host) to detect portal.
  /// Host containing "admin" -> admin, containing "doctor" -> doctor, else patient.
  static PortalType detect() {
    final host = Uri.base.host.toLowerCase();
    if (host.contains('admin')) return PortalType.admin;
    if (host.contains('doctor')) return PortalType.doctor;
    return PortalType.patient;
  }
}
