
class Invoice{
  final int id;
  final String date;
  final List<InvoiceDetails> details;

  Invoice({
    required this.id,
    required this.date,
    required this.details,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'],
      date: json['date'],
      details: (json['details'] as List).map((e) => InvoiceDetails.fromJson(e)).toList(),
    );
  }
}

class InvoiceDetails{
  final String title;
  final String pdf;
  final String download;

  InvoiceDetails({
    required this.title,
    required this.pdf,
    required this.download,
  });

  factory InvoiceDetails.fromJson(Map<String, dynamic> json) {
    return InvoiceDetails(
      title: json['title'],
      pdf: json['pdf'],
      download: json['download'],
    );
  }
}