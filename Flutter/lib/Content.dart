import 'package:flutter/material.dart';
import 'package:mlproject/Functions.dart';
import 'package:mlproject/ProviderClass.dart';
import 'package:provider/provider.dart';
import 'DropDownList.dart';

class Content extends StatelessWidget {
  var ke1 = GlobalKey();
  late BuildContext _context;
  var C_color1 = Colors.blue.shade100;
  var C_color2 = Colors.green.shade100;

  var DropList_color1 = Colors.blue.shade100;
  var DropList_color2 = Colors.green.shade100;

  var lable_Input_color = Colors.black54;
  var lable_font_weight = FontWeight.bold;
  var lable_font_size = 15.0;

  var drop_Item_color = Colors.black;
  var drop_Item_font_weight = FontWeight.bold;
  var drop_Item_font_size = 15.0;


  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7),child:const Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  showLoaderDialog2(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7),child:const Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pop();
          PriceDialog(_context);
        });
        return alert;
      },
    );
  }
  PriceDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Expected price",style: TextStyle(color: Colors.blue),),
      content: Text("Price Is: ${Functions.price}\$",style: TextStyle(color: Colors.red),),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return SafeArea(
      child:Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(children: const [
            Image(image: AssetImage("image/ml2.png"),width: 65,height: 65,color: Colors.black26),
            SizedBox(width:10,),
            Text("Machine Learning Application"),
          ]),
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          color: Colors.black38,
          child: Column(children: [
            Expanded(flex: 20, child:
            Padding(padding: const EdgeInsets.all(8),
              child: Form(
                key: ke1,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 8),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: C_color1,borderRadius: BorderRadius.circular(10)),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Icon(Icons.computer_outlined)),
                                  const SizedBox(width: 10,),
                                  Flexible(
                                    child: DropdownButtonFormField(
                                      dropdownColor: DropList_color1,
                                      borderRadius: BorderRadius.circular(10),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              width: 2,
                                              color: Colors.red,
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        labelText: 'Brand',
                                        labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),

                                      ),
                                      style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                      items: DropDownList.BradeList.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(), onChanged: (Object? value) {
                                      Provider.of<ProviderClass>(
                                          context,
                                          listen: false)
                                          .changeBrandValue(value);
                                    },
                                    ),
                                  )
                                ]),),
                                const SizedBox(width: 20,),
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Icon(Icons.mode)),
                                  const SizedBox(width: 10,),
                                  Flexible(child: DropdownButtonFormField(
                                    dropdownColor: DropList_color1,
                                    borderRadius: BorderRadius.circular(10),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            width: 2,
                                            color: Colors.red,
                                          )
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'State',
                                      labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                    ),
                                    style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                    items: DropDownList.StateList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(), onChanged: (Object? value) {
                                    Provider.of<ProviderClass>(
                                        context,
                                        listen: false)
                                        .changeStateValue(value);
                                  },
                                  ),)
                                ]),),
                              ],)
                        ),
                        const SizedBox(height: 10),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: C_color2,borderRadius: BorderRadius.circular(10)),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Icon(Icons.memory)),
                                  const SizedBox(width: 10,),
                                  Flexible(
                                    child: DropdownButtonFormField(
                                      dropdownColor: DropList_color2,
                                      borderRadius: BorderRadius.circular(10),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              width: 2,
                                              color: Colors.red,
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        labelText: 'CPU',
                                        labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                      ),
                                      style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                      items: DropDownList.CpuList.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(), onChanged: (Object? value) {
                                      Provider.of<ProviderClass>(
                                          context,
                                          listen: false)
                                          .changeCpuValue(value);
                                    },
                                    ),
                                  )
                                ]),),
                                const SizedBox(width: 20,),
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Text("G",style: TextStyle(color: Colors.blue,fontSize: 25,),)),
                                  const SizedBox(width: 10,),
                                  Flexible(child: DropdownButtonFormField(
                                    dropdownColor: DropList_color2,
                                    borderRadius: BorderRadius.circular(10),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            width: 2,
                                            color: Colors.red,
                                          )
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Generation',
                                      labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                    ),
                                    style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                    items: DropDownList.GenList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(), onChanged: (Object? value) {
                                    Provider.of<ProviderClass>(
                                        context,
                                        listen: false)
                                        .changeGenValue(value);
                                  },
                                  ),)
                                ]),),
                              ],)
                        ),
                        const SizedBox(height: 10),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: C_color1,borderRadius: BorderRadius.circular(10)),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Text("CM",style: TextStyle(color: Colors.blue,fontSize: 25,),)),
                                  const SizedBox(width: 10,),
                                  Flexible(
                                    child: DropdownButtonFormField(
                                      dropdownColor: DropList_color1,
                                      borderRadius: BorderRadius.circular(10),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              width: 2,
                                              color: Colors.red,
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        labelText: 'CPU Model',
                                        labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                      ),
                                      style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                      items: DropDownList.CpuModelList.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(), onChanged: (Object? value) {
                                      Provider.of<ProviderClass>(
                                          context,
                                          listen: false)
                                          .changeCpuModelValue(value);
                                    },
                                    ),
                                  )
                                ]),),
                                const SizedBox(width: 20,),
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Icon(Icons.access_alarm) ),
                                  const SizedBox(width: 10,),
                                  Flexible(child: DropdownButtonFormField(
                                    dropdownColor: DropList_color1,
                                    borderRadius: BorderRadius.circular(10),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            width: 2,
                                            color: Colors.red,
                                          )
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Screen Resolution',
                                      labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                    ),
                                    style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                    items: DropDownList.ScreenResolutionList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(), onChanged: (Object? value) {
                                    Provider.of<ProviderClass>(
                                        context,
                                        listen: false)
                                        .changeScreenResolutionValue(value);
                                  },
                                  ),)
                                ]),),
                              ],)
                        ),
                        const SizedBox(height: 10),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: C_color2,borderRadius: BorderRadius.circular(10)),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Icon(Icons.sd_card_rounded)),
                                  const SizedBox(width: 10,),
                                  Flexible(
                                    child: DropdownButtonFormField(
                                      dropdownColor: DropList_color2,
                                      borderRadius: BorderRadius.circular(10),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              width: 2,
                                              color: Colors.red,
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        labelText: 'Memory',
                                        labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                      ),
                                      style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                      items: DropDownList.MemList.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(), onChanged: (Object? value) {
                                      Provider.of<ProviderClass>(
                                          context,
                                          listen: false)
                                          .changeMemValue(value);
                                    },
                                    ),
                                  )
                                ]),),
                                const SizedBox(width: 20,),
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Icon(Icons.model_training)),
                                  const SizedBox(width: 10,),
                                  Flexible(child: DropdownButtonFormField(
                                    dropdownColor: DropList_color2,
                                    borderRadius: BorderRadius.circular(10),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            width: 2,
                                            color: Colors.red,
                                          )
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Memory Gen',
                                      labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                    ),
                                    style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                    items: DropDownList.MemGenList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(), onChanged: (Object? value) {
                                    Provider.of<ProviderClass>(
                                        context,
                                        listen: false)
                                        .changeMemGenValue(value);
                                  },
                                  ),)
                                ]),),
                              ],)
                        ),
                        const SizedBox(height: 10),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: C_color1,borderRadius: BorderRadius.circular(10)),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Icon(Icons.storage)),
                                  const SizedBox(width: 10,),
                                  Flexible(
                                    child: DropdownButtonFormField(
                                      dropdownColor: DropList_color1,
                                      borderRadius: BorderRadius.circular(10),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              width: 2,
                                              color: Colors.red,
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        labelText: 'Storage',
                                        labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                      ),
                                      style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                      items: DropDownList.StorList.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(), onChanged: (Object? value) {
                                      Provider.of<ProviderClass>(
                                          context,
                                          listen: false)
                                          .changeStorValue(value);
                                    },
                                    ),
                                  )
                                ]),),
                                const SizedBox(width: 20,),
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Icon(Icons.storage_sharp)),
                                  const SizedBox(width: 10,),
                                  Flexible(child: DropdownButtonFormField(
                                    dropdownColor: DropList_color1,
                                    borderRadius: BorderRadius.circular(10),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            width: 2,
                                            color: Colors.red,
                                          )
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Storage Model',
                                      labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                    ),
                                    style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                    items: DropDownList.StorModelList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(), onChanged: (Object? value) {
                                    Provider.of<ProviderClass>(
                                        context,
                                        listen: false)
                                        .changeStorModelValue(value);
                                  },
                                  ),)
                                ]),),
                              ],)
                        ),
                        const SizedBox(height: 10),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: C_color2,borderRadius: BorderRadius.circular(10)),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Icon(Icons.graphic_eq)),
                                  const SizedBox(width: 10,),
                                  Flexible(
                                    child: DropdownButtonFormField(
                                      dropdownColor: DropList_color2,
                                      borderRadius: BorderRadius.circular(10),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              width: 2,
                                              color: Colors.red,
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        labelText: 'GPU',
                                        labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                      ),
                                      style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                      items: DropDownList.GpuList.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(), onChanged: (Object? value) {
                                      Provider.of<ProviderClass>(
                                          context,
                                          listen: false)
                                          .changeGpuValue(value);
                                    },
                                    ),
                                  )
                                ]),),
                                const SizedBox(width: 20,),
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Icon(Icons.screenshot_monitor)),
                                  const SizedBox(width: 10,),
                                  Flexible(child: DropdownButtonFormField(
                                    dropdownColor: DropList_color2,
                                    borderRadius: BorderRadius.circular(10),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            width: 2,
                                            color: Colors.red,
                                          )
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Screen Size',
                                      labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                    ),
                                    style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                    items: DropDownList.ScreenList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(), onChanged: (Object? value) {
                                    Provider.of<ProviderClass>(
                                        context,
                                        listen: false)
                                        .changeScreenValue(value);
                                  },
                                  ),)
                                ]),),
                              ],)
                        ),
                        const SizedBox(height: 10),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: C_color1,borderRadius: BorderRadius.circular(10)),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Icon(Icons.settings_system_daydream)),
                                  const SizedBox(width: 10,),
                                  Flexible(
                                    child: DropdownButtonFormField(
                                      dropdownColor: DropList_color1,
                                      borderRadius: BorderRadius.circular(10),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              width: 2,
                                              color: Colors.red,
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        labelText: 'Genuine Windows ',
                                        labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                      ),
                                      style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                      items: DropDownList.GenWindowsList.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(), onChanged: (Object? value) {
                                      Provider.of<ProviderClass>(
                                          context,
                                          listen: false)
                                          .changeGenWindowsValue(value);
                                    },
                                    ),
                                  )
                                ]),),
                                const SizedBox(width: 20,),
                                Expanded(flex: 1,child: Row(children: [
                                  CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: const Icon(Icons.light_mode)),
                                  const SizedBox(width: 10,),
                                  Flexible(child: DropdownButtonFormField(
                                    dropdownColor: DropList_color1,
                                    borderRadius: BorderRadius.circular(10),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            width: 2,
                                            color: Colors.red,
                                          )
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Backlit Keyboard',
                                      labelStyle: TextStyle(color: lable_Input_color,fontWeight: lable_font_weight,fontSize: lable_font_size),
                                    ),
                                    style: TextStyle(color: drop_Item_color,fontSize: drop_Item_font_size,fontWeight:drop_Item_font_weight ),
                                    items: DropDownList.BacklitList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(), onChanged: (Object? value) {
                                    Provider.of<ProviderClass>(
                                        context,
                                        listen: false)
                                        .changeBacklitValue(value);
                                  },
                                  ),)
                                ]),),
                              ],)
                        ),
                        const SizedBox(height: 10,),

                      ],
                    ),
                  ],
                ),
              ),)),
            Expanded(flex: 2, child:
            Container(
                color: Colors.blue.shade500,
                height: 100,
                padding:  const EdgeInsets.fromLTRB(100, 7, 100, 7),
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade400),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade100),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )
                        )
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.dataset),
                        SizedBox(width: 10,),
                        Text('Send Data'),
                      ],
                    ),
                    onPressed: () {
                      showLoaderDialog2(context);
                      Functions.features(
                          ProviderClass.BrandValue,
                          ProviderClass.StateValue,
                          ProviderClass.CpuValue,
                          ProviderClass.GenValue,
                          ProviderClass.CpuModelValue,
                          ProviderClass.ScreenResolutionValue,
                          ProviderClass.MemValue,
                          ProviderClass.MemGenValue,
                          ProviderClass.StorValue,
                          ProviderClass.StorModelValue,
                          ProviderClass.GpuValue,
                          ProviderClass.ScreenValue,
                          ProviderClass.GenWindowsValue,
                          ProviderClass.BacklitValue
                      );
                    }
                )))
          ],),
        ),
      ),
    );
  }
}
