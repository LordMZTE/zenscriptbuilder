package zenscriptbuilder;

import zenscriptbuilder.SyntaxElement;
import zenscriptbuilder.ArrayLiteral;
import zenscriptbuilder.IngredientLiteral;
import zenscriptbuilder.StringLiteral;
import zenscriptbuilder.Ident;
import zenscriptbuilder.RecipeFunction;

using Lambda;

class Zenscript {
    var functions:Array<SyntaxElement> = [];

    public var separator:String = "";

    public function new(?functions:Array<SyntaxElement>) {
        if (functions != null) {
            this.functions = functions;
        }
    }

    public function build():String {
        var out = "";
        for (f in functions) {
            out += '${f.generateString()};${this.separator}';
        }

        return out;
    }

    // recipe functions
    public function addFunction(func:SyntaxElement) {
        this.functions.push(func);
    }

    public function addShapeless(recipeName:String, output:IngredientArg, ingredients:Array<IngredientArg>) {
        this.addFunction(new RecipeFunction(new Ident("craftingTable"), "addShapeless", [
            new StringLiteral(recipeName),
            output,
            new ArrayLiteral(ingredients.map(i -> cast(i, SyntaxElement)))
        ]));
    }

    public function addShaped(recipeName:String, output:IngredientArg, ingredients:Array<Array<IngredientArg>>, mirrored:Bool = false) {
        this.addFunction(new RecipeFunction(new Ident("craftingTable"), mirrored ? "addShapedMirrored" : "addShaped", [
            new StringLiteral(recipeName),
            output,
            new ArrayLiteral(ingredients.map(a -> cast(new ArrayLiteral(a.map(i -> cast(i, SyntaxElement))), SyntaxElement)))
        ]));
    }

    public function removeByName(name:String) {
        this.addFunction(new RecipeFunction(new Ident("craftingTable"), "removeByName", [new StringLiteral(name)]));
    }

    public function removeByModid(modid:String) {
        this.addFunction(new RecipeFunction(new Ident("craftingTable"), "removeByModid", [new StringLiteral(modid)]));
    }

    public function removeByRegex(regex:String) {
        this.addFunction(new RecipeFunction(new Ident("craftingTable"), "removeByRegex", [new StringLiteral(regex)]));
    }

    public function removeRecipe(ingredient:IngredientArg) {
        this.addFunction(new RecipeFunction(new Ident("craftingTable"), "removeRecipe", [ingredient]));
    }

    public function removeAll() {
        this.addFunction(new RecipeFunction(new Ident("craftingTable"), "removeAll", []));
    }
}
