import '../domain/servico.dart';
import '../domain/servico_repository.dart';

class ServicoRepositoryFake implements IServicoRepository {
  // Começar com 2 itens mockados como solicitado
  final List<Servico> _servicos = [
    Servico(id: 1, titulo: 'Limpeza', descricao: 'Limpeza geral'),
    Servico(id: 2, titulo: 'Manutenção', descricao: 'Reparo elétrico'),
  ];

  @override
  List<Servico> getAll() => _servicos;

  @override
  void add(Servico s) => _servicos.add(s);

  @override
  void update(Servico s) {
    int index = _servicos.indexWhere((item) => item.id == s.id);
    if (index != -1) _servicos[index] = s;
  }

  @override
  void delete(String id) {
    _servicos.removeWhere((item) => item.id.toString() == id);
  }
}