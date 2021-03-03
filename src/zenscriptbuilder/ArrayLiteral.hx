package zenscriptbuilder;

import zenscriptbuilder.SyntaxElement;

class ArrayLiteral implements SyntaxElement {
    var elements:Array<SyntaxElement>;

    public function new(elements:Array<SyntaxElement>) {
        this.elements = elements;
    }

    public function generateString():String {
        var values = "";

        for (e in this.elements) {
            values += '${e.generateString()},';
        }

        values = values.substr(0, values.length - 1);

        return '[${values}]';
    }
}
