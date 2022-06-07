import 'package:agora_uikit/agora_uikit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:video_call/constant.dart';
import 'package:video_call/model/stats_model.dart';
import 'package:video_call/screens/login_screen.dart';
import 'package:video_call/services/login_services.dart';

class VideoController extends GetxController {
  final _services = LoginServices();
  final check = false.obs;
  final id = ''.obs;
  final AgoraClient client = AgoraClient(
    agoraEventHandlers: AgoraRtcEventHandlers(
      rtcStats: (stats) async {
        StatsModel statsModel = StatsModel(
          cpuAppUsage: stats.cpuAppUsage,
          cpuTotalUsage: stats.cpuTotalUsage,
          duration: stats.duration,
          gatewayRtt: stats.gatewayRtt,
          lastmileDelay: stats.lastmileDelay,
          memoryAppUsageInKbytes: stats.memoryAppUsageInKbytes,
          memoryAppUsageRatio: stats.memoryAppUsageRatio,
          rxAudioBytes: stats.rxAudioBytes,
          rxBytes: stats.rxBytes,
          rxKBitRate: stats.rxKBitRate,
          txAudioKBitRate: stats.txAudioKBitRate,
          txPacketLossRate: stats.txPacketLossRate,
          txVideoKBitRate: stats.txAudioKBitRate,
          userCount: stats.userCount,
        );
        DatabaseReference ref = FirebaseDatabase.instance.ref("users/stats");
        await ref.set(statsModel.toJson());
        print(ref.key);
        print("__________________");
        print(stats.cpuTotalUsage);
        print(stats.cpuAppUsage);
        print(stats.duration);
        print(stats.gatewayRtt);
        print(stats.lastmileDelay);
        print(stats.memoryAppUsageInKbytes);
        print(stats.memoryAppUsageRatio);
        print(stats.rxAudioBytes);
        print(stats.rxBytes);
        print(stats.rxKBitRate);
        print(stats.txPacketLossRate);
        print(stats.txVideoKBitRate);
        print(stats.userCount);
        print(stats.txAudioKBitRate);
        print(statsModel.toJson());
      },
    ),
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


  delete() {
    _services.delete();
    client.engine.leaveChannel();
    client.engine.destroy();
    Get.offAll(() => const LoginScreen());
  }
}
