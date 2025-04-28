import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 213, 224, 171)),
      ),
      home: const MyHomePage(title: 'Flutter Framework'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _restarContador() { //para disminuir el contador
    setState(() {
      _counter--;
    });
  }

  void reiniciarContador() {
    setState(() {
      _counter = 0;
    });
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ //lista de widgets
              Text('Flutter es un framework de código abierto creado por Google\n que permite crear aplicaciones (por lo general para celulares)\n desde una única base de código'), //widget xd
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                IconButton(onPressed: _incrementCounter, icon: Icon(Icons.add_box)),
                IconButton(onPressed: _restarContador, icon: Icon(Icons.remove_circle)),
                IconButton(onPressed: reiniciarContador, icon: Icon(Icons.restart_alt_rounded)),
                
                Text('La cantidad de veces que presionó el botón es: '),
                Text('$_counter'),
                ],

              ),
          
            ],//children
          ),

        ),


      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
