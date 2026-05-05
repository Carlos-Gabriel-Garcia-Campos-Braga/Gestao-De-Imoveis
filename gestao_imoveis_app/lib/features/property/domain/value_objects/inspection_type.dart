enum InspectionType { entry, exit }

extension InspectionTypeLabel on InspectionType {
  String get label => switch (this) {
        InspectionType.entry => 'Entrada',
        InspectionType.exit => 'Saída',
      };

  String get toApiString => switch (this) {
        InspectionType.entry => 'Entry',
        InspectionType.exit => 'Exit',
      };

  static InspectionType fromApi(String v) => switch (v.toLowerCase()) {
        'entry' => InspectionType.entry,
        'exit' => InspectionType.exit,
        _ => InspectionType.entry,
      };
}
