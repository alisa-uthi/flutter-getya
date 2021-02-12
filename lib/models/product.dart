import 'package:getya/models/pharmacy.dart';

class Product {
  String name;
  double price;
  String productType;
  String description;
  String imgPath;
  Pharmacy pharmacy;
  bool requiredPrescription;

  Product({
    this.description,
    this.imgPath,
    this.name,
    this.pharmacy,
    this.price,
    this.productType,
    this.requiredPrescription,
  });
}

List<Product> dummyProducts = [
  //Drug
  Product(
    name: "Painkiller",
    price: 75,
    productType: "Drug",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_product.png",
  ),
  Product(
    name: "Aspirin",
    price: 45,
    productType: "Drug",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_product.png",
  ),
  Product(
    name: "Paracetamol",
    price: 100,
    productType: "Drug",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_product.png",
  ),
  Product(
    name: "Antibiotic",
    price: 150,
    productType: "Drug",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_product.png",
  ),
  Product(
    name: "Zytec",
    price: 200,
    productType: "Drug",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_product.png",
  ),

  //Medical Equipment
  Product(
    name: "Med Equipment No.1",
    price: 75,
    productType: "Medical Equipment",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_med_equip.jpg",
  ),
  Product(
    name: "Med Equipment No.2",
    price: 75,
    productType: "Medical Equipment",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_med_equip.jpg",
  ),
  Product(
    name: "Med Equipment No.3",
    price: 75,
    productType: "Medical Equipment",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_med_equip.jpg",
  ),
  Product(
    name: "Med Equipment No.4",
    price: 75,
    productType: "Medical Equipment",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_med_equip.jpg",
  ),
  Product(
    name: "Med Equipment No.5",
    price: 75,
    productType: "Medical Equipment",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_med_equip.jpg",
  ),

  //Cosmeceutical
  Product(
    name: "Cosmeceutical No.1",
    price: 75,
    productType: "Cosmeceutical",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_cosmeceutical.jpg",
  ),
  Product(
    name: "Cosmeceutical No.2",
    price: 75,
    productType: "Cosmeceutical",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_cosmeceutical.jpg",
  ),
  Product(
    name: "Cosmeceutical No.3",
    price: 75,
    productType: "Cosmeceutical",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_cosmeceutical.jpg",
  ),
  Product(
    name: "Cosmeceutical No.4",
    price: 75,
    productType: "Cosmeceutical",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_cosmeceutical.jpg",
  ),
  Product(
    name: "Cosmeceutical No.5",
    price: 75,
    productType: "Cosmeceutical",
    description: "This is a description",
    requiredPrescription: false,
    pharmacy: dummyPharmacies[0],
    imgPath: "assets/images/product/default_cosmeceutical.jpg",
  ),
];
