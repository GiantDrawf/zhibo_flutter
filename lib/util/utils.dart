String handleUrl(String originUrl) {
  if (originUrl.contains('http:') || originUrl.contains('https:')) {
    return originUrl;
  } else if (originUrl.indexOf('//') == 0) {
    return 'http:' + originUrl;
  }

  return originUrl;
}
