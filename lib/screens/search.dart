import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/models/product.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/screens/prodcut_page.dart';

class SearchPage extends StatefulWidget {
  static String id = 'SearchPage';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Productone> _searchResults = [];
  User? _user;
  List<String> _recentSearches = [];

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    _fetchRecentSearches();
  }

  Future<void> _fetchRecentSearches() async {
    if (_user != null) {
      CollectionReference recentSearchesRef = FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .collection('recentSearches');

      QuerySnapshot querySnapshot = await recentSearchesRef.get();
      List<String> searches = [];
      querySnapshot.docs.forEach((doc) {
        searches.add(doc['query']);
      });

      setState(() {
        _recentSearches = searches;
      });
    }
  }

  Future<void> _updateRecentSearches(String query) async {
    if (_user != null) {
      CollectionReference recentSearchesRef = FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .collection('recentSearches');

      await recentSearchesRef.add({'query': query});
    }
  }

  Future<void> _searchProducts(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    await _updateRecentSearches(query);

    List<QuerySnapshot> querySnapshots = await Future.wait([
      FirebaseFirestore.instance
          .collection('tshirtone')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: query + '\uf8ff')
          .get(),
      FirebaseFirestore.instance
          .collection('dressescollection')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: query + '\uf8ff')
          .get(),
    ]);

    List<Productone> results = [];
    for (QuerySnapshot querySnapshot in querySnapshots) {
      for (DocumentSnapshot doc in querySnapshot.docs) {
        results.add(Productone(
          id: doc.id,
          name: doc['name'],
          price: doc['price'],
          image: doc['image'],
          Adress: '',
          phone: '',
          username: '',
        ));
      }
    }

    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchProducts(_searchController.text);
                  },
                ),
              ),
              onChanged: (text) {
                _searchProducts(text);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final product = _searchResults[index];
                return ListTile(
                  leading: Image.network(
                    product.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProdcutPage(p1: product),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (_recentSearches.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recent Searches:', style: TextStyle(fontWeight: FontWeight.bold)),
                  for (String search in _recentSearches)
                    GestureDetector(
                      onTap: () {
                        _searchController.text = search;
                        _searchProducts(search);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(search),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}