### Small App made for learn angularJS.

Till now the experience has been awesome. You can build prety comple logic
with very few lines of code.
I don't even miss jQuery at all!!

# Tools

* Angular 1.05 is loaded from a CDN
* Bootstrap stylesheets are also loaded from a CDN
* No jquery. Just plain old JS.
* The stylesheets are written in sass.
* The JS is written with coffescript.
* No real persitence, data is loaded from some hardcoded json.

# Description of the app and its features

Specification/Restrictions:

* At the begining you have 2 list of players.
  The first has the Starting Players, initialized with 4 players.
  The second has the substite players, initialized with 3 players.
* Each list has next to its title a small counter with the number of
  players that contains.
* The first list (Starting players) stores up to 7 players.
* The last list (Substitute players) stores up to 4 players.
* Each player in the list has a link to delete it.
* Each player has firstName, lastName and a number.
* There if a form to add more players, with a field for the fullName
  and another field for the number

Features already implemented:

* The form creates new players when it is submited.
* The players are appended to the first list if it is not full.
* Once the first list is full, the players are appended to the second one.
* Once both lists are full, the form disapears and you can't add more players.
* Each time a player is appended or removed from a list, the counter next to the
  list's title is updated.
* When a list becomes full, the word "Full" apears next to the player's counter.
  When a player is removed from a full list, the word "Full" disapears.
* While you type the fullName or number of a new player that is going to be appended
  to the first list, a live-preview (in yellow) of that player displayed.
  Once the form is submited the live preview is replaced by the appended player.

TODO:

* Sort players by name of number
* Filter/search players
* Move players between lists with drag and drop.
* When a Starting Player is hovered with the mouse, its position in the field is highlighted.


