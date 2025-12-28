class InvoiceModel {
  final String id;
  final String patientName;
  final String issuedDate;
  final String amount;

  InvoiceModel({
    required this.id,
    required this.patientName,
    required this.issuedDate,
    required this.amount,
  });
}

class InvoiceDetail {
  final String id;
  final String patientName;
  final String issuedDate;
  final String totalAmount;
  final List<InvoiceModel> items;

  const InvoiceDetail({
    required this.id,
    required this.patientName,
    required this.issuedDate,
    required this.totalAmount,
    required this.items,
  });
}
