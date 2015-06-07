# creates a hash
# I was hoping running learn would give me the hash to copy-paste
# level1 (top) two teams: home and away
# the test for this is written that is basically tests for every player, so the stats actually have to be correct


def game_hash #doesn't expect arguments
  # where do players go? the test is not super explicit; put them as a key within teams, but value will be an array
  hashketball = { # opens game hash
                :home => { #opens home team #home_or_away
                     :team_name => "Brooklyn Nets", 
                     :colors => ["Black", "White"],
                     :players => { # open players
                      "Alan Anderson" => { # opens individual player
                          :number => 0,
                          :shoe => 16,
                          :points => 22,
                          :rebounds => 12,
                          :assists => 12,
                          :steals => 3,
                          :blocks => 1,
                          :slam_dunks => 1
                          },
                        "Reggie Evans" => {
                          :number => 30,
                          :shoe => 14,
                          :points => 12,
                          :rebounds => 12,
                          :assists => 12,
                          :steals => 12,
                          :blocks => 12,
                          :slam_dunks => 7
                          },                        
                        "Brook Lopez" => {
                          :number => 11,
                          :shoe => 17,
                          :points => 17,
                          :rebounds => 19,
                          :assists => 10,
                          :steals => 3,
                          :blocks => 1,
                          :slam_dunks => 15
                          },
                        "Mason Plumlee" => {
                          :number => 1,
                          :shoe => 19,
                          :points => 26,
                          :rebounds => 12,
                          :assists => 6,
                          :steals => 3,
                          :blocks => 8,
                          :slam_dunks => 5
                          },                          
                        "Jason Terry" => {
                          :number => 31,
                          :shoe => 15,
                          :points => 19,
                          :rebounds => 2,
                          :assists => 2,
                          :steals => 4,
                          :blocks => 11,
                          :slam_dunks => 1
                        } #closes Jason Terry
                      } # closes players
                    }, # closes home team
                 :away => { # opens away team
                      :team_name => "Charlotte Hornets", 
                      :colors => ["Turquoise", "Purple"], # should this be an array?
                      :players => { # opens players
                        "Jeff Adrien" => { # opens individual player
                          :number => 4,
                          :shoe => 18,
                          :points => 10,
                          :rebounds => 1,
                          :assists => 1,
                          :steals => 2,
                          :blocks => 7,
                          :slam_dunks => 2
                          },
                        "Bismak Biyombo" => {
                          :number => 0,
                          :shoe => 16,
                          :points => 12,
                          :rebounds => 4,
                          :assists => 7,
                          :steals => 7,
                          :blocks => 15,
                          :slam_dunks => 10
                          },                        
                        "DeSagna Diop" => {
                          :number => 2,
                          :shoe => 14,
                          :points => 24,
                          :rebounds => 12,
                          :assists => 12,
                          :steals => 4,
                          :blocks => 5,
                          :slam_dunks => 5
                          },
                        "Ben Gordon" => {
                          :number => 8,
                          :shoe => 15,
                          :points => 33,
                          :rebounds => 3,
                          :assists => 2,
                          :steals => 1,
                          :blocks => 1,
                          :slam_dunks => 0
                          },                          
                        "Brendan Haywood" => {
                          :number => 33,
                          :shoe => 15,
                          :points => 6,
                          :rebounds => 12,
                          :assists => 12,
                          :steals => 22,
                          :blocks => 5,
                          :slam_dunks => 12
                          } # closes Brendan Haywood
                        } # closes players                    
                      } # closes away team
                    } # closes the hash
  # try returning hashkerball hash?
end

# Return the number of points scored for any player, given that player's name  ('name') as a string. 
# .each_key
def num_points_scored(name)
  points_scored = nil
  game_hash.each do |home_or_away, team_details| 
    team_details[:players].each do |player, stats|
      if name == player.to_s
        points_scored = team_details[:players][name][:points]
      end
    end
  end
  points_scored
end

# returns shoe size of each player given player name ('name')
# same method as above for points
def shoe_size(name)
  shoe_size = nil
  game_hash.each do |home_or_away, team_details|
    team_details[:players].each do |player, stats|
      if name == player.to_s
        shoe_size = team_details[:players][name][:shoe]
      end
    end # end the do block
  end
  shoe_size
end

# Return both colors for any team, given the team name. Call the method team_colors.
# this is tricky because we are essentially returning a value of a key if we know a key in the same hash
# hash => | place => colors
# alternatively: if team_name = "Brookly Nets", return :colors of :home 
def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name.to_s
    team = :home
  else
    team = :away # assumes that the only other alternative is the away team; if we had more than 2 teams, we would have to do elseif OR look up by exact string match
  end
  game_hash[team][:colors]
end

# *Return* both teams names, given the game_hash. Call the method team_names. 
# Note: Since you have a method game_hash that returns your hash, there is no need to pass it in as an argument! 
# You can just call it from within your team_names method.
# I kept getting error that the size of my teams was 17, not 2, which means that the entire hash at that level was returned when using .each. 
# I ended up using .collect because that only returns a modified hash, which is what the test seemed to look for

def team_names
  game_hash.collect {|home_or_away, stats| team_name = stats[:team_name].to_s}
end

# Return all the player numbers for a team, given a team name ('team_name'). Call the method player_numbers.
# => we want the return hash to be 5 numbers long
# ...can we check if hash.include? certain key-value pair?
# this is similar to team_colors and shoe_size, but it seems like it wants a hash returned
# this wasn't working for me until I used .collect on it. so frustrating

def player_numbers(team_name)
  outcome = nil
  game_hash.each do |home_or_away, stats|
    if team_name == stats[:team_name]
      outcome = stats[:players].map do |player_name, deets|
      deets[:number]
      end
    end
  end
  outcome
end

# Return all the stats for a player, given a player's name ("name") 
# The stats should be returned as a hash, which each stat name as a key and the corresponding stat as a value. 
# player_stats("Alan Anderson")
# => { :number => 0,
#     :shoe => 16,
#     :points => 22,
#     :rebounds => 12,
#     :assists => 12,
#     :steals => 3,
#     :blocks => 1,
#     :slam_dunks => 1
#   }

def player_stats(name)
  output = nil
  game_hash.each do |home_or_away, team_details|
    team_details[:players].each do |key, value|
      if key == name 
        output = value
      end
    end
  end
  output
end

# Return the number of rebounds for the player with the largest shoe size. 
# Call the method big_shoe_rebounds.

def big_shoe_rebounds
  output = nil
  biggest_shoe_size = 0
  game_hash.each do |home_or_away, team_details|
    team_details[:players].each do |key, value|
      if value[:shoe] > biggest_shoe_size 
        biggest_shoe_size = value[:shoe]
        output = value[:rebounds]
      end
    end
  end
  output
end







