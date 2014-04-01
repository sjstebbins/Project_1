class Entry < ActiveRecord::Base
belongs_to(:user)







def alchemy
alchemy = "9ddce0957447a5027cf1a73b860383823614057f"
input = URI.escape(self.input)
results = HTTParty.get("http://access.alchemyapi.com/calls/text/TextGetRankedKeywords?outputMode=json&text=#{input}&apikey=#{alchemy}")
alchemyreturn = results["keywords"]
alchemyreturn.each do |keyword|
  keyword["text"]
end
return alchemyreturn
end

def self.wiki(arr)
input = arr.gsub(" ","%20")
  results = HTTParty.get("http://en.wikipedia.org/w/api.php?format=json&action=query&list=search&srlimit=10&srsearch=#{input}")
  wikireturn = results["query"]["search"]
  return wikireturn
end

# def self.wiki_images(arr)
# input = arr.gsub(" ","%20")
#   results = HTTParty.get("http://en.wikipedia.org/w/api.php?format=json&action=query&prop=titles=#{input}")
#   wikireturn = results["query"]["search"]
#   return wikireturn
# end

def self.google(arr)
  google= "AIzaSyD1NWvixbIxmWtt2AMm7Ku64rOJUkdSCXk"
  input = arr.gsub(" ", "%20")
  results = HTTParty.get("https://www.googleapis.com/customsearch/v1?key=#{google}&cx=#{google}&q=#{input}")
  googlereturn = results["items"]
  return googlereturn
end

def self.soundcloud(arr)
  soundcloud ="7ed26600f8fb7a4f4615218ac40d7a81"
  input = arr.gsub(" ","&amp")
  results= HTTParty.get("http://api.soundcloud.com/tracks.json?client_id=#{soundcloud}&q=#{input}&limit=5&streamable=true&order=created_at")
  soundcloudreturn = results
  return soundcloudreturn
end

# def self.youtube(arr)
#   google= "AIzaSyD1NWvixbIxmWtt2AMm7Ku64rOJUkdSCXk"
#   input = arr.gsub(" ","%20")
#   results= HTTParty.get("https://www.googleapis.com/youtube/v3/search?q=#{input}&key=#{google}")
#   youtubereturn = results
#   return youtubereturn
# end


# def nyt(arr)
# E674492D62783A2A0FBA9CCD14B75E19:6:69091683

# end


end
