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
      id: 6,
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
      id: 6,
      channelKey: 'basic_channel',
      title: 'Uuário logado com sucesso',
      body: 'Bem-Vindo ao BankInSpace',
      notificationLayout: NotificationLayout.Default
      ),
    );
}
