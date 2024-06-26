# Godot DataBind Controls

A godot addon which facilitates data binding to enable an MVC pattern for GUI controls.
Bind and Repeat nodes can be added inside leaf `Control` nodes and will automatically bind the
control's properties to reflect an object property. Run the demo project at the top level of
this repo to see `Example.gd` and `ExampleRepeat.gd` in action.

## Detecting Changes

Instead of using a custom class as the base of all data models this version uses a global 'change detection'
mechanism. Any place that may update data that needs to be reflected in the ui should call DataBindings.detect_changes()

## Using Bind and Repeat

### Control Binds

![Control Binds in the editor](docs/binds.png)

The `Binds` node will automatically mirror the property names of it's parent `Control` node.
The user can set the properties of the `Binds` node to bind data to a `Model` instance contained in a
property the `owner` (scene root).

### Binding to an Array

![BindRepeat in the editor](docs/repeat.png)

The `BindRepeat` node should be added as a child of an _Instanced Child Scene_ and allows that scene
to be used as a template which will be repeated for each item in it's bound `ArrayModel`.
Set the `array_bind` and `target_property` properties on the `Repeat` node to bind to an `ArrayModel`.

* `array_bind`: Path to a property on the `owner` that contains the array items.
	Each item will create an instance of the `parent`.
* `target_property`: Property name in the `parent` that should be set to contain the value for each instance.

### Binding to ItemList etc

The `BindItems` node can be added as a child of a `ItemList`, `PopupMenu` or `OptionButton` node to bind to their item list.
The `item_selected` bind will sync the selected status of each item to the model in both directions, etc.
Set the `array_bind` property to the model path for an array of objects. Each object is added as an item using the item bind.

* `array_bind`: Path to a property on the `owner` that contains the array items.
	Each item will create an item in the `parent`
* `Item text`/`item_text`: A property on the array item that should be used for the item's text
* `Item Icon`/`item_icon`: A property on the array item that should be used for the item's icon
* `Item Selected`, `Item Disabled`, `Item Selectable`, `Item Tooltip` (etc): Set the name of a property to read from
	each array item to be bound to that aspect of the item in the list

## Development

All gdscript files should conform to gdformat and pass gdlint from [godot-gdscript-toolkit](https://github.com/Scony/godot-gdscript-toolkit). See the [installation procedure](https://github.com/Scony/godot-gdscript-toolkit#installation)

Run `./update_addons.sh` to checkout submodules etc. Run `check.sh` to check whether all files are passing the format/lint checks. (see `check.sh --help` for more info)


## Icons

Icons are based on the fontawesome icon set which uses the CC BY 4.0 license:
https://fontawesome.com/license/free
