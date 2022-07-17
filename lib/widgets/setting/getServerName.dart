import 'package:flutter/material.dart';
import 'package:flutter_mobile/providers/userServer.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/utilities/methodStyle/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServerName extends StatefulWidget {
  const ServerName({key}) : super(key: key);

  static var today = DateTime.now();

  @override
  State<ServerName> createState() => _ServerNameState();
}

class _ServerNameState extends State<ServerName> {
  String api = "";

  var formatedTanggal = DateFormat.Hm().format(ServerName.today);

  var formatedTahun = DateFormat.yMMMEd().format(ServerName.today);

  @override
  void initState() {
    getApiText();
    super.initState();
  }

  getApiText() async {
    final SharedPreferences getApi = await SharedPreferences.getInstance();
    setState(() {
      api = getApi.getString("setApi") ?? "-";
    });
  }

  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);

    return Container(
      margin: EdgeInsets.only(
          left: SizeConfig.blockHorizontal * 0,
          top: SizeConfig.blockVertical * 0),
      height: SizeConfig.blockVertical * 25,
      width: SizeConfig.blockHorizontal * 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Servers Name : ',
            style: nameServer.copyWith(fontSize: 11.sp),
          ),
          Text(
            'Clock in Time: ' + '  ' + formatedTanggal.toString(),
            style: nameServer.copyWith(fontSize: 11.sp),
          ),
          Text(
            'Date:  ' + ' ' + formatedTahun.toString(),
            style: nameServer.copyWith(fontSize: 11.sp),
          ),
          Text(
            'Local: ' + '  $api',
            style: nameServer.copyWith(fontSize: 11.sp),
          ),
        ],
      ),
    );
  }
}
