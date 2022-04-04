import 'package:flutter/material.dart';
import 'package:ngontrakkan/helper/color.dart';
import 'package:ngontrakkan/model/house_place.dart';
import 'package:ngontrakkan/screen/detail.screen.dart';
import 'package:ngontrakkan/screen/home.screen.dart';
import 'package:ngontrakkan/screen/notification.screen.dart';
import 'package:ngontrakkan/screen/profile.screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteScreen();
  }
}

class _FavoriteScreen extends State<FavoriteScreen> {
  var HousePlaceList = [
    HousePlace(
      name: 'Rumah di kontrakkan bulanan,tahunan fully furnished murah di bali',
      location: 'Denpasar Selatan, Denpasar Kota, Bali',
      description:
          'Rumah di sewakan bulanan atau tahunanfully furnished murah di bali lokasi strategis timur simpang dewa ruci ,kuta dekat bypass dengan 3 kamar tidur full ac,extra bed di setiap kamar( free),2 kamar mandi dengan water heater,peralatan dapur lengkap,kulkas,magic con,dispenser,day bed di ruang tamu,tv led,parkir sangat luas,lingkungan aman dan nyaman tersedia 2 unit rumah juga dengan masing" unit 2 kamar tidur di lokasi yangsama ,call atau wa pemilik langsung ibu ayuk',
      openDays: '3 KT - 2 KM - 80 m2',
      openTime: '09:00 - 20:00',
      ticketPrice: 'Rp 5.000.000',
      imageAsset:
          'https://apollo-singapore.akamaized.net:443/v1/files/8md40qmw5xze1-ID/image;s=280x0;q=60 320w',
      imageUrls: [
        'https://apollo-singapore.akamaized.net:443/v1/files/8md40qmw5xze1-ID/image;s=280x0;q=60 320w',
        'https://apollo-singapore.akamaized.net/v1/files/bywdb3qkp9nt3-ID/image;s=280x0;q=60%20320w',
        'https://apollo-singapore.akamaized.net:443/v1/files/pl5c4yscrulc-ID/image;s=280x0;q=60 320w'
      ],
    ),
    HousePlace(
      name: 'Dikontrakkan Rumah Dekat Telkom University, TransMart dan Yogya',
      location: 'Bojongsoang, Bandung Kab., Jawa Barat',
      description:
          'DeskripsiRumahdalamCluster,lokasistrategis.Hanya10menitdarigerbangtolBuahBatuHanya7menitkeTransMartBuahBatuHanya7menitkeYogyaBojongsoangHanya10menitkekampusTelkomUniversityDekatMinimarketdanATMDekatsekolah-sekolahDekatklinikLuasTanah72m2LuasBangunan36m22kamartidur1KamarMandiKitchensetRuangserbaguna(tamu/keluarga)Cluster(onegatesystem)Listrik1300WattAirJernih(Sumberair:sumursummersible)DekatmasjidKeamanan24JamRp23.000.000/tahun',
      openDays: '2 KT - 1 KM - 36 m2',
      openTime: '09:00 - 14:30',
      ticketPrice: 'Rp 23.000.000',
      imageAsset:
          'https://apollo-singapore.akamaized.net:443/v1/files/zt20upqmjwf41-ID/image;s=280x0;q=60 320w',
      imageUrls: [
        'https://apollo-singapore.akamaized.net:443/v1/files/zt20upqmjwf41-ID/image;s=280x0;q=60 320w',
        'https://apollo-singapore.akamaized.net:443/v1/files/okvd8hn2e0yr3-ID/image;s=280x0;q=60 320w',
        'https://apollo-singapore.akamaized.net:443/v1/files/gmqv3gxethzh-ID/image;s=280x0;q=60 320w',
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor("#B7DED9"),
              title: Column(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Favorite',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            fontSize: 15.0))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      child: Text('you have 1 favorite house of rent',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              fontSize: 13.0)),
                      onTap: () {
                        print("tapped subtitle");
                      },
                    ))
              ]),
              titleSpacing: 28.0,
              centerTitle: false,
              toolbarHeight: 50.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              elevation: 0.00,
            ),
            body: SafeArea(
              child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Card(
                    elevation: 8.0,
                    margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    child: Container(
                      decoration:
                      BoxDecoration(color: HexColor("#B7DED9")),
                      child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.black))),
                            child: Icon(Icons.home_rounded, color: Colors.black),
                          ),
                          title: Text(
                            "Refund booking for apartement",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: <Widget>[
                              Icon(Icons.favorite_border_sharp, color: Colors.red),
                              Text(" new",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600 ))
                            ],
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right,
                              color: Colors.black, size: 30.0)),
                    ),
                  )
              ),
            ),
            resizeToAvoidBottomInset: false, backgroundColor: Colors.white));
  }
}
