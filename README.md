easy
==============

easy is a minimalist LÖVE library that eases values ranging from 0 to 1.

<img src="http://img4.hostingpics.net/pics/447735out.gif" alt="demo" width="540"/>

Setup
----------------

```lua
local ease = require "easy" --require the library
```

Usage
----------------

Get converted value (0-1)
```lua
converted = ease("elasticin", value)
```

Methods and aliases
----------------

Ease
```lua
ease(type, value)
//->ease:get(...)
```

Add easing function
```lua
ease:add(name, string)
```
string is a mathematical expression that takes a parameter called "x"
for instance, "x * x + math.sqrt(x)"

Easing types
----------------

**quad**

**cubic**

**quart**

**quint**

**expo**

**sine**

**circ**

**back**

**elastic**

Add either "in" - "out" - "inout" at the end of each easing type
