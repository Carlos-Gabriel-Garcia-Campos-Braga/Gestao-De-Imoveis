enum ContractStatus { active, expired, terminated }

extension ContractStatusLabel on ContractStatus {
  String get label => switch (this) {
        ContractStatus.active => 'Ativo',
        ContractStatus.expired => 'Encerrado',
        ContractStatus.terminated => 'Rescindido',
      };
}
