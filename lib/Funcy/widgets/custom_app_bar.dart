import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double scrollOffset;
  final Color backgroundColor;

  const CustomAppBar({super.key, 
    required this.scrollOffset,
    this.backgroundColor = Colors.white, // Color por defecto
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ancho completo en lugar de fijo
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Botón de retroceso (lado izquierdo)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const SizedBox(
                width: 32,
                height: 32,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),

            // Título centrado
            const Text(
              'Conversa con Funcy',
              style: TextStyle(
                color: Color(0xFF4320AD),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),

            // Contenedor del lado derecho (puedes agregar funcionalidad aquí)
            const SizedBox(
              width: 32,
              height: 32,
              // Opcional: agregar un ícono o funcionalidad
              child: Icon(
                Icons.more_horiz, // Ejemplo de ícono
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
