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
  user(
    what: 'user',
  ),
  playlist(
    what: 'playlist',
  );

  const What({
    required this.what,
  });

  final String what;
}
