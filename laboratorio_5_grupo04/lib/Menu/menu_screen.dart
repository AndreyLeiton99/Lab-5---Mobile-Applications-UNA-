import 'package:flutter/material.dart';
import 'package:prueba/config/menu_items_recipes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(
            255, 114, 81, 69), // Cambiar color de AppBar a celeste
        title: const Text(
          'Menú principal',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ), // Usar icono de cerrar sesión
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background.png'), // Ruta de la imagen de fondo
            fit: BoxFit.cover, // Ajustar la imagen para cubrir el contenedor
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Text(
                    'Bienvenidos a nuestra página de recetas', // Agregar mensaje de bienvenida
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Acá podrás encontrar muchas recetas de diferentes tipos de comida, busca la que más te guste y empieza a cocinar', // Agregar descripción
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar al menú de opciones de categorías
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryMenuScreen(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(
                        255, 114, 81, 69)), // Cambiar color del botón a celeste
              ),
              child: const Text(
                'Categorías',
                style: TextStyle(color: Colors.white, fontSize: 20),
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
      margin: const EdgeInsets.all(8), // Margen entre imágenes
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover, // Ajustar la imagen para cubrir el contenedor
      ),
    );
  }
}

class CategoryMenuScreen extends StatefulWidget {
  const CategoryMenuScreen({super.key});

  @override
  _CategoryMenuScreenState createState() => _CategoryMenuScreenState();
}

class _CategoryMenuScreenState extends State<CategoryMenuScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 114, 81, 69), // Color del AppBar del menú
        title: const Text('Categorías',
            style: TextStyle(
                fontSize: 25,
                color: Colors.white)), // Título con el mismo estilo
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Buscar categoría',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Color.fromARGB(87, 114, 81, 69),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/background.png'), // Mismo fondo de imagen que MenuScreen
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: GridView.count(
                  padding: const EdgeInsets.only(top: 150),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: _buildCategoryCards(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCategoryCards() {
    List<String> categories = [
      'Pastas',
      'Postres',
      'Pizza',
      'Hamburguesas'
    ]; // Lista de categorías (aquí podrías cargarlas desde una fuente de datos externa)
    if (_searchQuery.isNotEmpty) {
      categories = categories
          .where((category) => category.toLowerCase().contains(_searchQuery))
          .toList();
    }
    return categories.map((category) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeListScreen(category: category),
            ),
          );
        },
        child: Column(
          children: [
            Image.asset(
              'assets/$category.png',
              width: MediaQuery.of(context).size.width * 0.42,
              height: MediaQuery.of(context).size.width * 0.42,
              fit: BoxFit.cover,
            ),
            Text(category,
                style:
                    const TextStyle(fontSize: 18)), // Estilo de texto similar
          ],
        ),
      );
    }).toList();
  }
}

class RecipeListScreen extends StatelessWidget {
  final String category;

  const RecipeListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final filteredRecipes =
        recipeMenuItems.where((recipe) => recipe.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Recetas de $category',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 114, 81, 69),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //todo: este es el que los mueve de arriba a abajo
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      //! este evita el scroll
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredRecipes.length,
                      itemBuilder: (context, index) {
                        final recipe = filteredRecipes[index];
                        return Card(
                          color: const Color.fromARGB(148, 233, 215, 181),
                          shadowColor: Colors.brown[500],
                          elevation: 8,
                          //! este el espacio entre tarjetas
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RecipeDetailScreen(recipe: recipe),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  //! Imagen de la receta
                                  SizedBox(
                                      width: 170, // Ancho deseado de la imagen
                                      height: 170, // Alto deseado de la imagen
                                      //margin: const EdgeInsets.all(8), // Margen entre imágenes
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.asset(
                                            'assets/food_template.jpg'),
                                      )),
                                  const SizedBox(height: 0),
                                  // Título de la receta
                                  Text(
                                    recipe.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      //color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Subtítulo de la receta
                                  Text(
                                    recipe.subTitle,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final MenuItem recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detalle de la Receta',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: const Color.fromARGB(255, 114, 81, 69),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Regresar al menú de recetas
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        // Permite desplazarse si el contenido excede la pantalla
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinea el contenido a la izquierda
            children: [
              // Imagen
              Center(
                child: SizedBox(
                    width: 220, // Ancho deseado de la imagen
                    height: 220, // Alto deseado de la imagen
                    //margin: const EdgeInsets.all(8), // Margen entre imágenes
                    child: ClipRRect(
                      //todo: remover el ClipRRect si no se va a poner borde circular a la imagen
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset('assets/food_template.jpg'),
                    )),
              ),
              const SizedBox(height: 10.0), // Espacio entre imagen y texto

              // Título
              Text(
                recipe.title,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                  height: 5.0), // Espacio entre título y subtítulo (opcional)

              // Subtítulo (opcional)
              Text(recipe.subTitle),

              const SizedBox(
                  height:
                      10.0), // Espacio entre subtítulo (opcional) y categoría

              // Categoría
              Text(
                'Categoría: ${recipe.category}',
                style: const TextStyle(fontSize: 16.0, color: Colors.grey),
              ),

              const SizedBox(
                  height: 15.0), // Espacio entre categoría e ingredientes

              // Ingredientes
              const Text(
                'Ingredientes:',
                style: TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                  height: 5.0), // Espacio entre título de ingredientes y lista
              _buildIngredientsList(recipe
                  .ingredients), // Widget para mostrar la lista de ingredientes

              const SizedBox(
                  height: 15.0), // Espacio entre ingredientes e instrucciones

              // Instrucciones
              const Text(
                'Instrucciones:',
                style: TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10,),
              // todo: cambiar el formato de las instrucciones similar a como estan los ingredientes
              Text(recipe.instructions, textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para mostrar la lista de ingredientes
  Widget _buildIngredientsList(List<String> ingredients) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Alinea los ingredientes a la izquierda
      children: ingredients.map((ingredient) => Text(ingredient)).toList(),
    );
  }

  // Widget para mostrar la lista de instrucciones
  Widget _buildInstructionsList(List<String> instructions) {
    return Column(
      children: instructions.asMap().entries.map((entry) {
        final stepNumber = entry.key + 1;
        final instruction = entry.value;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$stepNumber. ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(child: Text(instruction)),
          ],
        );
      }).toList(),
    );
  }
}
