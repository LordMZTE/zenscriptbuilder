package zenscriptbuilder;

import zenscriptbuilder.SyntaxElement;

class Ident implements SyntaxElement {
    var s:String;

    public function new(s:String) {
        this.s = s;
    }

    public function generateString():String {
        return this.s;
    }
}
