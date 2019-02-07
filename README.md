# Defold Random
Pure Lua pseudo random generator(s) for Defold. Includes Mersenne Twister, Linear Congruential Generator and Multiply with Carry.

# Installation
You can use Defold Random in your own project by adding this project as a [Defold library dependency](http://www.defold.com/manuals/libraries/). Open your game.project file and in the dependencies field under project add:

    https://github.com/totebo/defold-random/archive/master.zip

Or point to the ZIP file of a [specific release](https://github.com/totebo/defold-random/releases).

## Example

Generates a pseudo-random number between 500 and 1000 from the seed 42:

      require "random.random"

      mersenne_twister:randomseed( 42 )
      print( mersenne_twister:random( 500,1000 ) )

      linear_congruential_generator:randomseed( 42 )
      print( linear_congruential_generator:random( 500,1000 ) )

      multiply_with_carry:randomseed( 42 )
      print( multiply_with_carry:random( 500,1000 ) )
