/// Modelos de datos del catálogo, reservas y ventas.
/// Reflejan exactamente la misma estructura JSON que entrega el backend.

/// Todos los permisos que puede tener un rol, en el orden en que se
/// muestran en el formulario de creación de roles. Deben coincidir
/// exactamente con `permisosDisponibles` del backend.
const List<String> kPermisosDisponibles = [
  'dashboard',
  'catalogo',
  'reservas',
  'stock',
  'usuarios',
  'configuracion',
];

/// Nombre legible de cada permiso, para mostrar en la interfaz.
const Map<String, String> kNombrePermiso = {
  'dashboard': 'Ver dashboard / analítica',
  'catalogo': 'Ver catálogo de productos',
  'reservas': 'Gestionar reservas',
  'stock': 'Gestionar precio y stock',
  'usuarios': 'Administrar usuarios y roles',
  'configuracion': 'Acceder a configuración',
};

class Repuesto {
  final int id;
  final String nombre;
  final String categoria;
  final String marca;
  final String modelo;
  final num precio;
  final num stock;
  final bool esEjemplo;

  Repuesto({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.marca,
    required this.modelo,
    required this.precio,
    required this.stock,
    this.esEjemplo = false,
  });

  /// SKU calculado igual que en el backend: REP-0001, REP-0002, etc.
  String get sku => 'REP-${id.toString().padLeft(4, '0')}';

