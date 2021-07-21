/**
 * issueを取得する
 */
function getIssues(userName, repoName) {
  let url = makeIssueUrl(userName, repoName);

  try {
    const res = runGetRequest(url);

    return JSON.parse(res);
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
  console.log(res);
}
