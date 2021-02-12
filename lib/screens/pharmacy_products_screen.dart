import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/pharmacy.dart';
import 'package:getya/models/product.dart';
import 'package:getya/widgets/custom_drawer.dart';
import 'package:getya/widgets/product_card.dart';
import 'package:getya/widgets/view_cart_bottom_nav_bar.dart';

class PharmacyProductsScreen extends StatefulWidget {
  static final routeName = "/pharmacy/products";
  final Pharmacy pharmacy;
  PharmacyProductsScreen({this.pharmacy});

  @override
  _PharmacyProductsScreenState createState() => _PharmacyProductsScreenState();
}

class _PharmacyProductsScreenState extends State<PharmacyProductsScreen> {
  List<Product> _filteredProducts = [];
  List<Product> _originalProducts = [];
  int _selectedIndexCate = 0;

  void _getProductsOfPharmacy() {
    dummyProducts.forEach((product) {
      if (widget.pharmacy.name == product.pharmacy.name) {
        _originalProducts.add(product);
      }
    });
  }

  void _filterProductList(String query) {
    if (query.isNotEmpty) {
      query = query.toLowerCase().trim();
      List<Product> tempSeacrhResult = [];
      _filteredProducts.forEach((product) {
        if (product.name.toLowerCase().trim().contains(query)) {
          tempSeacrhResult.add(product);
        }
      });

      setState(() {
        _filteredProducts.clear();
        _filteredProducts.addAll(tempSeacrhResult);
      });
    } else {
      setState(() {
        _filteredProducts.clear();
        _filterProductCategory();
      });
    }
  }

  void _filterProductCategory() {
    List<Product> tempProducts = [];
    String category = '';
    switch (_selectedIndexCate) {
      case 1:
        category = "Medical Equipment";
        break;
      case 2:
        category = "Cosmeceutical";
        break;
      default:
        category = "Drug";
        break;
    }
    _originalProducts.forEach((product) {
      if (product.category == category) {
        tempProducts.add(product);
      }
    });

    setState(() {
      _filteredProducts.clear();
      _filteredProducts.addAll(tempProducts);
    });
  }

  @override
  void initState() {
    super.initState();
    _getProductsOfPharmacy();
    _filterProductCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          widget.pharmacy.name,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.black,
              ),
        ),
      ),
      bottomNavigationBar: ViewCartBottomNavBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2,
          vertical: kDefaultPadding,
        ),
        child: Column(
          children: [
            buildSearchField(),
            SizedBox(height: kDefaultPadding / 2),
            _originalProducts.isNotEmpty
                ? Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: buildProductCategoryList(context),
                      ),
                    ),
                  )
                : Container(),
            SizedBox(height: kDefaultPadding / 2),
            _filteredProducts.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _filteredProducts.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: _filteredProducts[index]);
                      },
                    ),
                  )
                : Text("No products in ${widget.pharmacy.name}"),
          ],
        ),
      ),
    );
  }

  List<Widget> buildProductCategoryList(BuildContext context) {
    return List.generate(3, (index) {
      List<String> categories = ["Drug", "Medical Equipment", "Cosmeceutical"];
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndexCate = index;
            _filterProductCategory();
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Container(
            decoration: _selectedIndexCate == index
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 5,
                      ),
                    ),
                  )
                : null,
            child: Text(
              categories[index],
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      );
    });
  }

  TextFormField buildSearchField() {
    return TextFormField(
      decoration: inputDecoration.copyWith(
        hintText: "Search product",
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Icon(
            Icons.search,
            size: 25,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minHeight: 25,
          minWidth: 25,
        ),
      ),
      onChanged: (query) {
        _filterProductList(query);
      },
    );
  }
}
