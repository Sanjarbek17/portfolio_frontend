import 'package:flutter/material.dart';

import '../repositories/portfolio_repository.dart';
import '../models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  ContactProvider({required this.repository});

  final PortfolioRepository repository;

  List<ContactModel> _contacts = [];
  List<ContactModel> get contacts => _contacts;

  Future<void> getContacts() async {
    _contacts = await repository.getContacts();
    notifyListeners();
  }
 
}