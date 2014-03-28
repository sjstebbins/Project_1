class Entry < ActiveRecord::Base
belongs_to(:user)
# require './alchemyapi'
def alchemy
input = URI.escape(self.input)
@alchemyreturn = HTTParty.get("http://access.alchemyapi.com/calls/text/TextGetRankedKeywords?text=#{input}&apikey=9ddce0957447a5027cf1a73b860383823614057f").inspect
# @alchemyreturn = JSON.parse(results)
return @alchemyreturn
end


def wiki

@wikiinforeturn = HTTParty.get("http://en.wikipedia.org/w/api.php?format=json&action=query&titles=Main%20Page&prop=revisions&rvprop=content")

@wikiimagereturn = HTTParty.get("http://en.wikipedia.org/w/api.php?format=json&action=query&titles=Main%20Page&prop=revisions&rvprop=content")

end
#   alchemyapi = AlchemyAPI.new()
# response = alchemyapi.entities('text', self, { 'sentiment'=>1 })

# if response['status'] == 'OK'
#   puts '## Response Object ##'
#   puts JSON.pretty_generate(response)


#   puts ''
#   puts '## Entities ##'
#   for entity in response['entities']
#     puts 'text: ' + entity['text']
#     puts 'type: ' + entity['type']
#     puts 'relevance: ' + entity['relevance']
#     print 'sentiment: ' + entity['sentiment']['type']

#     #Make sure score exists (it's not returned for neutral sentiment
#     if entity['sentiment'].key?('score')
#       print ' (' + entity['sentiment']['score'] + ')'
#     end

#     puts ''
#   end
# else
#   puts 'Error in entity extraction call: ' + response['statusInfo']
# end



end
