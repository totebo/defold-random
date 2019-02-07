# Defold Random
A minimal state machine, running one state at a time with code of your choice triggering on enter, run and exit.


# Installation
You can use Defold States in your own project by adding this project as a [Defold library dependency](http://www.defold.com/manuals/libraries/). Open your game.project file and in the dependencies field under project add:

    https://github.com/totebo/defold-random/archive/master.zip

Or point to the ZIP file of a [specific release](https://github.com/totebo/defold-random/releases).


## Example

      require "random.random"

      mersenne_twister:randomseed( 42 )
      print( mersenne_twister:random( 1000 ) )

      linear_congruential_generator:randomseed( 42 )
      print( linear_congruential_generator:random( 1000 ) )

      multiply_with_carry:randomseed( 42 )
      print( multiply_with_carry:random( 1000 ) )
