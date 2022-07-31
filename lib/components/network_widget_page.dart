import 'package:auto_size_text/auto_size_text.dart';
import 'package:birindirm_deneme/core/init/network/network_change.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NetworkWidgetPage extends StatefulWidget {
  const NetworkWidgetPage({Key key}) : super(key: key);

  @override
  State<NetworkWidgetPage> createState() => _NetworkWidgetPageState();
}

class _NetworkWidgetPageState extends State<NetworkWidgetPage> {
  INetworkManager _networkManagerControl;
  NetworkResult _networkResult;
  @override
  void initState() {
    super.initState();
    _networkManagerControl = NetworkManagerControl();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _networkManagerControl.handlerNetworkChange((result) {
        _updateResult(result);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: _networkResult == NetworkResult.off ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Container(
        height: 60,
        color: context.colorScheme.onError,
        child: Padding(
            padding: context.paddingLow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.perm_scan_wifi,
                  color: context.colorScheme.onSurface,
                ),
                const SizedBox(width: 15),
                Expanded(
                    child: AutoSizeText("İnternete baglanılmıyor lütfen baglantınızı  kontrol ediniz",
                        style: context.textTheme.headline6.copyWith(fontSize: 16, color: context.colorScheme.onSurface))),
              ],
            )),
      ),
      secondChild: const SizedBox(),
      duration: context.durationLow,
    );
  }

  void _updateResult(NetworkResult result) {
    setState(() {
      _networkResult = result;
    });
  }
}
