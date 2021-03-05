package zenscriptbuilder;

import sys.io.File;
import utest.Assert;

using StringTools;

class TestBasic extends utest.Test {
    function testShapeless() {
        var zs = new Zenscript();

        zs.addShapeless("shapeless_example_1", "minecraft:grass", ["minecraft:wheat_seeds", "minecraft:dirt"]);
        zs.addShapeless("shapeless_example_2", {item:"minecraft:grass", count:8}, [
            "minecraft:wheat_seeds",
            "minecraft:dirt",
            "minecraft:dirt",
            "minecraft:dirt",
            "minecraft:dirt",
            "minecraft:dirt",
            "minecraft:dirt",
            "minecraft:dirt",
            "minecraft:dirt"
        ]);

        zs.separator = "\n";

        var script = zs.build();

        Assert.equals(File.getContent("test/zenscriptbuilder/shapeless_expected.zs").trim(), script.trim());
    }

    function testShaped() {
        var zs = new Zenscript();

        zs.addShaped("shaped_example_1", "minecraft:arrow", [
            ["minecraft:diamond", "minecraft:diamond"],
            ["minecraft:air", "minecraft:flint"],
            ["minecraft:air", "minecraft:flint"]
        ]);

        zs.addShaped("shaped_example_2", "minecraft:diamond_axe", [
            ["minecraft:diamond", "minecraft:diamond"],
            ["minecraft:diamond", "minecraft:stick"]
        ]);

        zs.addShaped("shaped_mirror_example_1", {item:"minecraft:arrow", count:2}, [
            ["minecraft:diamond", "minecraft:diamond"],
            ["minecraft:air", "minecraft:flint"],
            ["minecraft:air", "minecraft:flint"]
        ], true);

        zs.separator = "\n";

        var script = zs.build();

        Assert.equals(File.getContent("test/zenscriptbuilder/shaped_expected.zs").trim(), script.trim());
    }

    function testRemove() {
        var zs = new Zenscript();

        zs.removeByName("minecraft:sugar_from_sugar_cane");
        zs.removeRecipe(IngredientLiteral.item("minecraft:stick"));
        zs.removeByModid("minecraft");
        zs.removeByRegex("minecraft:.*_carpet");
        zs.removeAll();

        var script = zs.build();

        Assert.equals(File.getContent("test/zenscriptbuilder/remove_expected.zs").trim(), script.trim());
    }
}
