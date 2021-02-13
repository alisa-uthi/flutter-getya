import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/pharmacy.dart';
import 'package:getya/widgets/custom_drawer.dart';
import 'package:getya/widgets/view_cart_bottom_nav_bar.dart';

import 'components/pharmacy_card.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _filteredPharmacies = List<Pharmacy>();

  @override
  void initState() {
    _filteredPharmacies.addAll(dummyPharmacies);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Pharmacy> dummySearchList = dummyPharmacies;
    if (query.isNotEmpty) {
      List<Pharmacy> dummyListData = List<Pharmacy>();
      query = query.toLowerCase().trim();

      dummySearchList.forEach((pharmacy) {
        if (pharmacy.name.toLowerCase().trim().contains(query)) {
          dummyListData.add(pharmacy);
        }
        setState(() {
          _filteredPharmacies.clear();
          _filteredPharmacies.addAll(dummyListData);
        });
      });
    } else {
      setState(() {
        _filteredPharmacies.clear();
        _filteredPharmacies.addAll(dummyPharmacies);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: buildAppBar(),
      bottomNavigationBar: ViewCartBottomNavBar(),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding / 2,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nearest Pharmacy",
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              children: [
                Icon(
                  Icons.edit_location,
                  color: kRedColor,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text("Current location"),
              ],
            ),
            Text("Phutthamonthon, Salaya, Nakorn Pathom"),
            SizedBox(height: kDefaultPadding / 2),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredPharmacies.length,
                itemBuilder: (context, index) {
                  return PharmacyCard(pharmacy: _filteredPharmacies[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Container(
        child: TextFormField(
          decoration: inputDecoration.copyWith(
              hintText: "Find Pharmacy",
              hintStyle: TextStyle(fontSize: 18),
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: Icon(Icons.search, size: 25),
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 25,
                minHeight: 25,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 5)),
          onChanged: (query) {
            filterSearchResults(query);
          },
        ),
      ),
    );
  }
}
