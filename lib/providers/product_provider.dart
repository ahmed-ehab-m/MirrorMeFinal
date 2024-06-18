// FutureBuilder(
//   future: FirebaseFirestore.instance.collection('products').doc('WRW6rpb4KlvycTW20kXy').get(),
//   builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return CircularProgressIndicator();
//     }
//     if (snapshot.hasError) {
//       return Text("Error: ${snapshot.error}");
//     }

//     var data = snapshot.data!.data();

//     if (data == null) {
//       return Text("Document not found");
//     }

//     Product product = Product(
//       image: data['image'],
//       name: data['name'],
//       price: data['price'],
//     );

//     return ProductWidget(
//       product: product,
//       onTap: () {
//         Navigator.pushNamed(context, productRoutes[index],
//             arguments: product.name);
//       },
//     );
//   },
// )
