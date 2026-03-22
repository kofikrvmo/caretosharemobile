class Endpoints {
  static const String example = "/example";

  static const String startSoloSession = "/game/start-solo-session";
  static const String endSoloSession = "/game/end-solo-session";
  static const String nextSoloQuestion = "/game/next-solo-question";
  static const String createAccount = "/auth/register";
  static const String login = "/auth/login";
  static const String resetByEmail = "/auth/request-password-reset";
  static const String team = "/teams";

  static const String inviteTeam = "/teams/{teamId}/invitations";
  static const String getUsers = "/users";
  static const String leaderboard = "/leaderboard";
  static const String rankedGameSession = "/ws-doc/ranked-game-session";
  static const String resetPassword = "/auth/reset-password";
}
