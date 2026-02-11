import 'servico.dart';

abstract class IServicoRepository {
  List<Servico> getAll();
  void add(Servico s);
  void update(Servico s);
  void delete(String id);
}