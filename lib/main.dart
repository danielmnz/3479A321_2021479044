import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:probando_flutter_lab1/core/services/storage_service.dart'; //lab6
import 'package:probando_flutter_lab1/models/game_view.dart';
import 'package:probando_flutter_lab1/ui/screens/about.dart';
import 'package:probando_flutter_lab1/ui/screens/history_screen.dart';
import 'package:probando_flutter_lab1/ui/screens/menu_screen.dart';
import 'package:probando_flutter_lab1/ui/screens/minesweeper_screen.dart';
import 'package:provider/provider.dart';
import 'package:probando_flutter_lab1/models/game_view.dart';

//logger
var logger = Logger();

void main() async { //async
  //logger.d('Iniciando app buscaminas'); //debug
  logger.i('Iniciando app buscaminas'); //info
  //logger.w('Iniciando app buscaminas'); //warning
  //logger.e('Iniciando app buscaminas'); //error

  //lab6
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscaminas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          secondary: Colors.red,
        ),
        //color fondo default
        scaffoldBackgroundColor: const Color.fromARGB(255, 242, 128, 27),
        
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, //quitar el debug de la esquina
      //home: const MinesweeperScreen(),
      initialRoute: '/menu',

      routes: {
        '/menu': (context) => const MenuScreen(),

        '/game': (context) => ChangeNotifierProvider(
          create: (context) => GameViewModel(),
          child: const MinesweeperScreen(),
        ),

        '/history': (context) => HistoryScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
//shift+alt+f
//ordenar todo