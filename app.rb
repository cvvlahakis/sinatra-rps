require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

def getMoveName(int)
  if (int == 1)
    return "rock"
  end
  if (int == 2)
    return "paper"
  end
  if (int == 3)
    return "scissors"
  end
  return
end

def getResultsAndComputersMove(player)
  if (player == "rock")
    player = 1
  end
  if (player == "paper")
    player = 2
  end
  if (player == "scissors")
    player = 3
  end
  results = "tied"
  computer = rand(1 .. 3)
  if (player > computer)
    results = "won"
  end
  if (player < computer)
    results = "lost"
  end
  computer = getMoveName(computer)
  return { results: results, computer: computer }
end

get("/rock") do
  @player = "rock"
  data = getResultsAndComputersMove(@player)
  @results = data[:results]
  @computer = data[:computer]
  erb(:rock)
end

get("/paper") do
  @player = "paper"
  data = getResultsAndComputersMove(@player)
  @results = data[:results]
  @computer = data[:computer]
  erb(:paper)
end

get("/scissors") do
  @player = "scissors"
  data = getResultsAndComputersMove(@player)
  @results = data[:results]
  @computer = data[:computer]
  erb(:scissors)
end
