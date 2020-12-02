enum NewsSource { all, ynet, walla, mada }

extension OrganizationNameString on NewsSource {
  String displayName() {
    switch (this) {
      case NewsSource.all:
        return 'הכל';
      case NewsSource.ynet:
        return 'ynet';
      case NewsSource.walla:
        return 'וואלה';
      case NewsSource.mada:
        return 'מד״א';
      default:
        return 'הכל';
    }
  }
}
