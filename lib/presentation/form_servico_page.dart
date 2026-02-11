import 'package:flutter/material.dart';
import '../application/servico_controller.dart';
import '../domain/servico.dart';

class FormServicoPage extends StatefulWidget {
  final ServicoController controller;
  final Servico? servico; // Se vier preenchido, é modo edição

  const FormServicoPage({super.key, required this.controller, this.servico});

  @override
  State<FormServicoPage> createState() => _FormServicoPageState();
}

class _FormServicoPageState extends State<FormServicoPage> {
  final _formKey = GlobalKey<FormState>();
  final _tituloCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.servico != null) {
      _tituloCtrl.text = widget.servico!.titulo;
      _descCtrl.text = widget.servico!.descricao;
    }
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      final novoServico = Servico(
        id: widget.servico?.id ?? DateTime.now().millisecondsSinceEpoch,
        titulo: _tituloCtrl.text,
        descricao: _descCtrl.text,
      );

      if (widget.servico == null) {
        widget.controller.criar(novoServico);
      } else {
        widget.controller.editar(novoServico);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.servico == null ? "Novo Serviço" : "Editar")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloCtrl,
                decoration: const InputDecoration(labelText: "Título"),
                validator: (v) => v!.isEmpty ? "Obrigatório" : null,
              ),
              TextFormField(
                controller: _descCtrl,
                decoration: const InputDecoration(labelText: "Descrição"),
                validator: (v) => v!.isEmpty ? "Obrigatório" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _salvar, child: const Text("Salvar"))
            ],
          ),
        ),
      ),
    );
  }
}