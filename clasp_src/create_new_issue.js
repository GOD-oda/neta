/**
 * 特定のリポジトリにissueを追加する
 */
function createNewIssue(userName, repoName, options) {
  const url = makeIssueUrl(userName, repoName);
  const headers = {};
  const payload = {
    'title': options['title']
  };

  try {
    const res = postRequest(url, headers, payload);

    return JSON.parse(res);
  } catch (error) {
    logError(error);

    return false;
  }
}

/**
 * createNewIssue関数のテスト
 */
function testCreateNewIssue() {
  const userName = 'GOD-oda';
  const repoName = 'neta';

  const res = createNewIssue(userName, repoName, {title: 'test'});
  console.log(res);
}
