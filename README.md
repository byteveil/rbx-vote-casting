# Vote Casting Module

Easily create voting objects and programmatically integrate a vote-casting system into your game.

---

## Adding the Vote Casting Module to Your Development Environment

You can use the module remotely, or you can save a copy of the module yourself here:

https://create.roblox.com/marketplace/asset/15564952937

Assuming you've inserted it and moved it to someplace (we'll use ReplicatedStorage for this example), you'll want to rename the module (we'll use "VoteCasting" as the example's name) and call it this way:

```lua
local replicatedStorage = game:GetService('ReplicatedStorage')
local voteCasting = require(replicatedStorage:WaitForChild('VoteCasting'))
```

Now if you want to use the module remotely, you can call the `require` method with the ID of the module so that you get the updates that I push to the module (if any are made):

```lua
local voteCasting = require(15564952937)
```

---

## Using the Module's Methods

### Creating a Voting Object

To set up a voting object, create a new instance of the `VoteCasting` module:

```lua
local voteObject = voteCasting.new()
```

### Casting Votes

To cast a vote for a player, use the `CastVote` method:

```lua
voteObject:CastVote(player)
```

### Revoking Votes

If you need to revoke a vote for a player, use the `RevokeVote` method:

```lua
voteObject:RevokeVote(player)
```

### Gathering Votes

To get the total number of votes cast, use the `GatherVotes` method:

```lua
local totalVotes = voteObject:GatherVotes()
print("Total Votes:", totalVotes)
```

### Getting the Highest Voted Object

If you have multiple voting objects and want to find the one with the highest votes, use the `GetHighestVote` function:

```lua
local highestVotedObject = voteCasting:GetHighestVote(voteObject1, voteObject2, voteObject3)
print("Highest Voted Object:", highestVotedObject)
```

### Getting the Total Votes Across Multiple Objects

To get the sum of votes from multiple voting objects, use the `GetAllVotes` function:

```lua
local totalVotesAcrossObjects = voteCasting:GetAllVotes(voteObject1, voteObject2, voteObject3)
print("Total Votes Across Objects:", totalVotesAcrossObjects)
```

Feel free to customize the module according to your specific requirements. I hope this is of some use to people.