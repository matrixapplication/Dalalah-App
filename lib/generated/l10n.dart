// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to Logeste`
  String get welcome_message {
    return Intl.message(
      'Welcome to Logeste',
      name: 'welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Log in to your account`
  String get log_in_your_account {
    return Intl.message(
      'Log in to your account',
      name: 'log_in_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Representative`
  String get as_representative {
    return Intl.message(
      'Representative',
      name: 'as_representative',
      desc: '',
      args: [],
    );
  }

  /// `Agent`
  String get as_agent {
    return Intl.message(
      'Agent',
      name: 'as_agent',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get log_in {
    return Intl.message(
      'Log in',
      name: 'log_in',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_an_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get create_new_account {
    return Intl.message(
      'Create a new account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Create your account now`
  String get create_your_account {
    return Intl.message(
      'Create your account now',
      name: 'create_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Company or agent name`
  String get company_or_agent_name {
    return Intl.message(
      'Company or agent name',
      name: 'company_or_agent_name',
      desc: '',
      args: [],
    );
  }

  /// `Manager name`
  String get manager_name {
    return Intl.message(
      'Manager name',
      name: 'manager_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Representative with a vehicle.`
  String get rep_with_vehicle {
    return Intl.message(
      'Representative with a vehicle.',
      name: 'rep_with_vehicle',
      desc: '',
      args: [],
    );
  }

  /// `Representative without a vehicle.`
  String get rep_without_vehicle {
    return Intl.message(
      'Representative without a vehicle.',
      name: 'rep_without_vehicle',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Complete your account as a representative`
  String get complete_your_account_representative {
    return Intl.message(
      'Complete your account as a representative',
      name: 'complete_your_account_representative',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Click to upload a copy of the {name}`
  String click_upload_copy_the(dynamic name) {
    return Intl.message(
      'Click to upload a copy of the $name',
      name: 'click_upload_copy_the',
      desc: 'Click to upload a copy of the {name}',
      args: [name],
    );
  }

  /// `The {name} copy has been uploaded`
  String copy_has_been_uploaded(dynamic name) {
    return Intl.message(
      'The $name copy has been uploaded',
      name: 'copy_has_been_uploaded',
      desc: 'Click to upload a copy of the {name}',
      args: [name],
    );
  }

  /// `driver's license`
  String get drivers_license {
    return Intl.message(
      'driver\'s license',
      name: 'drivers_license',
      desc: '',
      args: [],
    );
  }

  /// `vehicle license`
  String get vehicle_license {
    return Intl.message(
      'vehicle license',
      name: 'vehicle_license',
      desc: '',
      args: [],
    );
  }

  /// `ID card`
  String get id_card {
    return Intl.message(
      'ID card',
      name: 'id_card',
      desc: '',
      args: [],
    );
  }

  /// `Criminal status newspaper`
  String get criminal_status_newspaper {
    return Intl.message(
      'Criminal status newspaper',
      name: 'criminal_status_newspaper',
      desc: '',
      args: [],
    );
  }

  /// `Delete image`
  String get delete_image {
    return Intl.message(
      'Delete image',
      name: 'delete_image',
      desc: '',
      args: [],
    );
  }

  /// `Enter the registered phone number\nto recover your account`
  String get forget_password_message {
    return Intl.message(
      'Enter the registered phone number\nto recover your account',
      name: 'forget_password_message',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code to recover your account`
  String get enter_code_recover_your_account {
    return Intl.message(
      'Enter the code to recover your account',
      name: 'enter_code_recover_your_account',
      desc: '',
      args: [],
    );
  }

  /// `A text message has been sent to your registered phone number`
  String get text_message_has_been_sent_your_registered_phone_number {
    return Intl.message(
      'A text message has been sent to your registered phone number',
      name: 'text_message_has_been_sent_your_registered_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been recovered\nSet a new password`
  String get your_account_has_been_recovered_set_new_password {
    return Intl.message(
      'Your account has been recovered\nSet a new password',
      name: 'your_account_has_been_recovered_set_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Create a new password`
  String get create_new_password {
    return Intl.message(
      'Create a new password',
      name: 'create_new_password',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get new_password {
    return Intl.message(
      'New password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm new password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Status customer:`
  String get status_customer {
    return Intl.message(
      'Status customer:',
      name: 'status_customer',
      desc: '',
      args: [],
    );
  }

  /// `Reason for disconnecting`
  String get reason_disconnecting {
    return Intl.message(
      'Reason for disconnecting',
      name: 'reason_disconnecting',
      desc: '',
      args: [],
    );
  }

  /// `Confirm disconnecting`
  String get confirm_disconnecting {
    return Intl.message(
      'Confirm disconnecting',
      name: 'confirm_disconnecting',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get scan {
    return Intl.message(
      'Scan',
      name: 'scan',
      desc: '',
      args: [],
    );
  }

  /// `Stop`
  String get stop {
    return Intl.message(
      'Stop',
      name: 'stop',
      desc: '',
      args: [],
    );
  }

  /// `Camera facing back`
  String get camera_facing_back {
    return Intl.message(
      'Camera facing back',
      name: 'camera_facing_back',
      desc: '',
      args: [],
    );
  }

  /// `Camera facing front`
  String get camera_facing_front {
    return Intl.message(
      'Camera facing front',
      name: 'camera_facing_front',
      desc: '',
      args: [],
    );
  }

  /// `Scan to Search`
  String get scan_search {
    return Intl.message(
      'Scan to Search',
      name: 'scan_search',
      desc: '',
      args: [],
    );
  }

  /// `Scan to Receive`
  String get scan_receive {
    return Intl.message(
      'Scan to Receive',
      name: 'scan_receive',
      desc: '',
      args: [],
    );
  }

  /// `Scan to Pickup`
  String get scan_pickup {
    return Intl.message(
      'Scan to Pickup',
      name: 'scan_pickup',
      desc: '',
      args: [],
    );
  }

  /// `Scan QR & Barcode`
  String get qr_barcode_scanning {
    return Intl.message(
      'Scan QR & Barcode',
      name: 'qr_barcode_scanning',
      desc: '',
      args: [],
    );
  }

  /// `Points({number} Shipment)`
  String shipment_points(dynamic number) {
    return Intl.message(
      'Points($number Shipment)',
      name: 'shipment_points',
      desc: 'Points({number} Shipment)',
      args: [number],
    );
  }

  /// `{number} shipments have been successfully picked up`
  String shipments_have_been_successfully_picked_up(dynamic number) {
    return Intl.message(
      '$number shipments have been successfully picked up',
      name: 'shipments_have_been_successfully_picked_up',
      desc: 'The shipments have been successfully picked up',
      args: [number],
    );
  }

  /// `Go to tasks`
  String get go_to_tasks {
    return Intl.message(
      'Go to tasks',
      name: 'go_to_tasks',
      desc: '',
      args: [],
    );
  }

  /// `Receipt ({number} shipments)`
  String receipt_shipments(dynamic number) {
    return Intl.message(
      'Receipt ($number shipments)',
      name: 'receipt_shipments',
      desc: 'Receipt ({number} shipments)',
      args: [number],
    );
  }

  /// `Code read`
  String get code_read {
    return Intl.message(
      'Code read',
      name: 'code_read',
      desc: '',
      args: [],
    );
  }

  /// `The shipment has been received successfully`
  String get shipment_has_been_received_successfully {
    return Intl.message(
      'The shipment has been received successfully',
      name: 'shipment_has_been_received_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Go to shipments`
  String get go_to_shipments {
    return Intl.message(
      'Go to shipments',
      name: 'go_to_shipments',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Shipments`
  String get shipments {
    return Intl.message(
      'Shipments',
      name: 'shipments',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'current' key

  /// `Delayed`
  String get delayed {
    return Intl.message(
      'Delayed',
      name: 'delayed',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get finished {
    return Intl.message(
      'Finished',
      name: 'finished',
      desc: '',
      args: [],
    );
  }

  /// `Shipment has been expedited`
  String get shipment_expedited {
    return Intl.message(
      'Shipment has been expedited',
      name: 'shipment_expedited',
      desc: '',
      args: [],
    );
  }

  /// `Shipment type`
  String get shipment_type {
    return Intl.message(
      'Shipment type',
      name: 'shipment_type',
      desc: '',
      args: [],
    );
  }

  /// `Sender`
  String get sender {
    return Intl.message(
      'Sender',
      name: 'sender',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get shop {
    return Intl.message(
      'Shop',
      name: 'shop',
      desc: '',
      args: [],
    );
  }

  /// `Recipient address`
  String get recipient_address {
    return Intl.message(
      'Recipient address',
      name: 'recipient_address',
      desc: '',
      args: [],
    );
  }

  /// `Shipment details`
  String get shipment_details {
    return Intl.message(
      'Shipment details',
      name: 'shipment_details',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Start the conversation with`
  String get start_conversation_with {
    return Intl.message(
      'Start the conversation with',
      name: 'start_conversation_with',
      desc: '',
      args: [],
    );
  }

  /// `Agent`
  String get agent {
    return Intl.message(
      'Agent',
      name: 'agent',
      desc: '',
      args: [],
    );
  }

  /// `Administrator`
  String get administrator {
    return Intl.message(
      'Administrator',
      name: 'administrator',
      desc: '',
      args: [],
    );
  }

  /// `Shipment value`
  String get shipment_value {
    return Intl.message(
      'Shipment value',
      name: 'shipment_value',
      desc: '',
      args: [],
    );
  }

  /// `Reference number`
  String get reference_number {
    return Intl.message(
      'Reference number',
      name: 'reference_number',
      desc: '',
      args: [],
    );
  }

  /// `Recipient`
  String get recipient {
    return Intl.message(
      'Recipient',
      name: 'recipient',
      desc: '',
      args: [],
    );
  }

  /// `Logistic comments`
  String get logeste_comments {
    return Intl.message(
      'Logistic comments',
      name: 'logeste_comments',
      desc: '',
      args: [],
    );
  }

  /// `Customer comments`
  String get customer_comments {
    return Intl.message(
      'Customer comments',
      name: 'customer_comments',
      desc: '',
      args: [],
    );
  }

  /// `Captain comments`
  String get captain_comments {
    return Intl.message(
      'Captain comments',
      name: 'captain_comments',
      desc: '',
      args: [],
    );
  }

  /// `Call history`
  String get call_history {
    return Intl.message(
      'Call history',
      name: 'call_history',
      desc: '',
      args: [],
    );
  }

  /// `Shipment delivery`
  String get shipment_delivery {
    return Intl.message(
      'Shipment delivery',
      name: 'shipment_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Shipment cancel`
  String get shipment_cancel {
    return Intl.message(
      'Shipment cancel',
      name: 'shipment_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Notes on the shipment`
  String get notes_on_shipment {
    return Intl.message(
      'Notes on the shipment',
      name: 'notes_on_shipment',
      desc: '',
      args: [],
    );
  }

  /// `Shipment delay`
  String get shipment_delay {
    return Intl.message(
      'Shipment delay',
      name: 'shipment_delay',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total2 {
    return Intl.message(
      'Total',
      name: 'total2',
      desc: '',
      args: [],
    );
  }

  /// `Partial`
  String get partial {
    return Intl.message(
      'Partial',
      name: 'partial',
      desc: '',
      args: [],
    );
  }

  /// `Replacing`
  String get replacing {
    return Intl.message(
      'Replacing',
      name: 'replacing',
      desc: '',
      args: [],
    );
  }

  /// `Cash back`
  String get cash_back {
    return Intl.message(
      'Cash back',
      name: 'cash_back',
      desc: '',
      args: [],
    );
  }

  /// `Total shipment price`
  String get total_shipment_price {
    return Intl.message(
      'Total shipment price',
      name: 'total_shipment_price',
      desc: '',
      args: [],
    );
  }

  /// `Write your comment here..`
  String get write_your_comment_here {
    return Intl.message(
      'Write your comment here..',
      name: 'write_your_comment_here',
      desc: '',
      args: [],
    );
  }

  /// `Write what is the actual amount paid?`
  String get write_what_actual_amount_paid {
    return Intl.message(
      'Write what is the actual amount paid?',
      name: 'write_what_actual_amount_paid',
      desc: '',
      args: [],
    );
  }

  /// `Delivery confirmation`
  String get delivery_confirmation {
    return Intl.message(
      'Delivery confirmation',
      name: 'delivery_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `The shipment has been delivered successfully`
  String get shipment_delivered_successfully {
    return Intl.message(
      'The shipment has been delivered successfully',
      name: 'shipment_delivered_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Face-to-face`
  String get face_to_face {
    return Intl.message(
      'Face-to-face',
      name: 'face_to_face',
      desc: '',
      args: [],
    );
  }

  /// `In the area`
  String get in_area {
    return Intl.message(
      'In the area',
      name: 'in_area',
      desc: '',
      args: [],
    );
  }

  /// `Shipment refused`
  String get shipment_refused {
    return Intl.message(
      'Shipment refused',
      name: 'shipment_refused',
      desc: '',
      args: [],
    );
  }

  /// `Shipping charges paid?`
  String get shipping_charges_paid {
    return Intl.message(
      'Shipping charges paid?',
      name: 'shipping_charges_paid',
      desc: '',
      args: [],
    );
  }

  /// `Write your comment here (optional)`
  String get write_your_comment_here_optional {
    return Intl.message(
      'Write your comment here (optional)',
      name: 'write_your_comment_here_optional',
      desc: '',
      args: [],
    );
  }

  /// `Confirm rejection`
  String get confirm_rejection {
    return Intl.message(
      'Confirm rejection',
      name: 'confirm_rejection',
      desc: '',
      args: [],
    );
  }

  /// `The shipment was rejected successfully`
  String get shipment_rejected_successfully {
    return Intl.message(
      'The shipment was rejected successfully',
      name: 'shipment_rejected_successfully',
      desc: '',
      args: [],
    );
  }

  /// `What are your comments on the shipment?`
  String get what_your_comments_shipment {
    return Intl.message(
      'What are your comments on the shipment?',
      name: 'what_your_comments_shipment',
      desc: '',
      args: [],
    );
  }

  /// `Confirm sending feedback`
  String get confirm_sending_feedback {
    return Intl.message(
      'Confirm sending feedback',
      name: 'confirm_sending_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Delay/problem on receiving the shipment`
  String get delay_problem_receiving_shipment {
    return Intl.message(
      'Delay/problem on receiving the shipment',
      name: 'delay_problem_receiving_shipment',
      desc: '',
      args: [],
    );
  }

  /// `Another reason`
  String get another_reason {
    return Intl.message(
      'Another reason',
      name: 'another_reason',
      desc: '',
      args: [],
    );
  }

  /// `What is the reason for delaying the shipment?`
  String get what_reason_delaying_shipment {
    return Intl.message(
      'What is the reason for delaying the shipment?',
      name: 'what_reason_delaying_shipment',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasks {
    return Intl.message(
      'Tasks',
      name: 'tasks',
      desc: '',
      args: [],
    );
  }

  /// `Search for tasks`
  String get search_tasks {
    return Intl.message(
      'Search for tasks',
      name: 'search_tasks',
      desc: '',
      args: [],
    );
  }

  /// `Pickup > Cash > Refund`
  String get pickup_cash_refund {
    return Intl.message(
      'Pickup > Cash > Refund',
      name: 'pickup_cash_refund',
      desc: '',
      args: [],
    );
  }

  /// `In progress`
  String get in_progress {
    return Intl.message(
      'In progress',
      name: 'in_progress',
      desc: '',
      args: [],
    );
  }

  /// `Pickup`
  String get pickup {
    return Intl.message(
      'Pickup',
      name: 'pickup',
      desc: '',
      args: [],
    );
  }

  /// `Collection`
  String get collection {
    return Intl.message(
      'Collection',
      name: 'collection',
      desc: '',
      args: [],
    );
  }

  /// `Returner`
  String get returner {
    return Intl.message(
      'Returner',
      name: 'returner',
      desc: '',
      args: [],
    );
  }

  /// `Packaging`
  String get packaging {
    return Intl.message(
      'Packaging',
      name: 'packaging',
      desc: '',
      args: [],
    );
  }

  /// `Expected number of shipments`
  String get expected_number_shipments {
    return Intl.message(
      'Expected number of shipments',
      name: 'expected_number_shipments',
      desc: '',
      args: [],
    );
  }

  /// `Actual number of shipments`
  String get actual_number_shipments {
    return Intl.message(
      'Actual number of shipments',
      name: 'actual_number_shipments',
      desc: '',
      args: [],
    );
  }

  /// `Enter number`
  String get enter_number {
    return Intl.message(
      'Enter number',
      name: 'enter_number',
      desc: '',
      args: [],
    );
  }

  /// `Collect without barcode`
  String get collect_without_barcode {
    return Intl.message(
      'Collect without barcode',
      name: 'collect_without_barcode',
      desc: '',
      args: [],
    );
  }

  /// `Collect using barcode`
  String get collect_using_barcode {
    return Intl.message(
      'Collect using barcode',
      name: 'collect_using_barcode',
      desc: '',
      args: [],
    );
  }

  /// `Collecting cash for the customer`
  String get collecting_cash_for_customer {
    return Intl.message(
      'Collecting cash for the customer',
      name: 'collecting_cash_for_customer',
      desc: '',
      args: [],
    );
  }

  /// `Collection delivery`
  String get collection_delivery {
    return Intl.message(
      'Collection delivery',
      name: 'collection_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Refuse collection`
  String get refuse_collection {
    return Intl.message(
      'Refuse collection',
      name: 'refuse_collection',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code to confirm the operation`
  String get enter_code_to_confirm_operation {
    return Intl.message(
      'Enter the code to confirm the operation',
      name: 'enter_code_to_confirm_operation',
      desc: '',
      args: [],
    );
  }

  /// `Serial`
  String get serial {
    return Intl.message(
      'Serial',
      name: 'serial',
      desc: '',
      args: [],
    );
  }

  /// `Number of shipments`
  String get number_shipments {
    return Intl.message(
      'Number of shipments',
      name: 'number_shipments',
      desc: '',
      args: [],
    );
  }

  /// `Write your notes here..`
  String get write_your_notes_here {
    return Intl.message(
      'Write your notes here..',
      name: 'write_your_notes_here',
      desc: '',
      args: [],
    );
  }

  /// `Return delivery`
  String get return_delivery {
    return Intl.message(
      'Return delivery',
      name: 'return_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Refuse return`
  String get refuse_return {
    return Intl.message(
      'Refuse return',
      name: 'refuse_return',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Material delivery`
  String get material_delivery {
    return Intl.message(
      'Material delivery',
      name: 'material_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Material Refuse`
  String get material_refuse {
    return Intl.message(
      'Material Refuse',
      name: 'material_refuse',
      desc: '',
      args: [],
    );
  }

  /// `Invoices`
  String get invoices {
    return Intl.message(
      'Invoices',
      name: 'invoices',
      desc: '',
      args: [],
    );
  }

  /// `Search for bills`
  String get search_bills {
    return Intl.message(
      'Search for bills',
      name: 'search_bills',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Current balance`
  String get current_balance {
    return Intl.message(
      'Current balance',
      name: 'current_balance',
      desc: '',
      args: [],
    );
  }

  /// `Add balance to the account`
  String get add_balance_account {
    return Intl.message(
      'Add balance to the account',
      name: 'add_balance_account',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw balance from the account`
  String get withdraw_balance_account {
    return Intl.message(
      'Withdraw balance from the account',
      name: 'withdraw_balance_account',
      desc: '',
      args: [],
    );
  }

  /// `{currency} EGP`
  String egp(dynamic currency) {
    return Intl.message(
      '$currency EGP',
      name: 'egp',
      desc: 'Egyptian Pound',
      args: [currency],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `The shipment has been successfully delivered`
  String get notifications_message {
    return Intl.message(
      'The shipment has been successfully delivered',
      name: 'notifications_message',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Complaints`
  String get complaints {
    return Intl.message(
      'Complaints',
      name: 'complaints',
      desc: '',
      args: [],
    );
  }

  /// `Answered`
  String get answered {
    return Intl.message(
      'Answered',
      name: 'answered',
      desc: '',
      args: [],
    );
  }

  /// `Complaint address`
  String get complaint_address {
    return Intl.message(
      'Complaint address',
      name: 'complaint_address',
      desc: '',
      args: [],
    );
  }

  /// `Complaint details`
  String get complaint_details {
    return Intl.message(
      'Complaint details',
      name: 'complaint_details',
      desc: '',
      args: [],
    );
  }

  /// `Submit new complaint`
  String get submit_new_complaint {
    return Intl.message(
      'Submit new complaint',
      name: 'submit_new_complaint',
      desc: '',
      args: [],
    );
  }

  /// `Company response`
  String get company_response {
    return Intl.message(
      'Company response',
      name: 'company_response',
      desc: '',
      args: [],
    );
  }

  /// `Write the complaint details here`
  String get write_complaint_details_here {
    return Intl.message(
      'Write the complaint details here',
      name: 'write_complaint_details_here',
      desc: '',
      args: [],
    );
  }

  /// `Submit complaint`
  String get submit_complaint {
    return Intl.message(
      'Submit complaint',
      name: 'submit_complaint',
      desc: '',
      args: [],
    );
  }

  /// `Change app language`
  String get change_app_language {
    return Intl.message(
      'Change app language',
      name: 'change_app_language',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get change_language {
    return Intl.message(
      'Change language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms and conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get dark_mode {
    return Intl.message(
      'Dark mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Light mode`
  String get light_mode {
    return Intl.message(
      'Light mode',
      name: 'light_mode',
      desc: '',
      args: [],
    );
  }

  /// `Rate the app`
  String get rate_the_app {
    return Intl.message(
      'Rate the app',
      name: 'rate_the_app',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `About Logeste`
  String get about_logeste {
    return Intl.message(
      'About Logeste',
      name: 'about_logeste',
      desc: '',
      args: [],
    );
  }

  /// `My account`
  String get my_account {
    return Intl.message(
      'My account',
      name: 'my_account',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get delete_account {
    return Intl.message(
      'Delete account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Operations`
  String get operations {
    return Intl.message(
      'Operations',
      name: 'operations',
      desc: '',
      args: [],
    );
  }

  /// `Search for invoices in operations`
  String get search_invoices_in_operations {
    return Intl.message(
      'Search for invoices in operations',
      name: 'search_invoices_in_operations',
      desc: '',
      args: [],
    );
  }

  /// `Total due to the representative`
  String get total_due_to_the_representative {
    return Intl.message(
      'Total due to the representative',
      name: 'total_due_to_the_representative',
      desc: '',
      args: [],
    );
  }

  /// `Total due to the company`
  String get total_due_to_the_company {
    return Intl.message(
      'Total due to the company',
      name: 'total_due_to_the_company',
      desc: '',
      args: [],
    );
  }

  /// `Bill No`
  String get bill_no {
    return Intl.message(
      'Bill No',
      name: 'bill_no',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get company {
    return Intl.message(
      'Company',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `Captain`
  String get captain {
    return Intl.message(
      'Captain',
      name: 'captain',
      desc: '',
      args: [],
    );
  }

  /// `Delivery number`
  String get delivery_number {
    return Intl.message(
      'Delivery number',
      name: 'delivery_number',
      desc: '',
      args: [],
    );
  }

  /// `District`
  String get district {
    return Intl.message(
      'District',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Collector`
  String get collector {
    return Intl.message(
      'Collector',
      name: 'collector',
      desc: '',
      args: [],
    );
  }

  /// `Customer name`
  String get customer_name {
    return Intl.message(
      'Customer name',
      name: 'customer_name',
      desc: '',
      args: [],
    );
  }

  /// `Customer phone`
  String get customer_phone {
    return Intl.message(
      'Customer phone',
      name: 'customer_phone',
      desc: '',
      args: [],
    );
  }

  /// `Representative due`
  String get representative_due {
    return Intl.message(
      'Representative due',
      name: 'representative_due',
      desc: '',
      args: [],
    );
  }

  /// `Company due`
  String get company_due {
    return Intl.message(
      'Company due',
      name: 'company_due',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get this_field_is_required {
    return Intl.message(
      'This field is required',
      name: 'this_field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `First face`
  String get first_face {
    return Intl.message(
      'First face',
      name: 'first_face',
      desc: '',
      args: [],
    );
  }

  /// `Second face`
  String get second_face {
    return Intl.message(
      'Second face',
      name: 'second_face',
      desc: '',
      args: [],
    );
  }

  /// `Deliver selected shipments to another captain`
  String get deliver_selected_shipments_another_captain {
    return Intl.message(
      'Deliver selected shipments to another captain',
      name: 'deliver_selected_shipments_another_captain',
      desc: '',
      args: [],
    );
  }

  /// `Addition`
  String get addition {
    return Intl.message(
      'Addition',
      name: 'addition',
      desc: '',
      args: [],
    );
  }

  /// `Add new captain`
  String get add_new_captain {
    return Intl.message(
      'Add new captain',
      name: 'add_new_captain',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
