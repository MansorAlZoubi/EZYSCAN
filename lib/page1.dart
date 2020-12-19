import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:flutter/services.dart' show rootBundle , ByteData;
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
class page extends StatefulWidget {
  @override
  _pageState createState() => _pageState();
}

class _pageState extends State<page> {
  bool isInitilized = false;
  String filepath;
  Directory filedir;
  var serialno;
   int cameraOcr=FlutterMobileVision.CAMERA_BACK;
  @override
  void initState() {
    FlutterMobileVision.start().then((value) {
      isInitilized = true;
    });
    updateExcel();
    super.initState();
  }

  Future<Null> _startScan() async {
    List<OcrText> list = [];

    try {
      list = await FlutterMobileVision.read(
        waitTap: true,
        camera: cameraOcr,

      );
      setState(() {
        serialno=list[0].value;
      });
    } catch (e) {

    }
  }
  String barcode="";

  Future<String> _scan()async{
    return await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.BARCODE).then((value) => barcode=value);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5f6f2e),
        title: Text('EZY SCAN'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: ()async{setState(() {
                          barcode= _scan().toString();
                        });
                        },
                        child: Card(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),

                          child: ListTile(
                            leading: Text('بدء تصوير باركود',
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),

                        child: GestureDetector(
                          onTap: (){

                            _startScan();
                          },
                          child: ListTile(
                            leading: Text('بدء تصوير سيريال',
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),

                        child: GestureDetector(
                          onTap: ()async{
                            filedir=await getApplicationDocumentsDirectory();
                            filepath=filedir.path;
                            updateExcel();
                          },
                          child: ListTile(
                            leading: Text('تصدير',
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),

                        child: GestureDetector(
                          onTap: ()async{
                            filedir=await getApplicationDocumentsDirectory();
                            filepath=filedir.path;
                            share();
                          },
                          child: ListTile(
                            leading: Text('ارسال',
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                        child: ListTile(
                          leading: Text('Refresh',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
  void updateExcel ()async{
    ByteData data = await rootBundle.load('Image/Test.xlsx');
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel=Excel.decodeBytes(bytes);
    Sheet sheet=excel['Sheet1'];
    sheet.appendRow([barcode,serialno]);

    excel.encode().then((onValue) {
      File(join("$filepath/Test.xlsx"))
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);
    });
    //Share.shareFiles(['$filepath/Test.xlsx'],text:'Share excel file');
    print("Done");
  }
  void share(){

    Share.shareFiles(['$filepath/Test.xlsx'],text:'Share excel file');
  }


}
//                                     هاذ الكود الجديد الي حكيتلك عنه
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
// import 'package:flutter/services.dart' show rootBundle , ByteData;
// import 'package:path/path.dart';
//
// import 'package:path_provider/path_provider.dart';
// import 'package:share/share.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart' as e;
// class page extends StatefulWidget {
//   @override
//   _pageState createState() => _pageState();
// }
//
// class _pageState extends State<page> {
//   int scellno=1;
//   int bcellno=1;
//   final e.Workbook workbook=new e.Workbook();
//   bool isInitilized = false;
//   File filepath;
//   Directory filedir;
//   var serialno;
//   int cameraOcr=FlutterMobileVision.CAMERA_BACK;
//   @override
//   void initState() {
//     saveExcel();
//     FlutterMobileVision.start().then((value) {
//       isInitilized = true;
//     });
//
//     super.initState();
//   }
//
//   Future<Null> _startScan() async {
//     List<OcrText> list = [];
//
//     try {
//       list = await FlutterMobileVision.read(
//         waitTap: true,
//         camera: cameraOcr,
//
//       );
//       setState(() {
//         serialno=list[0].value;
//       });
//     } catch (e) {
//
//     }
//   }
//   String barcode="";
//
//   Future<String> _scan()async{
//     return await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.BARCODE).then((value) => barcode=value);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF5f6f2e),
//         title: Text('EZY SCAN'),
//       ),
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       GestureDetector(
//                         onTap: ()async{setState(() {
//                           barcode= _scan().toString();
//
//                           final e.Worksheet sheet=workbook.worksheets[0];
//                           sheet.getRangeByName('B$bcellno').setText(barcode);
//                           scellno++;
//                           saveExcel();
//                         });
//                         },
//                         child: Card(
//
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
//
//                           child: ListTile(
//                             leading: Text('بدء تصوير باركور',
//                               // textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 40.0,
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
//
//                         child: GestureDetector(
//                           onTap: ()async{
//                             _startScan();
//                             // filedir=await getApplicationDocumentsDirectory();
//                             // filepath=filedir.path;
//                             final e.Worksheet sheet=workbook.worksheets[0];
//                             sheet.getRangeByName('A$scellno').setNumber(serialno);
//                             scellno++;
//                             saveExcel();
//
//                           },
//                           child: ListTile(
//                             leading: Text('بدء تصوير سيريال',
//                               textAlign: TextAlign.center,
//
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 40.0,
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
//
//                         child: GestureDetector(
//                           onTap: ()async{
//
//                             //updateExcel();
//                           },
//                           child: ListTile(
//                             leading: Text('تصدير',
//                               textAlign: TextAlign.center,
//
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 40.0,
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
//
//                         child: GestureDetector(
//                           onTap: ()async{
//                             filedir=await getApplicationDocumentsDirectory();
//                             filepath=File('$filedir/EzyScan.xlsx');
//                             share();
//                           },
//                           child: ListTile(
//                             leading: Text('ارسال',
//                               textAlign: TextAlign.center,
//
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 40.0,
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
//                         child: ListTile(
//                           leading: Text('Refresh',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   // void updateExcel ()async{
//   //   final e.Worksheet sheet=workbook.worksheets[0];
//   //   sheet.getRangeByName('A$scellno').setNumber(serialno);
//   //   sheet.getRangeByName('B$bcellno').setText(barcode);
//   //   scellno++;
//   //   saveExcel();
//   // }
//   void share(){
//
//     Share.shareFiles(['$filepath'],text:'Share excel file');
//   }
//   void saveExcel(){
//     List <int>bytes =workbook.saveAsStream();
//     File('EzyScan.xlsx').writeAsBytes(bytes);
//
//     //  workbook.dispose();
//   }
//
// }
//syncfusion_flutter_xlsio: ^18.4.30-beta
