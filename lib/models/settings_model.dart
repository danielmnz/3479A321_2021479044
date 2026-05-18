import 'package:flutter/material.dart';
import 'package:probando_flutter_lab1/core/services/storage_service.dart';

class SettingsViewModel extends ChangeNotifier {
  String _username = '';
  String _difficulty = 'Fácil';

  String get username => _username;
  String get difficulty => _difficulty;

  //propiedad calculada dinámicamente
  int get gridSize => _difficulty == 'Fácil' ? 8 : (_difficulty == 'Medio' ? 10 :12);

  SettingsViewModel() {
    _loadSettings();
  }

  void _loadSettings() {
    _username = StorageService.getUsername();
    _difficulty = StorageService.getDifficulty();
  }

  void refreshSettings() {
    _loadSettings();
    notifyListeners();
  }
}