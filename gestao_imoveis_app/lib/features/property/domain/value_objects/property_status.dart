enum PropertyStatus { vacant, occupied, maintenance }

extension PropertyStatusLabel on PropertyStatus {
  String get label => switch (this) {
        PropertyStatus.vacant => 'Vago',
        PropertyStatus.occupied => 'Ocupado',
        PropertyStatus.maintenance => 'Manutenção',
      };

  String get toApiString => switch (this) {
        PropertyStatus.vacant => 'Vacant',
        PropertyStatus.occupied => 'Occupied',
        PropertyStatus.maintenance => 'Maintenance',
      };

  static PropertyStatus fromApi(String v) => switch (v.toLowerCase()) {
        'vacant' => PropertyStatus.vacant,
        'occupied' => PropertyStatus.occupied,
        'maintenance' => PropertyStatus.maintenance,
        _ => PropertyStatus.vacant,
      };
}
