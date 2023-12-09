import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_integration/utils/collections.dart';
import 'package:flutter_firebase_integration/views/add_products_view.dart';
import 'package:flutter_firebase_integration/widgets/product_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    getProduct() async {
      var product =
          FirebaseFirestore.instance.collection(MyCollections.products);
    return await product.get();
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
            future: getProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index){
                  var mData=snapshot.data?.docs[index];
                  // return Text(mData?["name"]);
                  return productCard(mData?["name"], mData?["price"], mData?["description"], mData?["image"]);
                });
                // return Text(snapshot.data?.docs[0]["name"]);
              } else {
                return  Center(child: LinearProgressIndicator());
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddProductsView()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
