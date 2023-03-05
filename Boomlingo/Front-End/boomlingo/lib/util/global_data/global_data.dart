// Request Links
String awsBaseLink =
    "https://nxo4e82ase.execute-api.us-west-2.amazonaws.com/stage";

String awsWebScraperLink =
    "https://04sjfobd0h.execute-api.us-west-1.amazonaws.com/boomlingo";

String awsWebRTCServerIP = "52.53.149.67";

// Login Data
LoginType currentLoginType = LoginType.none;
Map<String, dynamic> userData = {
  "name": "",
  "email": "",
  "photoUrl": "",
  "joinDate": ""
};

// Authorization Data
String accessToken = '';
String refreshToken = '';

// Defining Log In Types
enum LoginType { none, google, facebook, boomlingo }
