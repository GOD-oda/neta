/**
 * エラーとしてログを残す
 */
function logError(error) {
  console.log(error);
  console.error("[名前] " + error.name + "\n" +
      "[場所] " + error.fileName + "(" + error.lineNumber + "行目)\n" +
      "[メッセージ]" + error.message + "\n" +      
      "[StackTrace]\n" + error.stack);  
}
