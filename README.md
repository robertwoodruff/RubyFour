#Ruby Four
##A Ruby command-line tool for 4chan

***

[![Code Climate](https://codeclimate.com/github/robertwoodruff/RubyFour.png)](https://codeclimate.com/github/robertwoodruff/RubyFour)

###What is it?  
>RubyFour is a command-line tool for dealing with the website 4chan. It aims to be usable and simple, in both how it is written and how it is used, while still being powerfull

###How do I use it?

-	-b, --board _options_   
	Choose what board to operate on. Required!

-	-s, --search _string_   
	Search said board for a string. Only finds said string if it is in the OP of a thread. By default, does not do anything afterwards - Add "-l" or "--list" to get a list of thread numbers.

-	-l, --list   
	List the threads returned by something that gets threads. Only really useful with search.

-	-a, --archive _DIR_   
	Archives a thread in the specified directory. Currently, the only way to get threads to operate on is with "--search". Will download both images and the HTML, but the HTML is kinda wonky at the moment. Still, great for getting images.

-	-m, --mirror _DIR_    
	Mirrors an entire board. Currently a wee bit glitchy, so use at your own risk.

