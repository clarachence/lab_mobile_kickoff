import '../domain/servico.dart';
import '../domain/servico_repository.dart';

class ServicoRepositoryFake implements ServicoRepository {
  final List<Servico> _dados = [
    Servico(id: '1', titulo: 'Manutenção PC', descricao: 'Formatação e limpeza'),
    Servico(id: '2', titulo: 'Instalação de Rede', descricao: 'Configuração de roteador'),
  ];

  @override
  List<Servico> getAll() => _dados;

  @override
  void add(Servico s) => _dados.add(s);

  @override
  void update(Servico s) {
    final index = _dados.indexWhere((item) => item.id == s.id);
    if (index != -1) _dados[index] = s;
  }

  @override
  void delete(String id) => _dados.removeWhere((item) => item.id == id);
}