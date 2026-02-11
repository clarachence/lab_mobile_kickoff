import '../domain/servico.dart';
import '../domain/servico_repository.dart';

class ServicoController {
  final IServicoRepository repository;

  ServicoController(this.repository);

  // Expõe a lista para a UI
  List<Servico> carregar() => repository.getAll();

  void criar(Servico s) => repository.add(s);
  
  void editar(Servico s) => repository.update(s);
  
  void remover(String id) => repository.delete(id);
}