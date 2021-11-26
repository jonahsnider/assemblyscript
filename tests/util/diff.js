import * as Diff from "diff";
import * as colors from "../../cli/util/colors.js";

export default function diff(filename, expected, actual) {
  var diff = Diff.structuredPatch(filename, filename, expected, actual, "expected", "actual", { context: 5 });
  if (!diff.hunks.length)
    return null;

  var ret = [];
  ret.push('--- ' + diff.oldHeader);
  ret.push('+++ ' + diff.newHeader);

  for (var i = 0; i < diff.hunks.length; i++) {
    var hunk = diff.hunks[i];
    ret.push(
      '@@ -' + hunk.oldStart + ',' + hunk.oldLines
      + ' +' + hunk.newStart + ',' + hunk.newLines
      + ' @@'
    );
    ret.push.apply(ret, hunk.lines.map(line =>
      line.charAt(0) === "+"
        ? colors.stdout.green(line)
        : line.charAt(0) === "-"
        ? line = colors.stdout.red(line)
        : line
    ));
  }

  return ret.join('\n') + '\n';
}
