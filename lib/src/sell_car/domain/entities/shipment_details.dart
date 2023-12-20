//
// class ShipmentDetails{
//   final int id;
//   final String phone;
//   final String whatsapp;
//   final String shopPhone;
//   final String shopWhatsapp;
//   final String status;
//   final String shipmentType;
//   final String shipmentValue;
//   final String shipmentNumber;
//   final String referenceNumber;
//   final String receiver;
//   final String shop;
//   final String receiverAddress;
//   final String notes;
//   final List<Comment> commentsLogeste;
//   final List<Comment> commentsCustomer;
//   final List<Comment> commentsCaptain;
//   final List<CallHistory> callsHistory;
//
//   ShipmentDetails({
//     required this.id,
//     required this.phone,
//     required this.whatsapp,
//     required this.shopPhone,
//     required this.shopWhatsapp,
//     required this.status,
//     required this.shipmentType,
//     required this.shipmentValue,
//     required this.shipmentNumber,
//     required this.referenceNumber,
//     required this.receiver,
//     required this.shop,
//     required this.receiverAddress,
//     required this.notes,
//     required this.commentsLogeste,
//     required this.commentsCustomer,
//     required this.commentsCaptain,
//     required this.callsHistory,
//   });
//
//   factory ShipmentDetails.fromJson(Map<String, dynamic> json) {
//     return ShipmentDetails(
//       id: json['id'],
//       phone: json['phone'],
//       whatsapp: json['whatsapp'],
//       shopPhone: json['shopPhone'],
//       shopWhatsapp: json['shopWhatsapp'],
//       status: json['status'],
//       shipmentType: json['shipmentType'],
//       shipmentValue: json['shipmentValue'],
//       shipmentNumber: json['shipmentNumber'],
//       referenceNumber: json['referenceNumber'],
//       receiver: json['sender'],
//       shop: json['shop'],
//       receiverAddress: json['receiverAddress'],
//       notes: json['notes'],
//       commentsLogeste: (json['commentsLogeste'] as List).map((e) => Comment.fromJson(e)).toList(),
//       commentsCustomer: (json['commentsCustomer'] as List).map((e) => Comment.fromJson(e)).toList(),
//       commentsCaptain: (json['commentsCaptain'] as List).map((e) => Comment.fromJson(e)).toList(),
//       callsHistory: (json['callsHistory'] as List).map((e) => CallHistory.fromJson(e)).toList(),
//     );
//   }
//
//
// }
//
// class Comment{
//   final String comment;
//   final String commentBy;
//   final String commentDate;
//
//   Comment({
//     required this.comment,
//     required this.commentBy,
//     required this.commentDate,
//   });
//
//   factory Comment.fromJson(Map<String, dynamic> json) {
//     return Comment(
//       comment: json['comment'],
//       commentBy: json['commentBy'],
//       commentDate: json['commentDate'],
//     );
//   }
// }
//
// class CallHistory{
//   final String callDate;
//   final String callBy;
//   final String callDuration;
//
//   CallHistory({
//     required this.callDate,
//     required this.callBy,
//     required this.callDuration,
//   });
//
//   factory CallHistory.fromJson(Map<String, dynamic> json) {
//     return CallHistory(
//       callDate: json['callDate'],
//       callBy: json['callBy'],
//       callDuration: json['callDuration'],
//     );
//   }
// }