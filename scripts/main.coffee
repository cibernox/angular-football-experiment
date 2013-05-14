startingPlayersJson = [
  {firstName: "Miguel", lastName: "Camba",    number: "11"},
  {firstName: "Juan",   lastName: "Caamaño",  number: "7" },
  {firstName: "Carlos", lastName: "Escaloni", number: "2" },
  {firstName: "Yago",   lastName: "Novoa",    number: "5" }
]

substitutePlayersJson = [
  {firstName: "Pedro",  lastName: "Fraile",   number: "10"},
  {firstName: "Roberto",lastName: "Fernandez",number: "4" },
  {firstName: "Borja",  lastName: "Regueira", number: "6" }
]

##
# MODELS
##

class Player
  firstName: null
  lastName:  null
  number:    null
  hovered:   false
  constructor: (args...) ->
    if args.length is 1                      # Receives a json object
      json       = args[0]
      @firstName = json.firstName
      @lastName  = json.lastName
      @number    = json.number
    else if args.length is 2                 # Receives fullName and number
      nameComponents = args[0].split(" ")
      @firstName = nameComponents[0]
      @lastName  = nameComponents[1]
      @number    = args[1]
  fullName: -> @firstName + " " + @lastName

class PlayersList
  name:     null
  maxSize:  null
  players:  []
  constructor: (@name, @maxSize, @players = []) ->
  size: -> @players.length
  isFull: -> @size() >= @maxSize

# Here starts the angular JS part of the code.
# All the lines above are models in plain old javascript to encapsulate
# small methods like isFull() for lists or fullName() for players.
PlayersCtrl = ($scope) ->
  $scope.playersLists = [
    new PlayersList("Starting Players", 6, startingPlayersJson.map((el) -> new Player(el))),
    new PlayersList("Substitute Players", 4, substitutePlayersJson.map((el) -> new Player(el)))
  ]

  $scope.setHovered = ->
    debugger
    @player.hovered = true

  $scope.allListsFull = ->
    $scope.playersLists.every (list) -> list.isFull()

  $scope.addPlayer = ->
    startingPlayers = $scope.playersLists[0]
    substitutePlayers = $scope.playersLists[1]
    newPlayer = new Player($scope.playerFullName, $scope.playerNumber)
    if startingPlayers.isFull() is false
      startingPlayers.players.push(newPlayer)
    else
      substitutePlayers.players.push(newPlayer)
    $scope.playerFullName = ""
    $scope.playerNumber = ""

  $scope.deletePlayer = ->
    for playersList in $scope.playersLists
      index = playersList.players.indexOf(@player)
      if index > -1
        playersList.players.splice(index, 1)

MovesCtrl = ($scope) ->
  $scope.moves = [
    {time: "42:15", description: "Juan García despeja con los puños un corner peligroso! Eso ha estado cerca"},
    {time: "39:15", description: "Roberto Fernandez ha iniciado un contragolpe que a punto ha estado de acabar en gol de no ser por la aparición de un contrario"},
    {time: "23:55", description: "Gol! Gol! Gol! Magistral jugada de Pedro Fraile por la banda que ha encontrado a Gelo desmarcado listo para sentenciar de cabeza"}
  ]
