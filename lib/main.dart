import 'package:flutter/material.dart';
import 'application/servico_controller.dart';
import 'data/servico_repository_fake.dart';
import 'presentation/lista_servicos_page.dart';

void main() {
  // 1. Inicializa o repositório (camada de Data)
  final repository = ServicoRepositoryFake();

  // 2. Inicializa o controller passando o repositório (camada de Application)
  final controller = ServicoController(repository);

  // 3. Inicia o app enviando o controller para a tela inicial
  runApp(MyApp(controller: controller));
}

class MyApp extends StatelessWidget {
  final ServicoController controller;

  const MyApp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laboratório Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      
      home: ListaServicosPage(controller: controller),
    );
  }
}