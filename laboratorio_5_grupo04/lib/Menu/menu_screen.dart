import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/config/menu_items_recipes.dart';
import 'package:prueba/providers/login_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});
  
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0; // Estado para indicar la pantalla activa

  @override
  Widget build(BuildContext context) {

    final loginProvider = context.watch<LoginProvider>();
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 81, 69),
        title: const Text(
          'Menú principal',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(
            255, 114, 81, 69), // Color de fondo de la barra de navegación
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star), // Icono de recetas populares
            label: 'Menú Principal', // Texto de recetas populares
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category), // Icono de categorías
            label: 'Categorías', // Texto de la categoría
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite), // Icono de favoritos
            label: 'Favoritos', // Texto de favoritos
          ),
        ],
        currentIndex: _selectedIndex, // Estado actual
        selectedItemColor: Colors.white, // Color de texto seleccionado
        onTap: (int index) {
          setState(() {
            _selectedIndex =
                index; // Actualizar el estado al cambiar de pantalla
          });
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryMenuScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoriteRecipesScreen(),
              ),
            );
          }
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Text(
                    'Bienvenidos a nuestra página de recetas, ${loginProvider.username}',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Acá podrás encontrar muchas recetas de diferentes tipos de comida, busca la que más te guste y empieza a cocinar',
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
                _buildImageContainer('assets/principal/italiana.png'),
                _buildImageContainer('assets/principal/mexicana.png'),
                _buildImageContainer('assets/principal/vegetariana.png'),
                _buildImageContainer('assets/principal/batidos.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _buildImageContainer(String imagePath) {
    return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.all(8),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}

class FavoriteRecipesScreen extends StatefulWidget {
  const FavoriteRecipesScreen({super.key});

  @override
  _FavoriteRecipesScreenState createState() => _FavoriteRecipesScreenState();
}

class _FavoriteRecipesScreenState extends State<FavoriteRecipesScreen> {
  int _selectedIndex = 2; // Estado para indicar la pantalla activa

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 81, 69),
        title: const Text(
          'Recetas Favoritas',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(
            255, 114, 81, 69), // Color de fondo de la barra de navegación
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star), // Icono de recetas populares
            label: 'Menú Principal', // Texto de recetas populares
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category), // Icono de categorías
            label: 'Categorías', // Texto de la categoría
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite), // Icono de favoritos
            label: 'Favoritos', // Texto de favoritos
          ),
        ],
        currentIndex: _selectedIndex, // Estado actual
        selectedItemColor: Colors.white, // Color de texto seleccionado
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MenuScreen(),
              ),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryMenuScreen(),
              ),
            );
          }
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<String>>(
          future: _getFavoriteRecipes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No hay recetas favoritas.'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final recipeTitle = snapshot.data![index];
                  final recipe = RecipeMenu.recipeMenuItems.firstWhere(
                    (item) => item.title == recipeTitle,
                  );
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailScreen(recipe: recipe),
                        ),
                      );
                    },
                    child: Card(
                      color: const Color.fromARGB(148, 233, 215, 181),
                      shadowColor: Colors.brown[500],
                      elevation: 8,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 170,
                              height: 170,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(recipe.imageUrl),
                              ),
                            ),
                            const SizedBox(height: 0),
                            Text(
                              recipe.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
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
              );
            }
          },
        ),
      ),
    );
  }

  // Método para obtener la lista de recetas favoritas del usuario desde SharedPreferences
  Future<List<String>> _getFavoriteRecipes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteRecipes =
        prefs.getStringList('favoriteRecipes') ?? [];
    return favoriteRecipes;
  }
}

class CategoryMenuScreen extends StatefulWidget {
  const CategoryMenuScreen({super.key});

  @override
  _CategoryMenuScreenState createState() => _CategoryMenuScreenState();
}

