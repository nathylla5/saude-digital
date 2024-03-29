import 'package:flutter/material.dart';

import '../domain/medicamentos.dart';
import '../domain/unsplash_api.dart';
import '../pages/detalhes_page.dart';

class Remedios extends StatefulWidget {
  final Medicamento med;

  const Remedios({Key? key, required this.med}) : super(key: key);

  @override
  State<Remedios> createState() => _RemediosState();
}

class _RemediosState extends State<Remedios> {
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    buscarFoto();
  }

  Future<void> buscarFoto() async {
    try {
      imageUrl = await UnsplashApi().buscarFoto('medication');
      setState(() {});
    } catch (e) {
      print('Erro ao buscar a foto: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Image.network(
                imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.med.nome,
                    style: const TextStyle(
                      color: Color(0xFF0292B7),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetalhesPage(med: widget.med);
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Acesse as informações aqui",
                      style: TextStyle(
                        color: Color(0xFFA6A6A6),
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
