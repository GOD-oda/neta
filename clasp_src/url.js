/**
 * issue関連APIのURL
 */
function makeIssueUrl(repoName, userName) {
  return 'https://api.github.com/repos/' + userName + '/' + repoName + '/issues';
}
