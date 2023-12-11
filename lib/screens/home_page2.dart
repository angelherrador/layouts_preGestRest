import 'package:flutter/material.dart';

import 'dishes_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String,dynamic>> families = [
      {'id': 1, 'name': 'Bebidas', 'image': 'assets/dishes/bebidas/vino_tinto.jpg'},
      {'id': 2, 'name': 'Entrantes', 'image': 'assets/dishes/ensaladas/ensalada_arroz.jpg'},
      {'id': 3, 'name': 'Carnes', 'image': 'assets/dishes/carne/escalope.jpg'},
      {'id': 4, 'name': 'Pescado', 'image': 'assets/dishes/pescado/trucha_patata.jpg'},
      {'id': 5, 'name': 'Marisco', 'image': 'assets/dishes/marisco/gambas.jpg'},
      {'id': 6, 'name': 'Postre', 'image': 'assets/dishes/postres/tarta_queso.jpg'},
      {'id': 7, 'name': 'Cafés', 'image': 'assets/dishes/cafe/cafe_negro.jpg'},
    ];

    final totalFamilies=families.length;
    
    Widget gridFamilies=GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Cantidad de columnas
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: families.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Image.network(families[index]['image']),
                Text(families[index]['name']),
              ],
            ),
          );
        },
      );

    // Widget listFamilies = Container(
    //
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       for (int i=0;i<10;i++)
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: _buildFamilies('Ensaladas', 'assets/dishes/ensaladas/ensalada_arroz.jpg'),
    //         ),
    //       //_buildFamilies('Mariscos', 'assets/dishes/marisco/gambas.jpg'),
    //       //_buildFamilies('Postres', 'assets/dishes/postres/tarta_oreo.jpg'),
    //     ],
    //   ),
    // );

    Widget listFavorites= SizedBox(
      height:60,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildFavorites('Paella', 'assets/dishes/marisco/paella.jpg'),
          _buildFavorites('Mariscos','assets/dishes/marisco/gambas.jpg'),
          _buildFavorites('Mejillones','assets/dishes/marisco/mejillones_vapor.jpg'),
          _buildFavorites('Paella', 'assets/dishes/marisco/paella.jpg'),
          _buildFavorites('Mariscos','assets/dishes/marisco/gambas.jpg'),
          _buildFavorites('Mejillones','assets/dishes/marisco/mejillones_vapor.jpg'),
          _buildFavorites('Paella', 'assets/dishes/marisco/paella.jpg'),
          _buildFavorites('Mariscos','assets/dishes/marisco/gambas.jpg'),
          _buildFavorites('Mejillones','assets/dishes/marisco/mejillones_vapor.jpg'),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Example layouts.'),
      ),
      body: ListView(
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(textAlign: TextAlign.left,'Favoritos ',),
            listFavorites,
            const SizedBox(height: 10),
            Text(textAlign: TextAlign.left,'Familias $totalFamilies',),
            //listFamilies,
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // number of items in each row
                mainAxisSpacing: 8.0, // spacing between rows
                crossAxisSpacing: 8.0, // spacing between columns
              ),
              padding: const EdgeInsets.all(8.0), // padding around the grid
              itemCount: families.length, // total number of items
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.blue, // color of grid items
                  child: const Center(
                    // child: Text(
                    //   families[index]['name'],
                    //   style: const TextStyle(fontSize: 18.0, color: Colors.white),
                      child: Text('hello'),
                    ),
                );
              },
            )
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

Builder _buildFamilies(String label, String familyImage) {
  return Builder(
    builder: (context) {
      return Column(
          children:[
            Container(
              width:120,height: 100,
              padding: const EdgeInsets.all(20),
              //padding: const EdgeInsets.fromLTRB(10,10,10,10),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(familyImage),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,//Color(0xffA4A4A4),
                      offset: Offset(1.0, 5.0),
                      blurRadius: 3.0,
                    ),
                  ]),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DishesPage(label)));
                },
                ),
              ),
            const SizedBox(height: 5),
            Text(label),
          ]
      );
    }
  );
}

Builder _buildFavorites(String label, String favoriteImage) {
  return Builder(
      builder: (context) {
        return Container(
                margin: const EdgeInsets.only(right: 10.0),
                width:100,height: 20,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(favoriteImage),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,//Color(0xffA4A4A4),
                        offset: Offset(1.0, 5.0),
                        blurRadius: 3.0,
                      ),
                    ]),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            DishesPage(label)));
                  },
                ),
              );
      }
  );
}