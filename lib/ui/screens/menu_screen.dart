import 'package:flutter/material.dart';
import 'package:probando_flutter_lab1/core/services/storage_service.dart';
import 'package:probando_flutter_lab1/models/settings_model.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var username = StorageService.getUsername(); //me sirve para el proyecto

    final settings = context.watch<SettingsViewModel>();
    final difficulty = context.watch<SettingsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Buscaminas / Menú",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 80,
      ),
      body: Center(
        child: Column(
          children: [

            const SizedBox(height: 16),
            
            const Icon(
              Icons.grid_on,
              size: 80,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 16),

            Text(
              "Pantalla de menú, Bienvenido ${settings.username}! \n Dificultad actual: ${settings.difficulty}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            //

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Configuración Actual",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
              
                      const Divider(),
              
                      ListTile(
                        leading: const Icon(
                          Icons.dashboard,
                          color: Colors.deepPurple,
                        ),
                        title: Text(
                          "Dificultad: ${settings.difficulty}",
                        ),
                        subtitle: Text(
                          "Tablero de ${settings.gridSize}x${settings.gridSize}",
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => Navigator.pushNamed(context, "/settings"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 28,
                  ),
                  label: const Text(
                    "NUEVA PARTIDA",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, "/game"),
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextButton.icon(
              icon: const Icon(
                Icons.history,
                color: Colors.black,
              ),
              label: const Text(
                "Ver Historial de Partidas",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, "/history"),
            ),
          ],
        ),
      ),
    );
  }
}
