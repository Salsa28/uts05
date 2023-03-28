import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Daftar_Tamu extends StatefulWidget {
  const Daftar_Tamu({Key? key}) : super(key: key);

  @override
  _Daftar_TamuState createState() => _Daftar_TamuState();
}

class _Daftar_TamuState extends State<Daftar_Tamu> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  TextEditingController alammatC = TextEditingController();

  String hasilResponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 32, 32),
        centerTitle: true,
        title: Text("Daftar Tamu"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Pekerjaan",
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: alammatC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Alamat",
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () async {
              var myresponse = await http.post(
                Uri.parse("https://reqres.in/api/users"),
                body: {
                  "name": nameC.text,
                  "job": jobC.text,
                  "alamat": alammatC.text
                },
              );

              Map<String, dynamic> data =
                  json.decode(myresponse.body) as Map<String, dynamic>;

              setState(() {
                hasilResponse =
                    "${data['name']} - ${data['job']} - ${data['alamat']}";
              });
            },
            child: Text("SUBMIT"),
          ),
          SizedBox(height: 50),
          Divider(
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Text(hasilResponse),
        ],
      ),
    );
  }
}
