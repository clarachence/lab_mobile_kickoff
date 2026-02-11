import 'package:flutter/material.dart';
import '../application/servico_controller.dart';
import '../domain/servico.dart';
import 'form_servico_page.dart';

class ListaServicosPage extends StatefulWidget {
  final ServicoController controller;
  const ListaServicosPage({super.key, required this.controller});

  @override
  State<ListaServicosPage> createState() => _ListaServicosPageState();
}

class _ListaServicosPageState extends State<ListaServicosPage> {
  @override
  Widget build(BuildContext context) {
    final lista = widget.controller.carregar(); // Regra: Tela acessa Controller

    return Scaffold(
      appBar: AppBar(title: const Text("Laboratório Mobile")),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          final servico = lista[index];
          return ListTile(
            title: Text(servico.titulo),
            subtitle: Text(servico.descricao),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.orange),
                  onPressed: () => _abrirFormulario(servico),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _confirmarExclusao(servico),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _abrirFormulario(),
      ),
    );
  }

  void _abrirFormulario([Servico? servico]) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormServicoPage(controller: widget.controller, servico: servico),
      ),
    );
    setState(() {}); // Atualiza a lista quando volta do formulário
  }

  void _confirmarExclusao(Servico s) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Excluir"),
        content: Text("Deseja remover ${s.titulo}?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Não")),
          TextButton(
            onPressed: () {
              widget.controller.remover(s.id.toString());
              Navigator.pop(context);
              setState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Serviço removido com sucesso!")),
              );
            },
            child: const Text("Sim"),
          ),
        ],
      ),
    );
  }
}