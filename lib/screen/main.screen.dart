import 'package:flutter/material.dart';
import 'package:ngontrakkan/helper/color.dart';
import 'package:ngontrakkan/model/house_place.dart';
import 'package:ngontrakkan/screen/detail.screen.dart';
import 'package:ngontrakkan/screen/favorite.screen.dart';
import 'package:ngontrakkan/screen/notification.screen.dart';
import 'package:ngontrakkan/screen/profile.screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreen();
  }
}

class _MainScreen extends State<MainScreen> with TickerProviderStateMixin {
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
                  child: Text('Hi, there',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          fontSize: 15.0))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    child: Text('have some house rent nearby with you',
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
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body:  ListView(
            padding: EdgeInsets.symmetric(vertical: 55.0),
            children: HousePlaceList.map((place) {
              return FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(place: place);
                  }));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(place.imageAsset),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                place.name,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(place.location),
                              SizedBox(
                                height: 30,
                              ),
                              Text(place.description,
                                  overflow: TextOverflow.ellipsis),
                              SizedBox(
                                height: 5,
                              ),
                              Text(place.ticketPrice),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

        ));
  }
}