  factory Repuesto.fromJson(Map<String, dynamic> json) {
    return Repuesto(
      id: (json['id'] as num).toInt(),
      nombre: json['nombre'] as String? ?? '',
      categoria: json['categoria'] as String? ?? '',
      marca: json['marca'] as String? ?? '',
      modelo: json['modelo'] as String? ?? '',
      precio: json['precio'] as num? ?? 0,
      stock: json['stock'] as num? ?? 0,
      esEjemplo: json['es_ejemplo'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'categoria': categoria,
        'marca': marca,
        'modelo': modelo,
        'precio': precio,
        'stock': stock,
        'es_ejemplo': esEjemplo,
      };
}

/// Reserva creada por un cliente desde el catálogo público.
/// Nunca incluye precio ni total, por diseño del negocio.
class Reserva {
  final String id;
  final String fecha;
  final int repuestoId;
  final String sku;
  final String producto;
  final num cantidad;
  final String nombre;
  final String telefono;
  final String email;
  final String nota;
  final String estado; // pendiente | confirmada | entregada

  Reserva({
    required this.id,
    required this.fecha,
    required this.repuestoId,
    required this.sku,
    required this.producto,
    required this.cantidad,
    required this.nombre,
    required this.telefono,
    required this.email,
    required this.nota,
    required this.estado,
  });

  factory Reserva.fromJson(Map<String, dynamic> json) {
    return Reserva(
      id: json['id'] as String,
      fecha: json['fecha'] as String,
      repuestoId: (json['repuestoId'] as num).toInt(),
      sku: json['sku'] as String? ?? '',
      producto: json['producto'] as String? ?? '',
      cantidad: json['cantidad'] as num? ?? 0,
      nombre: json['nombre'] as String? ?? '',
      telefono: json['telefono'] as String? ?? '',
      email: json['email'] as String? ?? '',
      nota: json['nota'] as String? ?? '',
      estado: json['estado'] as String? ?? 'pendiente',
    );
  }
}

/// Venta registrada por el administrador (ej. venta en mostrador).
class Venta {
  final String id;
  final String fecha;
  final int repuestoId;
  final String sku;
  final String producto;
  final num precio;
  final num cantidad;
  final num total;
  final String cliente;
  final String metodoPago;
  final String nota;

  Venta({
    required this.id,
    required this.fecha,
    required this.repuestoId,
    required this.sku,
    required this.producto,
    required this.precio,
    required this.cantidad,
    required this.total,
    required this.cliente,
    required this.metodoPago,
    required this.nota,
  });

  factory Venta.fromJson(Map<String, dynamic> json) {
    return Venta(
      id: json['id'] as String,
      fecha: json['fecha'] as String,
      repuestoId: (json['repuestoId'] as num).toInt(),
      sku: json['sku'] as String? ?? '',
      producto: json['producto'] as String? ?? '',
      precio: json['precio'] as num? ?? 0,
      cantidad: json['cantidad'] as num? ?? 0,
      total: json['total'] as num? ?? 0,
      cliente: json['cliente'] as String? ?? '',
      metodoPago: json['metodoPago'] as String? ?? '',
      nota: json['nota'] as String? ?? '',
    );
  }
}

/// Producto agregado en el resumen de agotados/stock bajo del dashboard.
class ProductoResumen {
  final int id;
  final String nombre;
  final num? stock;

  ProductoResumen({required this.id, required this.nombre, this.stock});

  factory ProductoResumen.fromJson(Map<String, dynamic> json) {
    return ProductoResumen(
      id: (json['id'] as num).toInt(),
      nombre: json['nombre'] as String? ?? '',
      stock: json['stock'] as num?,
    );
  }
}

/// Datos agregados del dashboard del panel admin.
class DashboardData {
  final int totalVentas;
  final num montoVentas;
  final int totalReservas;
  final int reservasPendientes;
  final int stockBajoCount;
  final int agotadosCount;
  final List<ProductoResumen> stockBajo;
  final List<ProductoResumen> agotados;

  DashboardData({
    required this.totalVentas,
    required this.montoVentas,
    required this.totalReservas,
    required this.reservasPendientes,
    required this.stockBajoCount,
    required this.agotadosCount,
    required this.stockBajo,
    required this.agotados,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      totalVentas: (json['totalVentas'] as num?)?.toInt() ?? 0,
      montoVentas: json['montoVentas'] as num? ?? 0,
      totalReservas: (json['totalReservas'] as num?)?.toInt() ?? 0,
      reservasPendientes: (json['reservasPendientes'] as num?)?.toInt() ?? 0,
      stockBajoCount: (json['stockBajoCount'] as num?)?.toInt() ?? 0,
      agotadosCount: (json['agotadosCount'] as num?)?.toInt() ?? 0,
      stockBajo: (json['stockBajo'] as List<dynamic>? ?? [])
          .map((e) => ProductoResumen.fromJson(e as Map<String, dynamic>))
          .toList(),
      agotados: (json['agotados'] as List<dynamic>? ?? [])
          .map((e) => ProductoResumen.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Resultado de iniciar sesión como administrador: quién es y qué puede
/// ver/hacer en el panel, según su rol (o acceso total si es el
/// propietario definido en ADMIN_USERS).
class SesionAdmin {
  final String usuario;
  final List<String> permisos;
  final bool esSuperAdmin;
  final String? rolNombre;

  SesionAdmin({
    required this.usuario,
    required this.permisos,
    required this.esSuperAdmin,
    this.rolNombre,
  });

  bool puede(String permiso) => esSuperAdmin || permisos.contains(permiso);

  factory SesionAdmin.fromJson(Map<String, dynamic> json) {
    return SesionAdmin(
      usuario: json['usuario'] as String? ?? '',
      permisos: (json['permisos'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      esSuperAdmin: json['esSuperAdmin'] as bool? ?? false,
      rolNombre: json['rolNombre'] as String?,
    );
  }
}

/// Un rol del panel admin: un nombre y el conjunto de permisos que otorga.
class Rol {
  final int id;
  final String nombre;
  final List<String> permisos;

  Rol({required this.id, required this.nombre, required this.permisos});

  factory Rol.fromJson(Map<String, dynamic> json) {
    return Rol(
      id: (json['id'] as num).toInt(),
      nombre: json['nombre'] as String? ?? '',
      permisos: (json['permisos'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
    );
  }
}

/// Un usuario del panel admin creado desde el módulo de Usuarios, con un
/// rol asignado (distinto de los usuarios "propietario" de ADMIN_USERS).
class UsuarioAdmin {
  final int id;
  final String usuario;
  final String nombre;
  final int rolId;
  final bool activo;

  UsuarioAdmin({
    required this.id,
    required this.usuario,
    required this.nombre,
    required this.rolId,
    required this.activo,
  });

  factory UsuarioAdmin.fromJson(Map<String, dynamic> json) {
    return UsuarioAdmin(
      id: (json['id'] as num).toInt(),
      usuario: json['usuario'] as String? ?? '',
      nombre: json['nombre'] as String? ?? '',
      rolId: (json['rolId'] as num?)?.toInt() ?? 0,
      activo: json['activo'] as bool? ?? true,
    );
  }
}
