import 'package:get/get.dart';
import 'dart:convert';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:boomlingo/util/requests/requests.dart';
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;

class BoomlingoLoginController extends GetxController {
  Map<String, dynamic>? userData = {"name": "", "email": "", "photoUrl": ""};

  login(String username, String password) async {
    await Requests().makePostRequest("${global_data.awsBaseLink}/user/get/one",
        {"username": username}).then((value) async {
      var response = json.decode(value);

      try {
        if (DBCrypt().checkpw(password, response[0]['password'])) {
          userData!['name'] = response[0]['username'];
          userData!['email'] = response[0]['email'];
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

    // Update LoginType for later
    global_data.currentLoginType = global_data.LoginType.boomlingo;

    print('Made Log In');
  }
}
