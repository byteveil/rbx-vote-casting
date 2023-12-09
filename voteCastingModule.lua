local voteCasting = {}

function voteCasting.new()
	local voteObject = {}
	local votesCasted = {}

	function voteObject:CastVote(player: Player)
		if not votesCasted[player.UserId] then
			votesCasted[player.UserId] = 1
		end
	end

	function voteObject:RevokeVote(player: Player)
		if votesCasted[player.UserId] then
			votesCasted[player.UserId] = nil
		end
	end

	function voteObject:GatherVotes()
		local totalVotes = 0

		for _, votes in pairs(votesCasted) do
			totalVotes += votes
		end

		return totalVotes
	end

	return voteObject
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
		totalVotes += voteObject:GatherVotes()
	end

	return totalVotes
end

return voteCasting