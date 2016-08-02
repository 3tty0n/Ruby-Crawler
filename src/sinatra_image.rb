require 'open-uri'
require 'nokogiri'
require 'sinatra'
require 'robotex'

get '/view_image' do 
  user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
  # url = 'http://blog.livedoor.jp/anime_info555/archives/1059025536.html'
  # url = 'http://aikatunews.livedoor.biz/archives/55581396.html'
  # url = 'http://blog.livedoor.jp/anime_info555/archives/1059638437.html'
  url = 'http://aaieba.livedoor.biz/archives/49214309.html'
  charset = nil
  html = open(url, "User-Agent" => user_agent) do |f|
    charset = f.charset
    f.read
  end

  doc = Nokogiri::HTML.parse(html, nil, charset)

  html = "<h1>キャプチャ表示ページ</h1>"

doc.css('img').each do |image|
   html << "<a href=#{image.attribute('src').value}><img src=#{image.attribute('src').value}></a>\n"
end

  return html
end

