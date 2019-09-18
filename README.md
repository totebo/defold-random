# Defold Random
Pure Lua pseudo random generator(s) for Defold using Includes Mersenne Twister.

# Installation
You can use Defold Random in your own project by adding this project as a [Defold library dependency](http://www.defold.com/manuals/libraries/). Open your game.project file and in the dependencies field under project add:

    https://github.com/totebo/defold-random/archive/master.zip

Or point to the ZIP file of a [specific release](https://github.com/totebo/defold-random/releases).

## Example

Generates a pseudo-random number between 500 and 1000 from the seed 42:

      local random = require "random.random"

      function init(self)

      	local seed = 42

      	random:random_seed( seed )
      	print( random:random( 1000 ) ) -- Outputs 846

      	random:random_seed( seed )
      	print( random:random( 1000 ) ) -- Outputs 846

      end
