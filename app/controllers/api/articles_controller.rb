class Api::ArticlesController < ApplicationController
  def index
    response = HTTP.headers("X-Api-Key" => "#{Rails.application.credentials.news_api[:api_key]}").get("https://newsapi.org/v2/everything?q=#{params[:search]}")

    @articles = response.parse["articles"]
    render "index.json.jb"
  end
end
