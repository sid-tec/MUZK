enum What {
  artist(
    what: 'artist',
  ),
  album(
    what: 'album',
  ),
  track(
    what: 'track',
  ),
  trackFile(
    what: 'trackFile',
  );

  const What({
    required this.what,
  });

  final String what;
}
