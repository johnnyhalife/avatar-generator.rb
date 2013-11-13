Initials Avatar Generator
===========================

A small Sinatra app influenced by http://dummyimage.com, and the original source code 
from [XXX's Fake Image](https://github.com/xxx/fakeimage) but written in Ruby.
	
Try it online at [http://fakeimage.heroku.com](http://fakeimage.heroku.com)

Installation
============
requires 1.9.2 (YARV)

    bundle install 
    unicorn (or your rack-app-handler of choice)

and it's Heroku deployment ready! 

		heroku create my-app 
		git push heroku master

Usage
======

In a browser, hit `http://localhost:4567/8080` for example and you will get an image like

![300x200](http://puu.sh/5hAi6.png)

You can get fancier `http://localhost:8080/300x200/ff0066/fff` by specifying hex 
color for background and foreground to get something like

![300x200 Background](http://puu.sh/5hAog.png)

Want to get like Gmail's new default avatar with initials, you can do 
`http://localhost:8080/120x120/ff0066/fff?text=johnny%20halife`

![120x120 Initials Mode](http://puu.sh/5hAth.png)

Want the full text get like Gmail's new default avatar with initials, you can do 
`http://localhost:8080/300x200/ff0066/fff?text=Johnny%20Halife&mode=full`

![120x120 Full Mode](http://puu.sh/5hAAG.png)

Want GIF or JPG instead? Try with the custom format!

`http://localhost:8080/300x200/ff0066/fff.gif?text=Johnny%20Halife&mode=full`

`http://localhost:8080/300x200/ff0066/fff.jpg?text=Johnny%20Halife&mode=full`

Want it square? No problem, just specify one dimention

Notes
===
It requires [ImageMagick](http://www.imagemagick.org/)


Copyright
=========

Copyright (c) 2013 [Johnny Halife](http://twitter.com/johnnyhalife) and [Mural.ly Dev Team](http://twitter.com/mural), 
released under the MIT license.

The included Droid Sans font is licensed under the Apache License, online at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).
