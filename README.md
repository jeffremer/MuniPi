MuniPi
======

MuniPi is a small software assembly of a Ruby socket server and Python client
daemon that displays the NextMUNI predictions for a predefined set of Muni
routes.

Software
========

MuniPi requires a few software libraries to get running. You can install the Ruby dependencies from the Gemfile but running `bundle install`, of course that means you need [bundler](http://gembundler.com) and a version of Ruby.

The Python dependencies are installable as a submodule, just run `git submodule update --init`.
Hardware
========

MuniPi was designed to run on a [Raspberry Pi](http://www.raspberrypi.org), however the software will run anywhere you have Ruby and Python, and the hardware part of things will run basically anywhere you have i2c GPIO.

BOM
===

* [Raspberry Pi Model A](http://www.adafruit.com/products/1344)
* [Adafruit 16x2 Character LCD + Keypad](http://www.adafruit.com/products/1110)
