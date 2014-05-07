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
  input = CGI::escape(arr)
  response = HTTParty.get("https://www.googleapis.com/customsearch/v1?key=#{google}&cx=015698937417642655162:-drsz93czku&q=#{input}")
  results = response["items"]
  return results
end
def self.soundcloud(arr)
  soundcloud ="7ed26600f8fb7a4f4615218ac40d7a81"
  input = arr.gsub(" ","%20")
  results= HTTParty.get("http://api.soundcloud.com/tracks.json?client_id=#{soundcloud}&q=#{input}&limit=5&streamable=true&order=created_at")
  soundcloudreturn = results
  return soundcloudreturn
end


def self.youtube(arr)
  google= "AIzaSyD1NWvixbIxmWtt2AMm7Ku64rOJUkdSCXk"
  input = CGI::escape(arr)
  results= HTTParty.get("https://gdata.youtube.com/feeds/api/videos?q=#{input}&key=#{google}&max-results=1&alt=json")
  youtubereturn = results["feed"]["entry"][0]["id"]["$t"]
  return youtubereturn
end

# def self.echonest(arr)
#   echonest = "CNQ7EJLGCHNW8QOIT"
#   input = arr.gsub(" ", "%20")
#   results = HTTParty.get("http://developer.echonest.com/api/v4/song/search?api_key=#{echonest}&format=json&results=1&combined=#{input}")

# end

# def self.instagram(arr)
#   instagram = "fea8919ccf8a47daa6c5d77fb52e0fda"
#   input = arr.gsub(" ", "%20")
#   results = HTTParty.get("https://api.instagram.com/v1/tags/#{input}/media/recent?client_id=#{instagram}&format=json")
#    instagramreturn = JSON.parse("#{results}")
#  return instagramreturn

# end
# def nyt(arr)
# E674492D62783A2A0FBA9CCD14B75E19:6:69091683

# end


end
