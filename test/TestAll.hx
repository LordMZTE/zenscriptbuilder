package;

import utest.ui.Report;
import utest.Runner;
import zenscriptbuilder.TestBasic;

class TestAll {
    static function main() {
        var runner = new Runner();
        runner.addCase(new TestBasic());
        Report.create(runner);
        runner.run();
    }
}
