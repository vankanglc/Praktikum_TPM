import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuis_prak_tpm/disease_data.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:url_launcher/url_launcher.dart';


class HalamanDetail extends StatefulWidget {
  final Diseases diseases;
  const HalamanDetail({Key? key, required this.diseases}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Diseases', style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: () {
              String text = "Ditambah ke favorite";
              SnackBar snackBar = SnackBar(
                content: Text(text),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: ListView(
        children: [
          RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Image.network(widget.diseases.imgUrls)));
              }
          ),
          Container(

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Image.network(widget.diseases.imgUrls),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10,),
              Text(widget.diseases.name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold ),
                textAlign: TextAlign.center,),
              SizedBox(height: 20,),

              Text('Disease Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text(widget.diseases.name, style: TextStyle(fontSize: 16),),
              SizedBox(height: 15,),

              Text('Plant Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text(widget.diseases.plantName, style: TextStyle(fontSize: 16),),
              SizedBox(height: 15,),

              Text('Ciri-Ciri',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              for (var ciri in widget.diseases!.nutshell) textNut(ciri + " "),
              /*Text(widget.diseases.nutshell[0],),
              Text(widget.diseases.nutshell[1],),
              Text(widget.diseases.nutshell[2],),*/
              SizedBox(height: 15,),

              Text('Disease ID',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text(widget.diseases.id, style: TextStyle(fontSize: 16),),
              SizedBox(height: 15,),

              Text('Sympton',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text(widget.diseases.symptom, style: TextStyle(fontSize: 16),),

            ],
          ),
        ],
      ),
    );
  }
}

Widget textNut(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 16),
  );
}
