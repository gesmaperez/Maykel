# App — Maykel Repuestos (Flutter Web)

Catálogo público y panel de administración de Maykel Repuestos,
construido en [Flutter](https://flutter.dev) para **Web** (corre en el
navegador, igual que la versión anterior en HTML/JS).

## Requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.16 o
  superior, con soporte web habilitado:
  ```bash
  flutter config --enable-web
  ```
- Google Chrome instalado (para `flutter run -d chrome` en desarrollo).

## Instalación

```bash
cd app
flutter pub get
```

## Desarrollo (con el backend corriendo aparte)

1. Primero levanta el backend en Dart (ver `../backend/README.md`), por
   ejemplo en `http://localhost:8080`.
2. Corre la app apuntando a esa URL:
   ```bash
   flutter run -d chrome --dart-define=API_BASE=http://localhost:8080
   ```
   Esto abre la app en Chrome con recarga en caliente (hot reload), ideal
   para ir probando cambios.

Si no pasas `--dart-define=API_BASE=...`, la app asume que la API está en
el mismo origen donde se sirve ella misma (útil para producción, ver
abajo).

## Producción: build para desplegar

```bash
flutter build web
```

Esto genera la carpeta `build/web/` con todos los archivos estáticos
(HTML, JS, CSS, assets) listos para servir. Tienes dos formas de
desplegarla:

**Opción A — Servidos por el backend Dart (recomendada):**
El backend (`../backend`) detecta automáticamente `app/build/web/` y lo
sirve como archivos estáticos en la misma URL que la API. Solo necesitas
correr `dart run bin/server.dart` desde `backend/` después de compilar
la app — no hay que mover ni copiar archivos a mano.

**Opción B — Hosting estático aparte (Firebase Hosting, Netlify, etc.):**
Sube el contenido de `build/web/` a tu hosting preferido, y compílalo con
la URL del backend ya fija:
```bash
flutter build web --dart-define=API_BASE=https://tu-backend.tudominio.cl
```

## Estructura del proyecto

```
lib/
  config.dart              — colores, tema visual y datos de contacto del negocio
  models.dart               — modelos de datos (Repuesto, Reserva, Venta, Dashboard)
  api_service.dart           — cliente HTTP hacia el backend
  main.dart                  — punto de entrada de la app
  screens/
    home_screen.dart         — sitio público (hero, historia, servicios, catálogo, contacto)
    admin_screen.dart        — panel admin (Dashboard, Ventas, Reservas, Stock)
    aviso_legal_screen.dart  — página de aviso legal
  widgets/
    product_card.dart        — tarjeta de producto del catálogo
    reserva_dialog.dart       — formulario y ticket de reserva
    admin_login_dialog.dart   — modal de acceso al panel admin
  utils/
    format.dart               — formato de moneda CLP
    pdf_report.dart            — generación de reportes PDF (ventas/reservas)
```

## Configuración del negocio

Los datos de contacto (WhatsApp, correo, dirección, horario) están en
`lib/config.dart`, en la clase `ContactoConfig`. Si cambian, solo hay que
editar ese archivo y volver a compilar.

## Nota importante sobre este código

Esta app fue escrita y revisada manualmente por Claude, replicando
exactamente el mismo diseño y flujo de uso (reservas con ticket para
WhatsApp/correo, panel admin con 4 pestañas, catálogo con búsqueda y
filtro por categoría) que la versión anterior en HTML/JS — pero **no pudo
compilarse ni ejecutarse** en el entorno donde se generó (no había SDK de
Flutter disponible ahí). Antes de darla por lista, corre
`flutter run -d chrome` y prueba el flujo completo (ver catálogo, reservar
un producto, entrar al panel admin, registrar una venta, editar stock,
descargar los PDF) por si aparece algún detalle menor que ajustar en tu
primera compilación real.
