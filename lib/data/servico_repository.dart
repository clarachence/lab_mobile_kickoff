import '../domain/servico.dart';

class ServicoRepository {
  List<Servico> _servicos = []; 
  List<Servico> get todos => _servicos;
}