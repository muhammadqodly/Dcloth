import 'package:dcloth/main.dart';
// import 'package:dcloth/screens/donate.dart';
import 'package:dcloth/screens/donate/components/body.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class contentForYou extends StatelessWidget {
  List data = [];
  contentForYou({
    Key? key,
  }) : super(key: key);

  Future<void> getDonate() async {
    data = await MyApp().databaseHelper.getWatchlistMovies();
  }

  @override
  Widget build(BuildContext context) {
    getDonate();
    return Column(
      children: [
        sectionTitle(
          text: "My Donation",
          press: () {},
        ),
        SizedBox(
          height: getProportionateScreenWidth(25),
        ),
        SingleChildScrollView(
          child: Container(
            height: 200,
            child: FutureBuilder(
              future: MyApp().databaseHelper.getWatchlistMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List data = snapshot.data as List;
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      print(data);
                      return DonateCard(
                          title: data[index]['phone'],
                          address: data[index]['address'],
                          weight: data[index]['weight']);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: data.length,
                  );
                }
              },
            ),
            // ListView.separated(
            //   itemBuilder: (context, index) {
            //     return Container();
            //     // return DonateCard(
            //     //     title: data[index].phone,
            //     //     address: data[index].address,
            //     //     weight: data[index].weight);
            //   },
            //   separatorBuilder: (context, index) {
            //     return const SizedBox(
            //       height: 20,
            //     );
            //   },
            //   itemCount: 0,
            // ),
          ),
        ),
      ],
    );
  }
}

class DonateCard extends StatelessWidget {
  final String title;
  final String address;
  final String weight;
  const DonateCard(
      {Key? key,
      required this.title,
      required this.address,
      required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Column(
          children: [
            Text("No. HP : " + title),
            Text("Berat Donasi : " + weight + " Kg"),
          ],
        ),
        subtitle: Center(
          child: Text("Alamat Donatur: " + address),
        ));
  }
}
