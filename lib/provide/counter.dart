import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int _value = 1;
  int get value => _value;
  void increment(){
    _value++;
    notifyListeners();
  }
}