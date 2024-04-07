import 'package:flutter/material.dart'; // Importante: Asegúrate de importar el paquete necesario

class MenuItem {
  final String title;
  final String time;
  final String subTitle;
  final String link;
  final String category; // for filter recipes
  final String imageUrl; // for recipe image
  final List<String> ingredients; // for recipe details
  final String instructions; // for recipe's step-by-step instructions

  const MenuItem({
    required this.title,
    required this.time,
    required this.subTitle,
    required this.link,
    required this.category,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
  });
}

class RecipeMenu {
  static const List<MenuItem> recipeMenuItems = [
    // Aquí van los elementos de tu lista
    MenuItem(
      title: 'Helado de Vainilla',
      time: '1 hora',
      subTitle: 'Postre refrescante clásico',
      category: 'Postres',
      link: '/vanillaIceCream',
      imageUrl: 'assets/postres/helado.jpg',
      ingredients: [
        '500 ml de leche',
        '250 ml de nata líquida',
        '100 g de azúcar',
        '3 yemas de huevo',
        '1 vaina de vainilla',
      ],
      instructions: '''
        1. Hervir la leche con la vaina de vainilla.
        2. Batir las yemas de huevo con el azúcar hasta obtener una mezcla blanca y espumosa.
        3. Añadir la leche caliente a la mezcla de yemas y azúcar y batir hasta obtener una mezcla homogénea.
        4. Cocinar la mezcla a fuego lento durante 5 minutos, hasta que espese.
        5. Dejar enfriar la mezcla completamente.
        6. Añadir la nata líquida a la mezcla fría y batir hasta obtener una textura cremosa.
        7. Verter la mezcla en una heladera y congelar durante 24 horas.
      ''',
    ),
      MenuItem(
    title: 'Tarta de Queso',
    time: '1 hora y 20 minutos',
    subTitle: 'Postre clásico cremoso y suave',
    category: 'Postres',
    link: '/tartaQueso',
    imageUrl: 'assets/postres/pastel.jpg',
    ingredients: [
      'Para la base:',
      '200 g de galletas digestive',
      '100 g de mantequilla derretida',
      'Para el relleno:',
      '500 g de queso crema',
      '150 g de azúcar',
      '3 huevos',
      '200 ml de nata líquida',
      '1 cucharadita de extracto de vainilla',
    ],
    instructions: '''
      1. Precalentar el horno a 180°C.
      2. Triturar las galletas digestive hasta obtener una textura fina.
      3. Mezclar las galletas trituradas con la mantequilla derretida hasta obtener una masa homogénea.
      4. Forrar un molde desmontable con papel de horno y presionar la masa de galletas en el fondo del molde.
      5. Hornear la base durante 10 minutos.
      6. Batir el queso crema con el azúcar hasta obtener una mezcla suave.
      7. Añadir los huevos uno a uno, batiendo bien después de cada adición.
      8. Incorporar la nata líquida y el extracto de vainilla a la mezcla de queso crema.
      9. Verter el relleno sobre la base de galleta y hornear durante 50-60 minutos, hasta que la tarta esté cuajada.
      10. Dejar enfriar la tarta completamente antes de servirla.
  ''',
  ),
  MenuItem(
    title: 'Tiramisú',
    time: '45 minutos',
    subTitle: 'Postre italiano clásico con café y mascarpone',
    category: 'Postres',
    link: '/tiramisu',
    imageUrl: 'assets/postres/tiramisu.jpg',
    ingredients: [
      '200 g de bizcochos de soletilla',
      '500 g de mascarpone',
      '4 huevos',
      '100 g de azúcar',
      '200 ml de café fuerte',
      '2 cucharadas de cacao en polvo',
    ],
    instructions: '''
      1. Separar las yemas de las claras de los huevos.
      2. Batir las yemas con el azúcar hasta obtener una mezcla blanca y espumosa.
      3. Añadir el mascarpone a la mezcla de yemas y azúcar y batir hasta obtener una crema homogénea.
      4. Batir las claras a punto de nieve.
      5. Incorporar las claras a punto de nieve a la crema de mascarpone con movimientos envolventes.
      6. Mojar los bizcochos de soletilla en el café y colocarlos en una fuente para horno.
      7. Cubrir los bizcochos con una capa de crema de mascarpone.
      8. Repetir las capas hasta terminar con una capa de crema de mascarpone.
      9. Espolvorear con cacao en polvo y refrigerar durante al menos 4 horas antes de servir.
  ''',
  ),
  MenuItem(
    title: 'Flan',
    time: '30 minutos',
    subTitle: 'Postre tradicional español cremoso y suave',
    category: 'Postres',
    link: '/flan',
    imageUrl: 'assets/postres/flan.jpg',
    ingredients: [
      '1 litro de leche',
      '6 huevos',
      '150 g de azúcar',
      '1 vaina de vainilla',
    ],
    instructions: '''
      1. Precalentar el horno a 180°C.
      2. Hervir la leche con la vaina de vainilla.
      3. Batir los huevos con el azúcar hasta obtener una mezcla blanca y espumosa.
      4. Añadir la leche caliente a la mezcla de huevos y azúcar y batir hasta obtener una mezcla homogénea.
      5. Caramelizar un molde con azúcar.
      6. Verter la mezcla de flan en el molde caramelizado.
      7. Hornear el flan al baño maría durante 45-60 minutos, hasta que esté cuajado.
      8. Dejar enfriar el flan completamente antes de desmoldarlo.
  ''',
  ),
  MenuItem(
    title: 'Brownie',
    time: '20 minutos',
    subTitle: 'Pastel de chocolate denso y húmedo',
    category: 'Postres',
    link: '/brownie',
    imageUrl: 'assets/postres/brownie.jpg',
    ingredients: [
      '200 g de chocolate negro',
      '150 g de mantequilla',
      '3 huevos',
      '150 g de azúcar',
      '100 g de harina',
      '1/2 cucharadita de levadura química',
      'Nueces o frutos secos (opcional)',
    ],
    instructions: '''
      1. Precalentar el horno a 180°C.
      2. Derretir el chocolate negro con la mantequilla al baño maría.
      3. Batir los huevos con el azúcar hasta obtener una mezcla blanca y espumosa.
      4. Añadir la mezcla de chocolate y mantequilla a la mezcla de huevos y azúcar y batir hasta obtener una mezcla homogénea.
      5. Incorporar la harina y la levadura química a la mezcla y batir hasta obtener una mezcla homogénea.
      6. Verter la mezcla en un molde engrasado y enharinado.
      7. Añadir nueces o frutos secos (opcional).
      8. Hornear el brownie durante 25-30 minutos, hasta que esté cuajado.
      9. Dejar enfriar el brownie completamente antes de cortarlo.
  ''',
  ),

//Todo:          Categorias de PASTAS

  MenuItem(
    title: 'Spaghetti alla Carbonara',
    time: '55 minutos',
    subTitle: 'Plato típico romano cremoso y sabroso',
    link: '/spaghettiCarbonara',
    category: 'Pastas',
    imageUrl: 'assets/pastas/carbonara.jpg',
    ingredients: [
      '350 g de spaghetti',
      '150 g de guanciale (o panceta en su defecto)',
      '3 yemas de huevo',
      '1 huevo entero',
      '100 g de queso pecorino romano (o Parmigiano Reggiano)',
      'Pimienta negra molida',
      'Aceite de oliva virgen extra',
      'Sal',
    ],
    instructions: '''
  1.	Cocinar el spaghetti en abundante agua salada hasta que esté al dente.
  2.	Mientras tanto, en una sartén grande, freír el tocino a fuego medio hasta que esté crujiente.
  3.	En un tazón grande, batir los huevos con el queso parmesano, la sal y la pimienta negra.
  4.	Escurrir el spaghetti y añadirlo a la sartén con el tocino.
  5.	Verter la mezcla de huevo sobre la pasta y revolver rápidamente para cubrirla con la salsa.
  6.	Servir inmediatamente con más queso parmesano rallado y pimienta negra al gusto.

  ''',
  ),
  MenuItem(
    title: 'Fettuccine Alfredo',
    time: '40 minutos',
    subTitle: 'Clásico y cremoso plato de pasta italiano',
    link: '/fettuccineAlfredo',
    category: 'Pastas',
    imageUrl: 'assets/pastas/fettuccini.jpg',
    ingredients: [
      '400 g de fettuccine',
      '150 g de mantequilla sin sal',
      '250 ml de crema de leche entera',
      '1/2 taza de queso parmesano rallado',
      '1/4 taza de pecorino romano rallado (opcional)',
      'Sal y pimienta negra molida al gusto',
      '1 diente de ajo (opcional)',
    ],
    instructions: '''
  1.	Cocinar el fettuccine en abundante agua salada hasta que esté al dente.
  2.	Mientras tanto, derretir la mantequilla en una sartén grande a fuego medio.
  3.	Añadir el queso parmesano a la mantequilla y remover hasta que se derrita.
  4.	Salpimentar al gusto.
  5.	Escurrir el fettuccine y añadirlo a la sartén con la salsa.
  6.	Revolver para cubrir la pasta con la salsa.
  7.	Servir inmediatamente con más queso parmesano rallado y pimienta negra al gusto.

  ''',
  ),
  MenuItem(
    title: 'Penne con Pesto',
    time: '1 hora',
    subTitle: 'Pasta rápida y deliciosa con salsa pesto',
    link: '/pennePesto',
    category: 'Pastas',
    imageUrl: 'assets/pastas/penne.jpg',
    ingredients: [
      '350 g de penne',
      '200 g de pesto (casero o comprado)',
      '1/2 taza de tomates cherry (cortados por la mitad)',
      '1/4 taza de queso parmesano rallado',
      '2 cucharadas de aceite de oliva virgen extra',
      'Sal y pimienta negra molida al gusto',
      'Piñones tostados (opcional, para decorar)',
    ],
    instructions: '''
  1.	Cocinar el penne en abundante agua salada hasta que esté al dente.
  2.	Mientras tanto, mezclar el pesto con los tomates cherry y los piñones.
  3.	Escurrir el penne y añadirlo a la mezcla de pesto.
  4.	Revolver para cubrir la pasta con la salsa.
  5.	Salpimentar al gusto.
  6.	Servir inmediatamente con más queso parmesano rallado (opcional).

  ''',
  ),
  MenuItem(
    title: 'Macarrones con Queso',
    time: '25 minutos',
    subTitle: 'Plato clásico americano cremoso y reconfortante',
    link: '/macarronesQueso',
    category: 'Pastas',
    imageUrl: 'assets/pastas/mac.jpg',
    ingredients: [
      '200 g de macarrones',
      '50 g de mantequilla',
      '2 cucharadas de harina',
      '500 ml de leche',
      '200 g de queso cheddar rallado',
      '100 g de queso parmesano rallado',
      'Sal y pimienta al gusto',
      '1/2 cucharadita de mostaza en polvo (opcional)',
      '1/4 cucharadita de pimentón dulce (opcional)',
    ],
    instructions: '''
  1. Hervir la pasta en agua con sal hasta que esté al dente. Reservar.

  2. Derretir la mantequilla en una olla a fuego medio.

  3. Añadir la harina y cocinar durante 1 minuto, revolviendo constantemente.

  4. Verter la leche gradualmente, sin dejar de remover, hasta obtener una salsa bechamel espesa.

  5. Añadir el queso cheddar y parmesano rallado, y remover hasta que se derritan y la salsa esté homogénea.

  6. Sazonar con sal, pimienta, mostaza en polvo y pimentón dulce (opcional) al gusto.

  7. Mezclar la salsa de queso con la pasta cocida.

  8. Verter la mezcla en una fuente para horno.

  9. Hornear a 180 °C durante 15-20 minutos, hasta que esté dorado.

  10. Servir caliente.
  ''',
  ),
  MenuItem(
      title: 'Lasaña',
      time: '1 hora y 30 minutos',
      subTitle: 'Plato italiano clásico con capas de pasta, salsa y queso',
      link: '/lasaña',
      category: 'Pastas',
      imageUrl: 'assets/pastas/lasagna.jpg',
      ingredients: [
        '1 paquete de placas de lasaña',
        '500 g de carne picada',
        '1 cebolla',
        '2 dientes de ajo',
        '1 bote de salsa de tomate',
        '500 ml de leche',
        '50 g de mantequilla',
        '50 g de harina',
        '1 nuez moscada',
        '200 g de queso mozzarella rallado',
        '100 g de queso parmesano rallado',
        'Sal y pimienta al gusto',
        'Aceite de oliva virgen extra',
      ],
      instructions: '''
  1.	Precalentar el horno a 180°C.
  2.	En una sartén grande, dorar la carne picada con la cebolla y el ajo.
  3.	Añadir la salsa de tomate y cocinar a fuego lento durante 15 minutos.
  4.	Salpimentar al gusto.
  5.	En una fuente para hornear, colocar una capa de pasta para lasaña.
  6.	Cubrir con la mitad de la salsa de carne y la mitad de la salsa bechamel.
  7.	Repetir las capas.
  8.	Espolvorear con queso mozzarella rallado.
  9.	Hornear durante 30 minutos, hasta que esté dorada y burbujeante.
  10.	Dejar reposar durante 10 minutos antes de servir.

  '''),
  ];
}

class RecipeCard extends StatelessWidget {
  final MenuItem menuItem;

  const RecipeCard({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(menuItem.imageUrl),
          ListTile(
            title: Text(menuItem.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.access_time), // Icono de reloj
                    const SizedBox(width: 5),
                    Text(menuItem.time),
                  ],
                ),
                Text(menuItem.subTitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