class _CategoryMenuScreenState extends State<CategoryMenuScreen> {
  int _selectedIndex = 1; // Estado para indicar la pantalla activa

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 81, 69),
        title: const Text(
          'Categorías',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(
            255, 114, 81, 69), // Color de fondo de la barra de navegación
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star), // Icono de recetas populares
            label: 'Menú Principal', // Texto de recetas populares
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category), // Icono de categorías
            label: 'Categorías', // Texto de la categoría
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite), // Icono de favoritos
            label: 'Favoritos', // Texto de favoritos
          ),
        ],
        currentIndex: _selectedIndex, // Estado actual
        selectedItemColor: Colors.white, // Color de texto seleccionado
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MenuScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoriteRecipesScreen(),
              ),
            );
          }
        },
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
                      'assets/background/background.png'),
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
    ]; // Lista de categorías
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
              'assets/categorias/$category.png',
              width: MediaQuery.of(context).size.width * 0.42,
              height: MediaQuery.of(context).size.width * 0.42,
              fit: BoxFit.cover,
            ),
            Text(category,
                style:
                    const TextStyle(fontSize: 18)),
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
    final filteredRecipes = RecipeMenu.recipeMenuItems
        .where((recipe) => recipe.category == category)
        .toList();

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
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(80),
                                        child: Image.asset(recipe.imageUrl, fit: BoxFit.fill,),
                                      )),
                                  const SizedBox(height: 0),
                                  // Titulo de la receta
                                  Text(
                                    recipe.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Subtitulo de la receta
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

class RecipeDetailScreen extends StatefulWidget {
  final MenuItem recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late List<bool> _checkedIngredients;
  bool _isFavorite = false; // Estado de favorito

  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
    _checkedIngredients =
        List<bool>.filled(widget.recipe.ingredients.length, false);
  }

  void _loadFavoriteState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteRecipes =
        prefs.getStringList('favoriteRecipes') ?? [];
    setState(() {
      _isFavorite = favoriteRecipes.contains(widget.recipe.title);
    });
  }

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
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {
              // Cambiar el estado de favorito al presionar el botón
              setState(() {
                _isFavorite = !_isFavorite;
              });
              // Actualizar la lista de recetas favoritas en SharedPreferences
              _updateFavorites();
            },
          ),
        ],
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
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(widget.recipe.imageUrl),
                    )),
              ),
              const SizedBox(height: 10.0), // Espacio entre imagen y texto
              // Título
              Text(
                widget.recipe.title,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                  height: 5.0), // Espacio entre título y subtítulo (opcional)

// Tiempo
              Row(
                children: [
                  const Text('Duración:'),
                  const Icon(Icons.access_time), // Icono de reloj
                  const SizedBox(width: 5),
                  Text(widget.recipe.time), // Mostrar el tiempo
                ],
              ),

              const SizedBox(
                  height:
                      10.0), // Espacio entre el tiempo y el subtítulo

              // Subtítulo
              Text(widget.recipe.subTitle),

              const SizedBox(
                  height:
                      10.0), // Espacio entre subtítulo y categoría

              // Categoría
              Text(
                'Categoría: ${widget.recipe.category}',
                style: const TextStyle(fontSize: 16.0, color: Colors.grey),
              ),

              const SizedBox(
                  height: 15.0), // Espacio entre categoría e ingredientes
              // Ingredientes
              const Text(
                'Ingredientes:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                  height: 5.0), // Espacio entre título de ingredientes y lista
              _buildIngredientsList(widget.recipe
                  .ingredients), // Widget para mostrar la lista de ingredientes
              // Instrucciones
              const Text(
                'Instrucciones:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              // todo: cambiar el formato de las instrucciones similar a como estan los ingredientes
              Text(
                widget.recipe.instructions,
                textAlign: TextAlign.center,
              ),
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
      children: List.generate(ingredients.length, (index) {
        return Row(
          children: [
            Checkbox(
              value: _checkedIngredients[index],
              onChanged: (newValue) {
                setState(() {
                  _checkedIngredients[index] = newValue ?? false;
                });
              },
            ),
            Flexible(
              child: Text(
                ingredients[index],
                style: _checkedIngredients[index]
                    ? const TextStyle(decoration: TextDecoration.lineThrough)
                    : null,
              ),
            ),
          ],
        );
      }),
    );
  }

  // Actualizar la lista de recetas favoritas en SharedPreferences
  void _updateFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteRecipes =
        prefs.getStringList('favoriteRecipes') ?? [];

    if (_isFavorite) {
      // Agregar la receta a favoritos si no está en la lista
      if (!favoriteRecipes.contains(widget.recipe.title)) {
        favoriteRecipes.add(widget.recipe.title);
        await prefs.setStringList('favoriteRecipes', favoriteRecipes);
      }
    } else {
      // Eliminar la receta de favoritos si está en la lista
      if (favoriteRecipes.contains(widget.recipe.title)) {
        favoriteRecipes.remove(widget.recipe.title);
        await prefs.setStringList('favoriteRecipes', favoriteRecipes);
      }
    }
  }
}
