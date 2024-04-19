import 'package:flutter/material.dart';
import 'package:mojiniedemo1/api/apiclass.dart';
import 'package:mojiniedemo1/models/details_responce.dart';

import 'Detailscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  List<Products> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "MOJINIE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final datas = data[index];
                    final title = datas.title;
                    final thumbnail = datas.thumbnail;
                    final price = datas.price;
                    final images = datas.images;

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detailscreen(
                                      images: images,
                                    )));
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Image.network(thumbnail.toString()),
                              Text(
                                "\$${price.toString()}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                              TextField(
                                controller: fname,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              TextField(
                                controller: lname,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              )
                              // Image.network(image.toString())
                            ],
                          )),
                    );
                  },
                );
              }),
        ));
  }

  Future<void> getData() async {
    final result = await Api().getData();
    final firstname = fname.text;
    final lastName = lname.text;

    final responce = await Api().registerData(firstname, lastName);
    setState(() {
      data = result;
    });
    //
    //'
    //'+ print(result);
  }
}
