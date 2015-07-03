require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rss'

class PagesController < ApplicationController
  def index
    @x = rand(100)
    @y = rand(100)
    @titleArray = Array.new
    @postArray = Array.new

    url = 'http://www.mustgrowup.com/blog/feed/'
    open(url) do |rss|
      skipped = 0
      feed = Nokogiri::XML(rss)
      feed.xpath("//item").each_with_index do |item, i|
        break if i > 3
        if(item.xpath("category").text.include? "Home" )
          @titleArray[i-skipped]=item.xpath("title").text
          @postArray[i-skipped]=item.css("content|encoded").text
        else
          skipped += 1
        end

      end
    end
  end

  def comic
    @comic = ''
    @title = ''

    url = 'http://www.mustgrowup.com/blog/feed/'
    open(url) do |rss|
      feed = Nokogiri::XML(rss)
      feed.xpath("//item").each_with_index do |item, i|
        break if i > 0
        if(item.xpath("category").text.include? "Comic" )
          @title=item.xpath("title").text
          @comic=item.css("content|encoded").text
        end
      end
    end
  end

  def about
  end
end
