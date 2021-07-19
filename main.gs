/**
 * slash command受付
 */
function doPost(e) {
  if (e.parameter.token !== PropertiesService.getScriptProperties().getProperty("SLASH_COMMAND_TOKEN")) {
    return ContentService.createTextOutput('Invalid token.');
  }

  const argText = e.parameter.text;
  if (argText === 'help') {
    return ContentService.createTextOutput(helpText());  
  }

  if (argText.length < 1) {
    return ContentService.createTextOutput(helpText());  
  }

  const args = argText.split(/\s+/);
  if (args < 2) {
    return ContentService.createTextOutput(helpText());  
  }

  const category = args[0];
  const action = args[1];
  const query = args.slice(2);

  return switchAction(category, action, query);
}

/**
 * slash commandに応じてアクションを切り替える
 */
function switchAction(categoryName, actionName, query) {
  switch (categoryName) {
    case 'issues':
      switch (actionName) {
        case 'get':
          return runIssuesGet();
        case 'new':
          return runIssuesNew(query);
        default:
          return ContentService.createTextOutput(helpText());
      }
    default:
      return ContentService.createTextOutput(helpText());  
  }
}

/**
 * issueの取得
 */
function runIssuesGet() {
  return ContentService.createTextOutput('TODO');
}

/**
 * issueの新規作成
 */
function runIssuesNew(query) {
  const title = query[0];
  if (title === undefined) {
    return ContentService.createTextOutput('titleを指定してください');
  }

  const results = createNewIssue(USER_NAME, 'neta', {title: title});
  if (!results) {
    return ContentService.createTextOutput('issueの作成に失敗しました');
  }

  return ContentService.createTextOutput(
    "issueの作成に成功しました\n" +
    'url: ' + results['html_url']
  );
}

/**
 * ヘルプテキストを表示する
 */
function helpText() {
  let text = [];

  for (const key in AVAILABLE_ACTIONS) {
    const action = AVAILABLE_ACTIONS[key];
    for (const k in action) {
      text.push('`' + SLASH_DOMMAND_NAME + ' ' + key + ' ' + action[k] + '`');
    }
  }

  return [
    '使用可能なスラッシュコマンドは以下です',
    text.join("\n")
  ].join("\n");
}

/**
 * helpText()のテスト
 */
function testHelpText() {
  console.log(helpText());
}
