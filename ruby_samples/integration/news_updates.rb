#!/usr/bin/env ruby

%w{open-uri rubygems nokogiri chronic csv}.each{|f| require f}

news_url = 'http://news.google.com/news/search'

query = ARGV[0]
query_string = "pz=1&cf=all&ned=us&hl=en&q=#{query}&as_qdr=h&as_drrb=q"

doc = Nokogiri::HTML(open("#{news_url}?#{query_string}"))

stories = []

doc.css('div.headline-story').each do |story|
  fields = {}
  
  link = story.css('h2.title a').first
  fields[:headline] = link.text
  fields[:url] = link['href']
  
  story.css('div.sub-title').each do |sub|
    fields[:publication] = sub.css('span.source').first.text
    time_string = sub.css('span.date').first.text[/[[:print:]]+/]
    fields[:time] = Chronic.parse(time_string)
  end
  
  fields[:snippet] = story.css('div.snippet').first.text
  
  stories << fields
end

open('latest_stories.csv', 'w') do |csvfile|
  field_names = %w{headline url publication time snippet}.map{|n| n.to_sym}
  csvfile.puts CSV.generate_line(field_names)
  stories.each do |story|
    record = field_names.map do |field_name|
      story[field_name]
    end
    csvfile.puts CSV.generate_line(record)
  end
end
