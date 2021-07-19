/**
 * 特定のリポジトリにissueを追加する
 */
function createNewIssue(userName, repoName, options) {
  const url = makeIssueUrl(userName, repoName);

  const headers = {
    'accept': 'application/vnd.github.v3+json',
    'authorization': 'token ' + PropertiesService.getScriptProperties().getProperty("GITHUB_API_TOKEN")
  };
  let payload = {
    'title': options['title']
  };

  try {
    const res = UrlFetchApp.fetch(url, {
      'method': 'post',
      'headers': headers,
      'payload': JSON.stringify(payload)
    });

    return JSON.parse(res);
  } catch (error) {
    console.log("[名前] " + error.name + "\n" +
      "[場所] " + error.fileName + "(" + error.lineNumber + "行目)\n" +
      "[メッセージ]" + error.message + "\n" +      
      "[StackTrace]\n" + error.stack);

    return false;
  }
}
