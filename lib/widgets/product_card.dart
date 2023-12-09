import 'package:flutter/material.dart';

Card productCard(name,price,desc,image) {
   var heading = '$name';
   var subheading = '$price';
   var cardImage = NetworkImage('$image');
   var supportingText ='$desc';
   return Card(
       elevation: 4.0,
       child: Container(
         decoration:  BoxDecoration(
    image: DecorationImage(
        image: NetworkImage(image),
        fit: BoxFit.fill),
  ),
         child: Column(
           children: [
             ListTile(
               title: Text(heading,style: TextStyle(fontSize: 30),),
               subtitle: Text(subheading,style: TextStyle(fontSize: 20),),
               trailing: Icon(Icons.favorite_outline),
             ),
             Container(
               height: 200.0,
              //  child: Ink.image(
              //    image: cardImage,
              //    fit: BoxFit.cover,
              //  ),
             ),
             Container(
               padding: EdgeInsets.all(16.0),
               alignment: Alignment.centerLeft,
               child: Text(supportingText),
             ),
            //  ButtonBar(
            //    children: [
            //      TextButton(
            //        child: const Text('CONTACT AGENT'),
            //        onPressed: () {/* ... */},
            //      ),
            //      TextButton(
            //        child: const Text('LEARN MORE'),
            //        onPressed: () {/* ... */},
            //      )
            //    ],
            //  )
           ],
         ),
       ));
 }