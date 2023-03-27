class Usuario {
  Usuario({
    required this.idUsuario,
    required this.cedulaUsuario,
    required this.primerNombreUsuario,
    required this.segundoNombreUsuario,
    required this.apellidosUsuario,
    required this.fechaNacimientoUsuario,
    required this.direccionUsuario,
    required this.telefonoUsuario,
    required this.emailUsuario,
    required this.numeroSocioUsuario,
    required this.username,
    required this.password,
    required this.tokenUsuario,
  });
  late final int idUsuario;
  late final String cedulaUsuario;
  late final String primerNombreUsuario;
  late final String segundoNombreUsuario;
  late final String apellidosUsuario;
  late final String fechaNacimientoUsuario;
  late final String direccionUsuario;
  late final String telefonoUsuario;
  late final String emailUsuario;
  late final int numeroSocioUsuario;
  late final String username;
  late final String password;
  late final String tokenUsuario;

  Usuario.fromJson(Map<String, dynamic> json) {
    idUsuario = json['id_usuario'];
    cedulaUsuario = json['cedula_usuario'];
    primerNombreUsuario = json['primer_nombre_usuario'];
    segundoNombreUsuario = json['segundo_nombre_usuario'];
    apellidosUsuario = json['apellidos_usuario'];
    fechaNacimientoUsuario = json['fecha_nacimiento_usuario'];
    direccionUsuario = json['direccion_usuario'];
    telefonoUsuario = json['telefono_usuario'];
    emailUsuario = json['email_usuario'];
    numeroSocioUsuario = json['numero_socio_usuario'];
    username = json['username'];
    password = json['password'];
    tokenUsuario = json['token_usuario'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_usuario'] = idUsuario;
    _data['cedula_usuario'] = cedulaUsuario;
    _data['primer_nombre_usuario'] = primerNombreUsuario;
    _data['segundo_nombre_usuario'] = segundoNombreUsuario;
    _data['apellidos_usuario'] = apellidosUsuario;
    _data['fecha_nacimiento_usuario'] = fechaNacimientoUsuario;
    _data['direccion_usuario'] = direccionUsuario;
    _data['telefono_usuario'] = telefonoUsuario;
    _data['email_usuario'] = emailUsuario;
    _data['numero_socio_usuario'] = numeroSocioUsuario;
    _data['username'] = username;
    _data['password'] = password;
    _data['token_usuario'] = tokenUsuario;
    return _data;
  }
}
