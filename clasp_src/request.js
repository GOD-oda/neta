/**
 * getリクエストする関数
 * @throws error
 */
function runGetRequest(url, headers = {}, payload = {}) {
  let options = {
    'headers': {...headers, ...{
      'accept': 'application/vnd.github.v3+json',
    }}
  };

  if (Object.keys(payload).length > 0) {
    options['payload'] = JSON.stringify(payload);
  }

  return UrlFetchApp.fetch(url, options);
}

/**
 * postリクエストする関数
 * @throws error
 */
function runPostRequest(url, headers = {}, payload = {}) {
  return UrlFetchApp.fetch(url, {
    'method': 'post',
    'headers': {...headers, ...{
      'accept': 'application/vnd.github.v3+json',
      'authorization': 'token ' + PropertiesService.getScriptProperties().getProperty("GITHUB_API_TOKEN")
    }},
    'payload': JSON.stringify(payload)
  });
}
