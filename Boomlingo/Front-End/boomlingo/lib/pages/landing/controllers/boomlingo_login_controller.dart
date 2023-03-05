import 'package:get/get.dart';
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;

class BoomlingoLoginController extends GetxController {
  Map<String, dynamic>? userData = {
    "name" : "",
    "email" : "",
    "photoUrl" : ""
  };

  login() async {
    // Make Request Here
    // Get User Data
    userData!['name'] = '';
    userData!['email'] = '';
    userData!['photoUrl'] = '';

    _updateGlobalData();
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
  }
}