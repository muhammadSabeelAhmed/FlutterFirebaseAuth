import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_integration/utils/collections.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController imageController = TextEditingController();


    addProduct() async {
      var product = FirebaseFirestore.instance.collection(MyCollections.products);
      await product.add({
        "name":nameController.text,
        "price":priceController.text,
        "description":descriptionController.text,
        "image":imageController.text
      })
      .then((value){
        nameController.text="";
        imageController.text="";
        priceController.text="";
        descriptionController.text="";
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Product Addedd successfully")));
      })
      .catchError((value)=>print("Error in add products: "+value));
      
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: priceController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Price',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Description',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: imageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Image',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              addProduct();
            },
            child: Text("Add Product"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size.fromHeight(50), // NEW
            ),
          )
        ],
      ),
    );
  }
}
