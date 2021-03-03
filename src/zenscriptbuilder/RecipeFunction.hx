package zenscriptbuilder;

import zenscriptbuilder.SyntaxElement;

class RecipeFunction implements SyntaxElement {
    var object:Null<SyntaxElement>;
    var functionName:String;
    var args:Array<SyntaxElement>;

    public function new(object:Null<SyntaxElement>, functionName:String, args:Array<SyntaxElement>) {
        this.object = object;
        this.functionName = functionName;
        this.args = args;
    }

    public function generateString():String {
        var prefix = this.object == null ? "" : '${this.object.generateString()}.';
        var builtArgs = "";

        for (arg in this.args) {
            builtArgs += '${arg.generateString()},';
        }

        builtArgs = builtArgs.substr(0, builtArgs.length - 1);

        return '${prefix}${this.functionName}(${builtArgs})';
    }
}
