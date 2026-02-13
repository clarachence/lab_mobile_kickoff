import 'package:flutter/material.dart';
import 'data/servico_repository_fake.dart';
import 'application/servico_controller.dart';
import 'presentation/lista_servicos_page.dart';

void main() {
  // 1. Cria o repositório
  final repo = ServicoRepositoryFake();
  // 2. Cria o controller injetando o repositório
  final controller = ServicoController(repo);

  runApp(MaterialApp(
    home: ListaServicosPage(controller: controller),
    debugShowCheckedModeBanner: false,
  ));
}