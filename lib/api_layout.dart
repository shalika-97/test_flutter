import 'package:flutter/material.dart';
import 'package:test_new/corona_controller.dart';

import 'corona_result.dart';

class APILayout extends StatefulWidget {
  @override
  _APILayoutState createState() => _APILayoutState();
}

class _APILayoutState extends State<APILayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
          future: CoronaController().getCoronDetails(),
          builder:
              (BuildContext context, AsyncSnapshot<CoronaResult> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text("Loading..."));
            }
            final result = snapshot.data;
            final data = result.data;
            return Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Card(
                              child: Container(
                                  height: 100,
                                  color: Colors.greenAccent,
                                  child: Center(
                                    child: Text(
                                        "Global Deaths: ${data.globalDeaths}"),
                                  )))),
                      Expanded(
                          child: Card(
                              child: Container(
                                  color: Colors.redAccent,
                                  height: 100,
                                  child: Center(
                                      child: Text(
                                          "Local Deaths: ${data.localDeaths}"))))),
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: data.hospitalData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildHospitalData(data.hospitalData[index]);
                    },
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHospitalData(HospitalData hospitalData) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(hospitalData.hospital.nameSi),
            subtitle: Text(hospitalData.hospital.name),
          ),
          Row(
            children: [
              Spacer(),
              Text("Local: ${hospitalData.cumulativeLocal}"),
              Spacer(),
              Text("Foreign: ${hospitalData.cumulativeForeign}"),
              Spacer()
            ],
          )
        ],
      ),
    );
  }
}
