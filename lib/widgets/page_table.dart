import 'package:flutter/material.dart';
import 'package:flutter_mobile/bloc/bloc_model_color.dart';
import 'package:flutter_mobile/model/table.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/screens/input_customer_count.dart';
import 'package:flutter_mobile/screens/logout.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/widgets/summery_page.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class ViewTable extends StatefulWidget {
  @override
  State<ViewTable> createState() => _PageTableState();
}

class _PageTableState extends State<ViewTable> {
  bool _isLoading = true;

  @override
  void initState() {
    if (mounted) {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
      });
    }

    getProducts();
    getTab();
    getSection();

    super.initState();
  }

  getSection() async {
    await Provider.of<SectionTable>(context, listen: false).getSection();
  }

  getProducts() async {
    await Provider.of<ProductProviders>(context, listen: false).getData();
  }

  getTab() async {
    await Provider.of<TableProviders>(context, listen: false).getTable();
  }

  @override
  Widget build(BuildContext context) {
    TableProviders tableProviders = Provider.of<TableProviders>(context);
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Container(
            margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 23),
            child: Image.asset('images/qoligo_white.png',
                width: SizeConfig.blockHorizontal * 22,
                height: SizeConfig.blockVertical * 22),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LogOut()));
            },
            icon: Icon(Icons.settings),
          ),
          actions: [],
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Material(
                  elevation: 4,
                  child: Stack(
                    children: [
                      Container(
                        height: SizeConfig.blockVertical * 10,
                        width: SizeConfig.blockHorizontal * 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockHorizontal * 3,
                                      top: SizeConfig.blockVertical * 3),
                                  child: Text(
                                    'Section/Floor : ',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockHorizontal * 1,
                                      top: SizeConfig.blockVertical * 2.5),
                                  width: SizeConfig.blockHorizontal * 64,
                                  height: SizeConfig.blockVertical * 5,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      hint: Container(
                                        margin: EdgeInsets.only(
                                            left: SizeConfig.blockVertical * 2),
                                        child: Text(
                                          "Indoor",
                                          style: TextStyle(
                                            fontFamily: ' Montserrat',
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      elevation: 0,
                                      items: _dropDownItem(),
                                      onChanged: (value) {
                                        switch (value) {
                                          case 'Indoor':
                                            break;
                                          case 'Outdoor':
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: SizeConfig.blockVertical * 1),
                height: SizeConfig.blockVertical * 67,
                width: SizeConfig.blockHorizontal * 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 0,
                  padding: EdgeInsets.all(1),
                  childAspectRatio: 1,
                  children: tableProviders.tables
                      .map((products) => TableArea(products))
                      .toList(),
                )),
          ],
        ),
      );
    });
  }
}

List<DropdownMenuItem<String>> _dropDownItem() {
  List<String> dll = ['Indoor', 'Outdoor'];
  return dll
      .map(
        (value) => DropdownMenuItem(value: value, child: Text(value)),
      )
      .toList();
}

class TableArea extends StatefulWidget {
  final TableManagement products;
  TableArea(this.products);

  @override
  State<TableArea> createState() => _TableAreaState();
}

class _TableAreaState extends State<TableArea> {
  bool _buttonPressed = true;

  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = ColorBloc();
    return Row(
      children: [
        StreamBuilder<Color>(
          stream: bloc.stateStream,
          initialData: Colors.grey.shade300,
          builder: (context, snapshot) {
            return GestureDetector(
              onTap: () {
                if (widget.products.tableName.contains("T-1")) {
                  setState(() {});
                } else if (widget.products.tableName.contains("T-2")) {
                  setState(() {});
                } else if (widget.products.tableName.contains("T-3")) {
                  setState(() {});
                }
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.blockHorizontal * 2.5,
                    top: SizeConfig.blockVertical * 2),
                height: SizeConfig.blockVertical * 25,
                width: SizeConfig.blockHorizontal * 46,
                decoration: BoxDecoration(
                  color: _buttonPressed ? snapshot.data : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    widget.products.tableName,
                    style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
