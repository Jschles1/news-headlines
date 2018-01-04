class HomeController < ApplicationController
  def index
    Scraper.scrape_websites
    @headlines = Headline.all
    puts @headlines
  end
end