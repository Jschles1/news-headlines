class Scraper < ApplicationRecord
  has_many :headlines

  def self.scrape_websites
    self.wapo
    self.cnn
    self.nyt
    self.fb
    self.if
    self.bb
    self.nyp
    self.fn
    self.wt
    self.nr
    self.oann
    self.jw
  end

  def self.wapo
    require 'open-uri'
    doc = Nokogiri::HTML(open('https://www.washingtonpost.com/'))
    headline = doc.css('div.headline.small.normal-style.text-align-inherit a')
    title = headline.text
    url = headline.attr('href')
    @headline = Headline.find_by(website: "Washington Post")
    if @headline.nil?
      @headline = Headline.create(website: "Washington Post", title: title, url: url)
    else
      @headline.update(title: title, url: url)
    end
  end

  # //*[@id="homepage1-zone-1"]/div[2]/div/div[1]/ul/article[1]/a
  #homepage1-zone-1 > div.l-container > div > div.column.zn__column--idx-0 > ul > article.cd.cd--card.cd--article.cd--idx-0.cd--large.cd--vertical.cd--has-siblings.cd--has-media.cd--media__image.cd--has-banner > a

  def self.cnn
    # require 'open-uri'
    # doc = Nokogiri::HTML(open('https://www.google.com/search?rlz=1C5CHFA_enUS719US721&q=cnn&tbm=nws&source=univ&tbo=u&sa=X&ved=0ahUKEwi3jvCWmbvYAhUhTt8KHWzsAPAQt8YBCEkoAQ&biw=1250&bih=609'))
    # headline = doc.css('#rso div._NId div.g._cy div.ts._JGs._KHs._oGs._KGs._jHs div._hJs h3.r._gJs a.l._PMs')
    # title = headline.text
    # url = headline.attr('href')
    # @headline = Headline.find_by(website: "CNN")
    # if @headline.nil?
    #   @headline = Headline.create(website: "CNN", title: title, url: url)
    # else
    #   @headline.update(title: title, url: url)
    # end
  end

  def self.nyt
    require 'open-uri'
    doc = Nokogiri::HTML(open('https://www.nytimes.com/'))
    headline = doc.css('article.theme-summary.lede h2 a')
    title = headline.text
    url = headline.attr('href')
    @headline = Headline.find_by(website: "New York Times")
    if @headline.nil?
      @headline = Headline.create(website: "New York Times", title: title, url: url)
    else
      @headline.update(title: title, url: url)
    end
  end

  def self.fb
    require 'open-uri'
    doc = Nokogiri::HTML(open('http://www.foxbusiness.com/'))
    headline = doc.css('section.top-stories article.article-ct h1 a')
    title = headline.text
    url = headline.attr('href')
    @headline = Headline.find_by(website: "Fox Business")
    if @headline.nil?
      @headline = Headline.create(website: "Fox Business", title: title, url: url)
    else
      @headline.update(title: title, url: url)
    end
  end

  def self.if
    require 'open-uri'
    doc = Nokogiri::HTML(open('https://www.infowars.com'))
    headline = doc.css('#home-flexslider ul.slides li:nth-child(1) div.flex-caption div h3 a')
    title = doc.css('#home-flexslider ul.slides li:nth-child(1) div.flex-caption div h3 a div').text
    url = headline.attr('href')
    @headline = Headline.find_by(website: "Infowars")
    if @headline.nil?
      @headline = Headline.create(website: "Infowars", title: title, url: url)
    else
      @headline.update(title: title, url: url)
    end
  end

  def self.bb
    require 'open-uri'
    doc = Nokogiri::HTML(open('http://www.breitbart.com/'))
    headline = doc.css('div#MainW div.col8.top-article h2 a')
    title = headline.attr('title')
    url = headline.attr('href')
    @headline = Headline.find_by(website: "Breitbart")
    if @headline.nil?
      @headline = Headline.create(website: "Breitbart", title: title, url: url)
    else
      @headline.update(title: title, url: url)
    end
  end

  def self.nyp
    require 'open-uri'
    doc = Nokogiri::HTML(open('https://nypost.com/news/'))
    headline = doc.css('article.story-photo-box.top-story.story-1 a')
    title = headline.css('h3').text
    url = headline.attr('href')
    @headline = Headline.find_by(website: "New York Post")
    if @headline.nil?
      @headline = Headline.create(website: "New York Post", title: title, url: url)
    else
      @headline.update(title: title, url: url)
    end
  end

  def self.fn
    require 'open-uri'
    doc = Nokogiri::HTML(open('http://www.foxnews.com/'))
    headline = doc.css('#wrapper div div.page-content div.row.sticky-columns main div div div.collection.collection-spotlight.has-hero div article div.info header h2 a')
    title = headline.text
    url = headline.attr('href')
    @headline = Headline.find_by(website: "Fox News")
    if @headline.nil?
      @headline = Headline.create(website: "Fox News", title: title, url: url)
    else
      @headline.update(title: title, url: url)
    end
  end

  def self.wt
    require 'open-uri'
    doc = Nokogiri::HTML(open('https://www.washingtontimes.com/'))
    headline = doc.css('article.lead-story h2 a')
    title = headline.attr('title')
    url = headline.attr('href')
    @headline = Headline.find_by(website: "Washington Times")
    if @headline.nil?
      @headline = Headline.create(website: "Washington Times", title: title, url: url)
    else
      @headline.update(title: title, url: url)
    end
  end

  def self.nr
    require 'open-uri'
    doc = Nokogiri::HTML(open('http://www.nationalreview.com/'))
    headline = doc.css('body div.container.p-r.cf.front_page div div.col-75p.parent.fl.main-content div div div div.homepage_featured_group_5.mixed_content.published div:nth-child(1) div a')
    title = doc.css('body div.container.p-r.cf.front_page div div.col-75p.parent.fl.main-content div div div div.homepage_featured_group_5.mixed_content.published div:nth-child(1) div a div.homepage_meta h1').text
    url = headline.attr('href')
    @headline = Headline.find_by(website: "National Review")
    if @headline.nil?
      @headline = Headline.create(website: "National Review", title: title, url: url)
    else
      @headline.update(title: title, url: url)
    end
  end

  def self.oann
    require 'open-uri'
    doc = Nokogiri::HTML(open('http://www.oann.com/'))
    headline = doc.css('#main-content div:nth-child(1) div article h3.content-lead-title a')
    title = headline.text
    url = headline.attr('href')
    @headline = Headline.find_by(website: "OANN")
    if @headline.nil?
      @headline = Headline.create(website: "OANN", title: title, url: url)
    else
      @headline.update(title: title, url: url)
    end
  end

  def self.jw
    require 'open-uri'
    doc = Nokogiri::HTML(open('https://www.judicialwatch.org/'))
    headline = doc.css('#tsh1 a')
    title = headline.text
    url = headline.attr('href')
    @headline = Headline.find_by(website: "Judicial Watch")
    if @headline.nil?
      @headline = Headline.create(website: "Judicial Watch", title: title, url: url)
    else
      @headline.update(title: title, url: url)
    end
  end
end