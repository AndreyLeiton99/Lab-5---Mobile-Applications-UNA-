import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(
            255, 114, 81, 69), // Cambiar color de AppBar a celeste
        title: Text('Menú'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout), // Usar icono de cerrar sesión
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear(); // Borrar todos los datos almacenados
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background.png'), // Ruta de la imagen de fondo
            fit: BoxFit.cover, // Ajustar la imagen para cubrir el contenedor
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'Bienvenidos a nuestra página de recetas', // Agregar mensaje de bienvenida
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Acá podrás encontrar muchas recetas de diferentes tipos de comida, busca la que más te guste y empieza a cocinar', // Agregar descripción
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                _buildImageContainer('assets/italiana.png'),
                _buildImageContainer('assets/mexicana.png'),
                _buildImageContainer('assets/vegetariana.png'),
                _buildImageContainer('assets/batidos.png'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar al menú de opciones de categorías
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryMenuScreen(),
                  ),
                );
              },
              child: Text(
                'Categorías',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(
                        255, 114, 81, 69)), // Cambiar color del botón a celeste
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildImageContainer(String imagePath) {
    return Container(
      width: 150, // Ancho deseado de la imagen
      height: 150, // Alto deseado de la imagen
      margin: EdgeInsets.all(8), // Margen entre imágenes
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover, // Ajustar la imagen para cubrir el contenedor
      ),
    );
  }
}

class CategoryMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth * 0.2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromARGB(255, 114, 81, 69), // Color del AppBar del menú
        title: Text('Categorías',
            style: TextStyle(fontSize: 24)), // Título con el mismo estilo
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background.png'), // Mismo fondo de imagen que MenuScreen
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navegar a la lista de recetas de pastas
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/pasta.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                        Text('Pastas',
                            style: TextStyle(
                                fontSize: 18)), // Estilo de texto similar
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navegar a la lista de recetas de postres
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/postres.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                        Text('Postres',
                            style: TextStyle(
                                fontSize: 18)), // Estilo de texto similar
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navegar a la lista de recetas de pizza
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/pizza.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                        Text('Pizza',
                            style: TextStyle(
                                fontSize: 18)), // Estilo de texto similar
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navegar a la lista de recetas de hamburguesas
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/hamburguesas.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                        Text('Hamburguesas',
                            style: TextStyle(
                                fontSize: 18)), // Estilo de texto similar
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeListScreen extends StatelessWidget {
  final String category;

  RecipeListScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas de $category'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Regresar al menú de opciones de categorías
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de descripción de la receta
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailScreen(),
                  ),
                );
              },
              child: Text('Receta 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de descripción de la receta
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailScreen(),
                  ),
                );
              },
              child: Text('Receta 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de la Receta'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Regresar al menú de recetas
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('Detalles de la receta'),
      ),
    );
  }
}
