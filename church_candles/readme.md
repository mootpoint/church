=====================

#Minetest mod  "Candles" by darkrose
modified for  the "Church Modpack" by Mootpoint

Copyright (C) Lisa Milne 2013 <lisa@ltmnet.com>
Licensed under GPL2.0 or later,

see http://www.gnu.org/licenses/gpl-2.0.html

=====================

Church Mod Forum Topic :

https://forum.minetest.net/viewtopic.php?f=9&t=16029&sid=65c913208fd877b0d021969ad86cd0d4#p242311


=====================

depends :
- default
- moreores
- farming

=====================

CRAFTING:

hive_wild:
	naturally occurring in apple trees, remove the leaves above the
	 hive to make it drop

bee hive:
	wood	wood		wood
	stick	hive_wild	stick
	stick	wood		stick

empty bee hive: (bees will occupy it after a few minutes)
	wood	wood	wood
	stick	paper	stick
	stick	wood	stick

honeycomb:
	punch a bee hive (or wild bee hive)... take too much and the
	 bees will sting you.

wax/honey:
	cook comb -> wax x2
	craft comb -> honey x2

candle:
	wax	string	wax

wall mount candle:
	candle
	ingot

candelabra:
	candle	candle	candle
	ingot	ingot	ingot		<- must be 3 of the same ore

ingot can be any of: steel, silver, bronze, copper, gold

candles (all types) are not lit when placed, punch with a torch to light
 them. punch them with anything but a torch to snuff them out

=====================
