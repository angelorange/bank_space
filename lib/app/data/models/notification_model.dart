import 'package:awesome_notifications/awesome_notifications.dart';





Future<void> createSignUpNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 1,
      channelKey: 'basic_channel',
      title: 'Confirme seu email',
      body: 'Você está registrado, por favor verifique seu email e confirme sua conta',
      notificationLayout: NotificationLayout.Default
      ),
    );
}


Future<void> createUsernameExistsNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 2,
      channelKey: 'basic_channel',
      title: 'Nome de usuário inválido ou já existe',
      body: 'Nome de usuário já existe, tente outro',
      notificationLayout: NotificationLayout.Default
      ),
    );
}


Future<void> createCPFExistsNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 3,
      channelKey: 'basic_channel',
      title: 'CPF inválido ou em uso, saiba mais',
      body: 'Caso o cpf seja seu, contate agora o suporte',
      notificationLayout: NotificationLayout.Default
      ),
    );
}


Future<void> createFullnameErrorNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 4,
      channelKey: 'basic_channel',
      title: 'Nome Completo Inválido',
      body: 'Nome Inválido',
      notificationLayout: NotificationLayout.Default
      ),
  );
}


Future<void> createBirthdayErrorNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 5,
      channelKey: 'basic_channel',
      title: 'Data de Nascimento Inválida',
      body: 'Data Inválida, Proibido registro de menores de 18 anos',
      notificationLayout: NotificationLayout.Default
      ),
  );

}


Future<void> createEmailExistsNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 6,
      channelKey: 'basic_channel',
      title: 'Email inválido ou já existente',
      body: 'Email em uso, caso não tenha criado a conta, contate o suporte',
      notificationLayout: NotificationLayout.Default
      ),
    );
}


Future<void> createInvalidLoginNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 7,
      channelKey: 'basic_channel',
      title: 'Email ou senha incorreto',
      body: 'Verifique a senha ou tente recupera-la',
      notificationLayout: NotificationLayout.Default
      ),
    );
}


Future<void> createLoginNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 8,
      channelKey: 'basic_channel',
      title: 'Uuário logado com sucesso',
      body: 'Bem-Vindo ao bankinspace',
      notificationLayout: NotificationLayout.Default
      ),
    );
}


Future<void> createTransactionConfirmedS(double double, String username) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 9,
      channelKey: 'basic_channel',
      title: 'Você realizous uma transfêrencia',
      body: 'Você realizous uma transfêrencia de OC\$ $double para $username',
      notificationLayout: NotificationLayout.Default
      ),
    );
}



Future<void> createTransactionFailed() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 10,
      channelKey: 'basic_channel',
      title: 'Sua transfêrencia falhou',
      body: 'Verifique os dados inseridos e tente novamente',
      notificationLayout: NotificationLayout.Default
      ),
    );
}




Future<void> createYouHaveNoMoney() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 11,
      channelKey: 'basic_channel',
      title: 'Saldo Insuficiente',
      body: 'Lembre-se da taxa de OC\$4,00',
      notificationLayout: NotificationLayout.Default
      ),
    );
}

Future<void> createInvalidUser() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 12,
      channelKey: 'basic_channel',
      title: 'Este usuário nõo existe',
      body: 'Verifique os dados inseridos',
      notificationLayout: NotificationLayout.Default
      ),
    );
}


Future<void> createInvalidPasswordNotification () async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent
    (
      id: 13,
      channelKey: 'basic_channel',
      title: 'Senha Inválida',
      body: 'Minimo de 6 digitos',
      notificationLayout: NotificationLayout.Default
      ),
    );

}


  Future<void> createInvalidCardNotification () async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent
      (
        id: 14,
        channelKey: 'basic_channel',
        title: 'Cartão Inválido',
        body: 'Verifique os dados inseridos',
        notificationLayout: NotificationLayout.Default
        ),
      );
  }

  Future<void> createCardFailedNotification () async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent
      (
        id: 15,
        channelKey: 'basic_channel',
        title: 'Transação falhou',
        body: 'Verifique os dados inseridos',
        notificationLayout: NotificationLayout.Default
        ),
      );
  }

  Future<void> createCardSuccessNotification () async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent
      (
        id: 16,
        channelKey: 'basic_channel',
        title: 'Cartão Adicionado',
        body: 'Você adicionou um cartão',
        notificationLayout: NotificationLayout.Default
        ),
      );
  }
