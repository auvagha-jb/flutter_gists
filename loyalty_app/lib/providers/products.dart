import 'package:flutter/material.dart';
import 'package:shop_ke/providers/product.dart';

class Products with ChangeNotifier {
  static final dummyImage = 'http://demo.weblizar.com/explora-premium/wp-content/uploads/sites/81/2016/09/dummy-product_2.png';
  double productsTotal = 0;

  Map<String, List<Product>> _productsList = {
    'm1': [
//      Product(id: 'm11',
//        name: 'Double Action',
//        price: 200.00,
//        brand: 'Colgate',
//        imageUrl: dummyImage,
//        quantity: 1,
//        subtotal: 200.0,),
//      Product(id: 'm12',
//          name: 'Maximum Protection',
//          price: 250.00,
//          brand: 'Colgate',
//          imageUrl: dummyImage,
//          quantity: 1,
//          subtotal: 250.00),
    ],
    'm2': [
//      Product(id: 'm21',
//          name: 'Flat Iron 6"',
//          price: 2000.00,
//          brand: 'Darling',
//          imageUrl: 'https://copia.co.ke/wp-content/uploads/2019/05/Darling-Flat-Iron-Weave-Short-133_Weaves_2115_1.jpeg',
//          quantity: 1,
//          subtotal: 2000.0),
//      Product(id: 'm22',
//          name: 'Les Beiges',
//          price: 25000.00,
//          brand: 'Chanel',
//          imageUrl: 'http://dummyimage.com/250x250.jpg/ff4444/ffffff',
//          quantity: 1,
//          subtotal: 25000.00),
    ],
  };

  void decreaseProductsTotal(double productSubTotal) {
    productsTotal -= productSubTotal;
    notifyListeners();
  }

  void increaseProductsTotal(double productSubTotal) {
    productsTotal += productSubTotal;
    notifyListeners();
  }


  ///A getter to return a copy of the items list so that the items cannot be
  ///directly edited from another class
  Map<String, List<Product>> get productsList {
    return {..._productsList};
  }

  //Creates an empty list of products. Used when a new shopping list is created.
  void addEmptyList(String shoppingListId) {
    _productsList.putIfAbsent(shoppingListId, () => []);
  }


  //Adds a new item to list of products
  void addProduct(
      {@required String shoppingListId, @required Product product}) {
    final shoppingListItems = _productsList[shoppingListId];

    //Update the quantity and subtotal of the single item
    product.quantity = 1;
    product.subtotal = product.price;

    //Update the total price
    productsTotal += product.price;

    shoppingListItems.add(product);
    notifyListeners();
  }

  void deleteProduct({@required String shoppingListId,
    @required String productId,
    @required int index}) {
    _productsList[shoppingListId].removeAt(index);

    notifyListeners();
  }

  void onDeleteProduct(BuildContext context,
      {int index, Product product, Products products, String shoppingListId}) {
    //Update the productsTotal
    productsTotal -= product.subtotal;

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('${product.name} deleted'),
      duration: Duration(seconds: 10),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: () => products.undoDelete(index, shoppingListId, product),
      ),
    ));
  }

  void undoDelete(index, String shoppingListId, Product product) {
    //Update the total price of items
    productsTotal += product.price * product.quantity;

    //Return it to the list
    _productsList[shoppingListId].insert(index, product);
    notifyListeners();
  }
}
