enum PropertyType { house, apartment, commercial, land, other }

extension PropertyTypeLabel on PropertyType {
  String get label => switch (this) {
        PropertyType.house => 'Casa',
        PropertyType.apartment => 'Apartamento',
        PropertyType.commercial => 'Comercial',
        PropertyType.land => 'Terreno',
        PropertyType.other => 'Outro',
      };

  String get toApiString => switch (this) {
        PropertyType.house => 'House',
        PropertyType.apartment => 'Apartment',
        PropertyType.commercial => 'Commercial',
        PropertyType.land => 'Land',
        PropertyType.other => 'Other',
      };

  static PropertyType fromApi(String v) => switch (v.toLowerCase()) {
        'house' => PropertyType.house,
        'apartment' => PropertyType.apartment,
        'commercial' => PropertyType.commercial,
        'land' => PropertyType.land,
        'other' => PropertyType.other,
        _ => PropertyType.other,
      };
}
