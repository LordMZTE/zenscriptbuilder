package zenscriptbuilder;

import zenscriptbuilder.IngredientLiteral;

abstract IngredientArg(IngredientLiteral) from IngredientLiteral to IngredientLiteral {
    @:from static inline function fromItemStruct(s:{item:String, ?count:Int}):IngredientArg
        return IngredientLiteral.item(s.item, s.count);

    @:from static inline function fromString(s:String):IngredientArg 
        return IngredientLiteral.item(s);
}
