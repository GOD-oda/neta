/**
 * getリクエストする関数
 * @throws error
 */
function getRequest(url, headers = {}, payload = {}) {  
  return UrlFetchApp.fetch(url, {
      'headers': {...headers, ...{
        'accept': 'application/vnd.github.v3+json',
        'authorization': 'token ' + PropertiesService.getScriptProperties().getProperty("GITHUB_API_TOKEN")
      }},
      'payload': JSON.stringify(payload)
    });
}

/**
 * postリクエストする関数
 * @throws error
 */
function postRequest(url, headers = {}, payload = {}) {
  return UrlFetchApp.fetch(url, {
      'headers': {...headers, ...{
        'accept': 'application/vnd.github.v3+json',
        'authorization': 'token ' + PropertiesService.getScriptProperties().getProperty("GITHUB_API_TOKEN")
      }},
      'payload': JSON.stringify(payload)
    });
}
