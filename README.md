easy
==============

easy is a minimalist LÖVE library that eases values ranging from 0 to 1.

Setup
----------------

```lua
local ease = require "easy" --require the library
```

Usage
----------------

Get converted value (0-1)
```lua
converted = ease(value, "elasticin")
```

Methods and aliases
----------------

Ease
```lua
ease(value, type)
```

Easing types
----------------

quad
cubic
quart
quint
expo
sine
circ
back
elastic

Add either "in" - "out" - "inout" at the end of each easing type
