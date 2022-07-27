class ImageConstant {
  static ImageConstant _instace;
  static ImageConstant get instance {
    _instace ??= ImageConstant._init();
    return _instace;
  }

  ImageConstant._init();
  final couponsCodeJpg = "indirim".jpgToAssets;
  final couponsCodePng = "coupons".pngToAssets;
}

extension _ImageExtension on String {
  String get jpgToAssets => "assets/images/$this.jpg";
  String get pngToAssets => "assets/images/$this.png";
}
