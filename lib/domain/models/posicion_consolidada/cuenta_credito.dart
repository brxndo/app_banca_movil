class CuentasCredito {
  CuentasCredito({
    required this.idCuentaCredito,
    required this.numeroCuenta,
    required this.tipoCredito,
    required this.cuotasTotal,
    required this.montoTotal,
    required this.saldoPendiente,
    required this.cuotasPendiente,
    required this.frecuencia,
    required this.proximaFechaPago,
    required this.taza,
    required this.valorMora,
    required this.idUsuario,
  });
  late final int idCuentaCredito;
  late final String numeroCuenta;
  late final String tipoCredito;
  late final String cuotasTotal;
  late final String montoTotal;
  late final String saldoPendiente;
  late final String cuotasPendiente;
  late final String frecuencia;
  late final String proximaFechaPago;
  late final String taza;
  late final String valorMora;
  late final int idUsuario;

  CuentasCredito.fromJson(Map<String, dynamic> json) {
    idCuentaCredito = json['idCuentaCredito'];
    numeroCuenta = json['numeroCuenta'];
    tipoCredito = json['tipoCredito'];
    cuotasTotal = json['cuotasTotal'];
    montoTotal = json['montoTotal'];
    saldoPendiente = json['saldoPendiente'];
    cuotasPendiente = json['cuotasPendiente'];
    frecuencia = json['frecuencia'];
    proximaFechaPago = json['proximaFechaPago'];
    taza = json['taza'];
    valorMora = json['valorMora'];
    idUsuario = json['id_usuario'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['idCuentaCredito'] = idCuentaCredito;
    _data['numeroCuenta'] = numeroCuenta;
    _data['tipoCredito'] = tipoCredito;
    _data['cuotasTotal'] = cuotasTotal;
    _data['montoTotal'] = montoTotal;
    _data['saldoPendiente'] = saldoPendiente;
    _data['cuotasPendiente'] = cuotasPendiente;
    _data['frecuencia'] = frecuencia;
    _data['proximaFechaPago'] = proximaFechaPago;
    _data['taza'] = taza;
    _data['valorMora'] = valorMora;
    _data['id_usuario'] = idUsuario;
    return _data;
  }
}
