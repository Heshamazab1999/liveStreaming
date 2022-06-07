class StatsModel {
  double? cpuTotalUsage;
  double? cpuAppUsage;
  int? duration;
  int? gatewayRtt;
  int? lastmileDelay;
  int? memoryAppUsageInKbytes;
  double? memoryAppUsageRatio;
  int? rxAudioBytes;
  int? rxBytes;
  int? rxKBitRate;
  int? txPacketLossRate;
  int? txAudioKBitRate;
  int? userCount;
  int? txVideoKBitRate;

  StatsModel(
      {this.cpuTotalUsage,
      this.gatewayRtt,
      this.cpuAppUsage,
      this.duration,
      this.lastmileDelay,
      this.memoryAppUsageInKbytes,
      this.memoryAppUsageRatio,
      this.rxAudioBytes,
      this.rxBytes,
      this.rxKBitRate,
      this.txPacketLossRate,
      this.txAudioKBitRate,
      this.userCount,
      this.txVideoKBitRate});

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['cpuTotalUsage'] = cpuTotalUsage;
    map['cpuAppUsage'] = cpuAppUsage;
    map['duration'] = duration;
    map['gatewayRtt'] = gatewayRtt;
    map['lastmileDelay'] = lastmileDelay;
    map['memoryAppUsageInKbytes'] = memoryAppUsageInKbytes;
    map['memoryAppUsageRatio'] = memoryAppUsageRatio;
    map['rxAudioBytes'] = rxAudioBytes;
    map['rxBytes'] = rxBytes;
    map['rxKBitRate'] = rxKBitRate;
    map['txPacketLossRate'] = txPacketLossRate;
    map['txAudioKBitRate'] = txAudioKBitRate;
    map['userCount'] = userCount;
    map['txVideoKBitRate'] = txVideoKBitRate;
    return map;
  }
}
