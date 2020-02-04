class Api::ArticlesController < ApplicationController
  def index
    response = HTTP.headers("X-Api-Key" => "c376794f03eb41b5a72996a60cb02c88").get("https://newsapi.org/v2/everything?q=#{params[:search]}")

    @articles = response.parse["articles"]
    render "index.json.jb"
  end
end
