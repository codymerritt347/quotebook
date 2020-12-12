class API

  BASE_URL = "https://quote-garden.herokuapp.com/api/v3/quotes"

  def collect_quotes
    uri = URI(BASE_URL)
    response = Net::HTTP.get(uri)
    formatted_resp = JSON.parse(response)
    formatted_resp["data"].each do |quotes_hash|
      author = Author.new(quotes_hash["quoteAuthor"])
      Quote.new(quotes_hash["quoteText"], author)
    end
  end

end