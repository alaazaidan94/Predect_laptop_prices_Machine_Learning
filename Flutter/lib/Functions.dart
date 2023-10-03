import 'dart:async';
import 'package:http/http.dart' as http;

class Functions{
  static var price;
  static features(Brand,State,Cpu,Gen,CpuModel,ScreenRe,Memory,MemoryGen,Storage,StorageModel,Gpu,ScreenSize,GenWindows,Backlit) async{
    var request = await http.post(Uri.https("0684-212-174-87-123.ngrok-free.app","/feature/features",{
      "Brand":"$Brand",
      "State":"$State",
      "Cpu":"$Cpu",
      "Gen":"$Gen",
      "CpuModel":"$CpuModel",
      "ScreenRe":"$ScreenRe",
      "Memory":"$Memory",
      "MemoryGen":"$MemoryGen",
      "Storage":"$Storage",
      "StorageModel":"$StorageModel",
      "Gpu":"$Gpu",
      "ScreenSize":"$ScreenSize",
      "GenWindows":"$GenWindows",
      "Backlit":"$Backlit",
    }));
    price = request.body.toString();
  }
}