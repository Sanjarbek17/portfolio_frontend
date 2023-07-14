import 'package:flutter/material.dart';

import '../repositories/portfolio_repository.dart';
import '../models/contact_model.dart';

enum ContactStatus { initial, loaded, error }

class ContactProvider extends ChangeNotifier {
  ContactProvider({required this.repository});

  final PortfolioRepository repository;

  ContactStatus status = ContactStatus.initial;

  List<ContactModel> _contacts = [];
  List<ContactModel> get contacts => _contacts;

  Future<void> getContacts() async {
    try {
      _contacts = await repository.getContacts();
      status = ContactStatus.loaded;
      notifyListeners();
    } catch (e) {
      status = ContactStatus.error;
      notifyListeners();
    }
  }
}
