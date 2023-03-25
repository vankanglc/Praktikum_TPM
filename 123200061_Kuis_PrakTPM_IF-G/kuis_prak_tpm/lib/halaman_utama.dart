import 'package:flutter/material.dart';
import 'disease_data.dart';
import 'halaman_detail.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Plant Diseases', style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.5)
              ),
                itemCount: listDisease.length,
                itemBuilder: (context, index){
            final Diseases diseases = listDisease[index];
            return InkWell(
                onTap: (){
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => HalamanDetail(diseases: diseases,),
                   ),
                 );
                },
                child: Card(
                  child: Column(
                  children: [
                    Expanded(
                      child :
                        Image.network(diseases.imgUrls, fit: BoxFit.cover, width: double.infinity, height: 200,),
                    ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                    child: Text(diseases.name, textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ],
                ),
                ),
            );
          },
        )
    );
  }
}

