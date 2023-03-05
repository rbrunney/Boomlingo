import 'package:get/get.dart';
import 'dart:convert';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:boomlingo/util/requests/requests.dart';
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;

class BoomlingoLoginController extends GetxController {
  Map<String, dynamic>? userData = {
    "name": "",
    "email": "",
    "photoUrl": "",
    "joinDate": ""
  };

  login(String username, String password) async {
    await Requests().makePostRequest("${global_data.awsBaseLink}/user/get/one",
        {"username": username}).then((value) async {
      var response = json.decode(value);

      try {
        if (DBCrypt().checkpw(password, response[0]['password'])) {
          userData!['name'] =
              "${response[0]['firstname']} ${response[0]['lastname']}";
          userData!['email'] = response[0]['email'];
          userData!['joinDate'] = response[0]['joindate'];
          _updateGlobalData();
        }
      } catch (exception) {
        print(exception);
      }
    });
  }

  logout() async {
    global_data.userData['name'] = '';
    global_data.userData['email'] = '';
    global_data.userData['photoUrl'] = '';
  }

  _updateGlobalData() {
    // Update Global User Data
    global_data.userData['name'] = userData!['name'];
    global_data.userData['email'] = userData!['email'];
    global_data.userData['photoUrl'] = userData!['photoUrl'];
    global_data.userData['joinDate'] = userData!['joinDate'];

    // Update LoginType for later
    global_data.currentLoginType = global_data.LoginType.boomlingo;
  }
}
