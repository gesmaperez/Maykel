# Maykel Repuestos — Flutter + Dart

Catálogo público de repuestos y panel de administración de Maykel
Repuestos (Calama, Chile), reescrito completamente en **Flutter Web**
(frontend) y **Dart puro** (backend), sin ninguna dependencia nativa o
compilada — corre igual en Windows, macOS o Linux con solo los SDKs de
Flutter y Dart instalados.

Esta es la reescritura en Flutter/Dart de la versión anterior en
Node.js + HTML/JS. Mantiene exactamente el mismo diseño, flujo de uso y
reglas de negocio:

- Catálogo público con búsqueda y filtro por categoría.
- Reserva de productos (sin mostrar precio), con ticket para enviar por
  WhatsApp o correo.
- Panel de administración único, con 4 pestañas: **Dashboard**, **Ventas**,
  **Reservas** y **Stock**.
- Registro de ventas y reservas que descuenta stock automáticamente; el
  producto pasa a "Agotado" en el catálogo público cuando llega a 0.
- Descarga de reportes de ventas y reservas en PDF.
- Aviso legal / términos de uso.
- Acceso al panel admin protegido con usuario y contraseña (varios
  administradores posibles).

## Estructura

```
maykel_flutter/
  backend/    — servidor Dart (shelf) con la API y la "base de datos" en JSON
  app/        — app Flutter Web (catálogo público + panel admin)
```

Cada carpeta tiene su propio `README.md` con instrucciones detalladas de
instalación y ejecución:

- [`backend/README.md`](backend/README.md)
- [`app/README.md`](app/README.md)

## Inicio rápido

```bash
# 1. Compila la app Flutter
cd app
flutter pub get
flutter build web

# 2. Corre el backend (sirve la API y la app compilada, todo en un puerto)
cd ../backend
dart pub get
dart run bin/server.dart
```

Abre `http://localhost:8080` en tu navegador.

## Importante: este código no fue compilado ni ejecutado

Todo el código de este proyecto (backend en Dart y app en Flutter) fue
escrito y revisado manualmente, pero el entorno donde se generó no tenía
el SDK de Dart ni el de Flutter instalados, así que no fue posible
compilarlo ni correrlo antes de entregarlo. La lógica replica exactamente
las mismas reglas de negocio que la versión anterior en Node.js (esa sí
probada y funcionando en vivo), así que el riesgo de errores es bajo,
pero **antes de usarlo en producción, corre ambos proyectos localmente y
prueba el flujo completo** (ver catálogo, reservar, entrar al panel
admin, registrar una venta, editar stock, descargar los PDF). 
