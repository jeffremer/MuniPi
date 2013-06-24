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

Assembly Instructions
=====================

Please see the instructions for your Raspberry Pi and the character display.

Usage
=====

Both the Ruby server and the Python client must be running simultaneously. The Python client requires sudo privelages to access the i2c devices required to display the countdown on the LCD character display.

I recommend running the server and the client at boot, and if you put the calls to the scripts in `/etc/rc.local` they will be run as root.

    $ su root
    $ echo "(sleep 2; ruby ~/MuniPi/Server.rb)&" >> /etc/rc/local
    $ echo "(sleep 2; python ~/MuniPi/Client.py)&" >> /etc/rc/local

I recognize that there are probably a million other ways to do this, if you have a better suggestion submit a pull request.
