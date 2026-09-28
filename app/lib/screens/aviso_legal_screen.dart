import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config.dart';

class AvisoLegalScreen extends StatelessWidget {
  const AvisoLegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.char,
        title: const Text('Aviso legal — Maykel Repuestos'),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Aviso legal y términos de uso',
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w800, color: AppColors.char),
                ),
                const SizedBox(height: 6),
                Text('Última actualización: septiembre de 2026',
                    style: TextStyle(
                        fontFamily: 'monospace', fontSize: 12, color: AppColors.steel)),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.paper,
                    border: const Border(left: BorderSide(color: AppColors.yellow, width: 3)),
                  ),
                  child: Text(
                    'Este texto es una referencia general y no reemplaza asesoría legal '
                    'profesional. Se recomienda revisarlo con un abogado antes de publicar '
                    'el sitio, especialmente en lo relativo a protección de datos personales.',
                    style: TextStyle(fontSize: 13, color: AppColors.steel, height: 1.6),
                  ),
                ),
                _seccion(
                  '1. Identificación',
                  'Este sitio web es operado por Maykel Repuestos, negocio dedicado a la '
                      'venta de repuestos automotrices, con domicilio en '
                      '${ContactoConfig.direccion}, Chile. Para consultas sobre este aviso '
                      'legal, puedes escribir a ${ContactoConfig.contactEmail}.',
                ),
                _seccion(
                  '2. Objeto del sitio',
                  'Este sitio permite consultar el catálogo de repuestos disponibles y '
                      'generar una solicitud de reserva sobre un producto. La reserva no '
                      'constituye una compra confirmada ni un contrato de compraventa: es '
                      'una manifestación de interés que debe ser confirmada directamente '
                      'con el negocio por WhatsApp o correo electrónico, donde también se '
                      'coordina el precio final, la forma de pago y la entrega o retiro '
                      'del producto.',
                ),
                _seccion(
                  '3. Disponibilidad de stock y precios',
                  'El stock mostrado se actualiza periódicamente y puede no reflejar la '
                      'disponibilidad exacta en todo momento. Los precios y condiciones '
                      'de venta se informan directamente al cliente al confirmar la '
                      'reserva, y pueden variar respecto a versiones anteriores del '
                      'catálogo. Maykel Repuestos no garantiza la disponibilidad de un '
                      'producto reservado hasta que la reserva sea confirmada por el '
                      'negocio.',
                ),
                _seccionConLista(
                  '4. Uso del sitio',
                  'Al usar este sitio, el usuario se compromete a:',
                  const [
                    'Proporcionar información veraz al momento de generar una reserva '
                        '(nombre, teléfono, correo).',
                    'No utilizar el sitio con fines fraudulentos, abusivos o contrarios '
                        'a la ley.',
                    'No intentar acceder sin autorización a áreas restringidas del sitio '
                        '(como el panel de administración).',
                  ],
                ),
                _seccion(
                  '5. Protección de datos personales',
                  'Los datos que entregas al reservar un producto (nombre, teléfono, '
                      'correo electrónico, y el comentario opcional) se utilizan '
                      'exclusivamente para gestionar tu solicitud y contactarte respecto '
                      'a ella. No se venden ni se comparten con terceros para fines '
                      'comerciales ajenos a este propósito. De acuerdo con la Ley N° '
                      '19.628 sobre Protección de la Vida Privada, puedes solicitar en '
                      'cualquier momento el acceso, rectificación o eliminación de tus '
                      'datos escribiendo a ${ContactoConfig.contactEmail}.',
                ),
                _seccion(
                  '6. Propiedad intelectual',
                  'Los contenidos de este sitio (textos, nombre comercial, logotipo y '
                      'diseño) pertenecen a Maykel Repuestos. No está permitida su '
                      'reproducción o uso comercial sin autorización previa.',
                ),
                _seccion(
                  '7. Limitación de responsabilidad',
                  'Maykel Repuestos no se responsabiliza por errores u omisiones en la '
                      'información publicada, ni por interrupciones temporales del sitio '
                      'por mantenimiento o causas ajenas a su control. La compatibilidad '
                      'de un repuesto con un vehículo específico debe confirmarse '
                      'siempre con el negocio antes de la compra.',
                ),
                _seccion(
                  '8. Modificaciones',
                  'Este aviso legal puede actualizarse en cualquier momento para '
                      'reflejar cambios en el funcionamiento del sitio o en la normativa '
                      'aplicable. La versión vigente es siempre la publicada en esta '
                      'página.',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 38, bottom: 6),
                  child: Text('9. Contacto',
                      style: TextStyle(
                          color: AppColors.red, fontWeight: FontWeight.w700, fontSize: 19)),
                ),
                Wrap(
                  children: [
                    const Text(
                      'Para cualquier consulta sobre este aviso legal, tus datos o el '
                      'funcionamiento del sitio, puedes escribir a ',
                      style: TextStyle(fontSize: 14.5, height: 1.75, color: Color(0xFF333333)),
                    ),
                    InkWell(
                      onTap: () =>
                          launchUrl(Uri.parse('mailto:${ContactoConfig.contactEmail}')),
                      child: Text(ContactoConfig.contactEmail,
                          style: const TextStyle(
                              fontSize: 14.5, color: AppColors.red, decoration: TextDecoration.underline)),
                    ),
                    const Text(' o por WhatsApp al ',
                        style: TextStyle(fontSize: 14.5, height: 1.75, color: Color(0xFF333333))),
                    InkWell(
                      onTap: () => launchUrl(
                          Uri.parse('https://wa.me/${ContactoConfig.whatsappNumber}')),
                      child: const Text('+56 9 6917 0551',
                          style: TextStyle(
                              fontSize: 14.5, color: AppColors.red, decoration: TextDecoration.underline)),
                    ),
                    const Text('.',
                        style: TextStyle(fontSize: 14.5, height: 1.75, color: Color(0xFF333333))),
                  ],
                ),
                const SizedBox(height: 40),
                Text('© ${DateTime.now().year} Maykel Repuestos. Todos los derechos reservados.',
                    style: TextStyle(fontSize: 12, color: AppColors.steel)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _seccion(String titulo, String texto) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo,
              style: const TextStyle(
                  color: AppColors.red, fontWeight: FontWeight.w700, fontSize: 19)),
          const SizedBox(height: 10),
          Text(texto,
              style: const TextStyle(fontSize: 14.5, height: 1.75, color: Color(0xFF333333))),
        ],
      ),
    );
  }

  Widget _seccionConLista(String titulo, String intro, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo,
              style: const TextStyle(
                  color: AppColors.red, fontWeight: FontWeight.w700, fontSize: 19)),
          const SizedBox(height: 10),
          Text(intro,
              style: const TextStyle(fontSize: 14.5, height: 1.75, color: Color(0xFF333333))),
          const SizedBox(height: 6),
          ...items.map((it) => Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('•  ', style: TextStyle(fontSize: 14.5)),
                    Expanded(
                      child: Text(it,
                          style: const TextStyle(
                              fontSize: 14.5, height: 1.75, color: Color(0xFF333333))),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
