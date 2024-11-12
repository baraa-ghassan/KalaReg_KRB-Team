// String linkServerName = "http://localhost/team_project";
String linkServerName = "http://10.0.2.2/team_project";
// String linkServerName = "http://krb-kalareg.kesug.com/team_project";

void updateServerAddress(String newAddress) {
  // linkServerName = "http://$newAddress/team_project";
  linkServerName = "http://10.0.2.2/team_project";
  // linkServerName = "http://krb-kalareg.kesug.com/team_project";
}

final String linkLogin = "$linkServerName/auth/login.php";
final String linkHome = "$linkServerName/Sections/home.php";
