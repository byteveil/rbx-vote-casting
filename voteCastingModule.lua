local voteCasting = {}

function voteCasting.new()
	local self = {}
	local votesCasted = {}

	function self:CastVote(player: Player)
		if not votesCasted[player.UserId] then
			votesCasted[player.UserId] = 1
		end
	end

	function self:RevokeVote(player: Player)
		if votesCasted[player.UserId] then
			votesCasted[player.UserId] = nil
		end
	end

	function self:GatherVotes()
		local totalVotes = 0

		for _, votes in pairs(votesCasted) do
			totalVotes += votes
		end

		return totalVotes
	end
end

function voteCasting:GetHighestVote(...)
	local voteObjects = {...}
	local highestVotes = 0
	local highestVoteObject = nil

	for _, voteObject in pairs(voteObjects) do
		local totalVotes = voteObject:GatherVotes()

		if totalVotes > highestVotes then
			highestVotes = totalVotes
			highestVoteObject = voteObject
		end
	end

	return highestVoteObject
end

function voteCasting:GetAllVotes(...)
	local voteObjects = {...}
	local totalVotes = 0

	for _, voteObject in pairs(voteObjects) do
		totalVotes = totalVotes + voteObject:GatherVotes()
	end

	return totalVotes
end

return voteCasting