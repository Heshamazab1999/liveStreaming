import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call/controller/video_call_controller.dart';

class VideoCall extends StatelessWidget {
  const VideoCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideoController());
    return Scaffold(
      body: Stack(
        children: [
          AgoraVideoViewer(
            client: controller.client,
            showNumberOfUsers: true,
            layoutType: Layout.grid,
            showAVState: true,
            enableHostControls: true, // Add this to enable host controls
          ),
          AgoraVideoButtons(
            client: controller.client,
            autoHideButtons: false,
            extraButtons: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                child: IconButton(
                    onPressed: () {
                      controller.delete();
                    },
                    icon: const Icon(
                      Icons.call_end,
                      color: Colors.white,
                      size: 25,
                    )),
              ),
            ],
            enabledButtons: const [
              BuiltInButtons.toggleMic,
              BuiltInButtons.toggleCamera,
              BuiltInButtons.switchCamera
            ],
          ),
        ],
      ),
    );
  }
}
