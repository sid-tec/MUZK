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
  ),
  playlist(
    what: 'playlist',
  );

  const What({
    required this.what,
  });

  final String what;
}
