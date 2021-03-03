# zenscriptbuilder
This library allows building craft tweaker scripts using haxe.

## example
```haxe
var zs = new Zenscript();

zs.addShapeless("wood_to_stone", "minecraft:stone", ["minecraft:oak_log"]);

Sys.println(zs.build());
```
Prints
```zs
craftingTable.addShapeless("wood_to_stone", <item:minecraft:stone>, [<item:minecraft:oak_log>]);
```
