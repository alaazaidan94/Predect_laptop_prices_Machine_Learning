import 'package:flutter/material.dart';
class ProviderClass with ChangeNotifier{

  static String? BrandValue;
  changeBrandValue(newValue) {
    BrandValue = newValue;
    notifyListeners();
    print(BrandValue);
  }

  static String? StateValue;
  changeStateValue(newValue) {
    StateValue = newValue;
    notifyListeners();
    print(StateValue);
  }

  static String? CpuValue;
  changeCpuValue(newValue) {
    CpuValue = newValue;
    notifyListeners();
    print(CpuValue);
  }

  static String? GenValue;
  changeGenValue(newValue) {
    GenValue = newValue;
    notifyListeners();
    print(GenValue);
  }

  static String? CpuModelValue;
  changeCpuModelValue(newValue) {
    CpuModelValue = newValue;
    notifyListeners();
    print(CpuModelValue);
  }

  static String? ScreenResolutionValue;
  changeScreenResolutionValue(newValue) {
    ScreenResolutionValue = newValue;
    notifyListeners();
    print(ScreenResolutionValue);
  }

  static String? MemValue;
  changeMemValue(newValue) {
    MemValue = newValue;
    notifyListeners();
    print(MemValue);
  }

  static String? MemGenValue;
  changeMemGenValue(newValue) {
    MemGenValue = newValue;
    notifyListeners();
    print(MemGenValue);
  }

  static String? StorValue;
  changeStorValue(newValue) {
    StorValue = newValue;
    notifyListeners();
    print(StorValue);
  }

  static String? StorModelValue;
  changeStorModelValue(newValue) {
    StorModelValue = newValue;
    notifyListeners();
    print(StorModelValue);
  }



  static String? GpuValue;
  changeGpuValue(newValue) {
    GpuValue = newValue;
    notifyListeners();
    print(GpuValue);
  }

  static String? ScreenValue;
  changeScreenValue(newValue) {
    ScreenValue = newValue;
    notifyListeners();
    print(ScreenValue);
  }

  static String? GenWindowsValue;
  changeGenWindowsValue(newValue) {
    GenWindowsValue = newValue;
    notifyListeners();
    print(GenWindowsValue);
  }

  static String? BacklitValue;
  changeBacklitValue(newValue) {
    BacklitValue = newValue;
    notifyListeners();
    print(BacklitValue);
  }


}