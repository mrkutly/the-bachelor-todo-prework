def get_first_name_of_season_winner(data, season)
  winner = ""
  data[season].each do |contestant_hash|
    if contestant_hash["status"] == "Winner"
      winner << contestant_hash["name"]
    end
  end
  winner.split(" ")[0]
end

def get_contestant_name(data, occupation)
  name = ""
  data.each do |season, contestant_arr|
    contestant_arr.each do |contestant_hash|
      if contestant_hash["occupation"] == occupation
        name << contestant_hash["name"]
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  counter = 0

  data.each do |season, contestant_arr|
    contestant_arr.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  data.each do |season, contestant_arr|
    contestant_arr.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        return contestant_hash["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  age_array = []
  data[season].each do |contestant_hash|
    age_array << contestant_hash["age"].to_f
  end
  (age_array.reduce(:+).to_f / age_array.count.to_f).round
end
