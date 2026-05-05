enum EconomicIndex { ipca, inpc, igpm }

extension EconomicIndexLabel on EconomicIndex {
  String get label => switch (this) {
        EconomicIndex.ipca => 'IPCA',
        EconomicIndex.inpc => 'INPC',
        EconomicIndex.igpm => 'IGPM',
      };

  String get toApiString => switch (this) {
        EconomicIndex.ipca => 'IPCA',
        EconomicIndex.inpc => 'INPC',
        EconomicIndex.igpm => 'IGPM',
      };

  static EconomicIndex fromApi(String v) => switch (v.toUpperCase()) {
        'INPC' => EconomicIndex.inpc,
        'IGPM' => EconomicIndex.igpm,
        _ => EconomicIndex.ipca,
      };
}
