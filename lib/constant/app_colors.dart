import 'dart:ui';

abstract class Colors {
  static final List<Color> _colorsMaleFemale = [
    const Color(0xFF1976D2),
    const Color(0xFF64B5F6),
    const Color(0xFF2196F3)
  ];
  static final List<Color> _colorsMaleFemaleHh = [
    const Color(0xFF1976D2),
    const Color(0xFF64B5F6),
  ];
  final List<String> _representations = ['पुरुष', 'महिला', 'तेस्रो लिङ्गी'];
  final List<String> _representationsMfHh = [
    'पुरुष घरमुली',
    'महिला घरमुली',
  ];
}
