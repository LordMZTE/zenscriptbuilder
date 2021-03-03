package zenscriptbuilder;

import zenscriptbuilder.SyntaxElement;

class IngredientLiteral implements SyntaxElement {
    var type:IngredientType;
    var id:String;
    var count:Int;

    public function new(type:IngredientType, id:String, count:Int = 1) {
        this.type = type;
        this.id = id;
        this.count = count;
    }

    public function generateString():String {
        var postfix = this.count == 1 ? "" : '*${this.count}';
        return '<${this.type}:${this.id}>${postfix}';
    }

    public static function item(id:String, ?count:Int):IngredientLiteral {
        return new IngredientLiteral(IngredientType.Item, id, count);
    }
}

@:enum abstract IngredientType(String) {
    var Item = "item";
}
