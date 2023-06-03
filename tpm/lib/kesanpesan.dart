import 'package:flutter/material.dart';
import 'konveksi_page.dart';

class KesanPesanPage extends StatefulWidget {
  @override
  _KesanPesanPageState createState() => _KesanPesanPageState();
}

class _KesanPesanPageState extends State<KesanPesanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kesan dan Pesan'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  //margin: EdgeInsets.only(top: 30, bottom: 40),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "Kesan dan Pesan",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Pesan :",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Kesan :",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
