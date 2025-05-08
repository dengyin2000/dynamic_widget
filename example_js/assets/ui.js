const buttons = [
    { label: '+', event: "op('add')" },
    { label: '-', event: "op('sub')" },
    { label: 'x', event: "op('mul')" },
    { label: '÷', event: "op('div')" },
    { label: '1', event: "digit(1)" },
    { label: '2', event: "digit(2)" },
    { label: '3', event: "digit(3)" },
    { label: 'C', event: "clear()" },
    { label: '4', event: "digit(4)" },
    { label: '5', event: "digit(5)" },
    { label: '6', event: "digit(6)" },
    { label: '0', event: "digit(0)" },
    { label: '7', event: "digit(7)" },
    { label: '8', event: "digit(8)" },
    { label: '9', event: "digit(9)" },
    { label: '=', event: "equal()" }
];

const grid_app = {
    "type": "GridView",
    "crossAxisCount": 4,
    "padding": "10, 10, 10, 10",
    "mainAxisSpacing": 4.0,
    "crossAxisSpacing": 4.0,
    "childAspectRatio": 1.6,
    "children": buttons.map(button => ({
        "type": "TextButton",
        "child": {
            "type": "Text",
            "data": button.label,
            "style": {
                "fontSize": 30.0
            }
        },
        "click_event": button.event
    }))
};

App =
{
    "type": "Column",
    "crossAxisAlignment": "end",
    "mainAxisAlignment": "end",
    "mainAxisSize": "max",
    "textBaseline": "alphabetic",
    "textDirection": "ltr",
    "verticalDirection": "down",
    "children": [{
        "type": "Text",
        "data": "",
    }, {
        "type": "Text",
        "data": "          ",
        "maxLines": 3,
        "overflow": "ellipsis",
        "style": {
            "color": "#000000",
            "fontSize": 40.0,
            "fontWeight": "bold",
        }
    },
    {
        "type": "Expanded",
        "child": grid_app
    }]
}

var _pending = 0;
var _pendingOp = 'none';
var _display = 0;
var _displayLocked = false;
var _afterEquals = false;

function _resolve() {
    if (_pendingOp === 'add') {
        _display = _pending + _display;
    } else if (_pendingOp === 'sub') {
        _display = _pending - _display;
    } else if (_pendingOp === 'mul') {
        _display = _pending * _display;
    } else if (_pendingOp === 'div') {
        _display = _pending / _display;
    }
    _pendingOp = 'none';
}

function clear() {
    _pending = 0;
    _pendingOp = 'none';
    _display = 0;
    _displayLocked = false;
    _afterEquals = false;
    App.children[1].data = ""
}

function digit(n) {
    if (_displayLocked || _afterEquals) {
        _display = 0;
        _displayLocked = false;
        _afterEquals = false;
    }
    _display = _display * 10 + n;
    App.children[1].data = _display + "          ";
}

function op(operation) {
    _resolve();
    if (_afterEquals) {
        _pending = _display;
        _afterEquals = false;
    } else {
        _pending = _display;
    }
    _pendingOp = operation;
    _display = 0;
    _displayLocked = false;
    App.children[1].data = (operation === 'add' ? '+' : operation === 'sub' ? '-' : operation === 'mul' ? 'x' : '÷') + "          ";
}

function equal() {
    _resolve();
    _pending = _display;
    _displayLocked = true;
    _afterEquals = true;
    App.children[1].data = _display + "          ";
}
