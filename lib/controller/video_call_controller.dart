import 'package:agora_uikit/agora_uikit.dart';
import 'package:get/get.dart';
import 'package:video_call/constant.dart';
import 'package:video_call/screens/login_screen.dart';
import 'package:video_call/services/login_services.dart';

class VideoController extends GetxController {
  final _services = LoginServices();
  final check = false.obs;
  final id = ''.obs;
  final AgoraClient client = AgoraClient(
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
    agoraConnectionData: AgoraConnectionData(
      tempToken: K.appToken,
      appId: K.appId,
      channelName: K.channel,
    ),
  );

  void initAgora() async {
    await client.initialize();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    check.value = true;
    initAgora();
    check.value = false;
  }

  get() {
    _services.get();
  }

  delete() {
    id.value = _services.auth.currentUser!.uid;
    _services.delete(id.value);
    client.engine.leaveChannel();
    client.engine.destroy();
    Get.offAll(() => const LoginScreen());
  }
}
