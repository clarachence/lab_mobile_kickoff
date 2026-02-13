import 'package:flutter/material.dart';
import '../domain/servico.dart';
import '../domain/servico_repository.dart';

class ServicoController extends ChangeNotifier {
  final ServicoRepository repository;
  List<Servico> lista = [];

  ServicoController(this.repository);

  void carregar() {
    lista = repository.getAll();
    // notifyListeners() não é obrigatório se você usar setState na tela, 
    // mas é bom ter para seguir o padrão.
  }

  void criar(Servico s) {
    repository.add(s);
    carregar();
  }

  void editar(Servico s) {
    repository.update(s);
    carregar();
  }

  void remover(String id) {
    repository.delete(id);
    carregar();
  }
}