/**
 * issueを取得する
 */
function getIssues(userName, repoName) {
  let url = makeIssueUrl(userName, repoName);

  try {
    const json = UrlFetchApp.fetch(url);

    return json;    
  } catch (error) {
    logError(error);
    return false;
  }
}

/**
 * getIssues関数のテスト
 */
function testGetIssues() {
  const userName = 'GOD-oda';
  const repoName = 'neta';

  const res = getIssues(userName, repoName);
  console.log(JSON.parse(res));
}
