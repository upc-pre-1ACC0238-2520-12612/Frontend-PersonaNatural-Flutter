import 'package:flutter/material.dart';

class AppTextStyles {
  // Titulares
  static const TextStyle title24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600, // Inter SemiBold
    fontFamily: 'Inter',
    color: Color(0xFF0F172A),
  );

  static const TextStyle title20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: Color(0xFF0F172A),
  );

  // --- Añadido para evitar el error ---
  static const TextStyle title18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: Color(0xFF0F172A),
  );

  // Cuerpo
  static const TextStyle body16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400, // Inter Regular
    fontFamily: 'Inter',
    color: Color(0xFF475569), // text secondary (60%)
  );

  static const TextStyle body14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: Color(0xFF475569),
  );

  // Numerales / KPIs
  static const TextStyle kpi = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700, // Inter Bold
    fontFamily: 'Inter',
    color: Color(0xFF0F172A),
  );
}
