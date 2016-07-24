require 'open-uri'
require 'nokogiri'
require 'sinatra'
require 'robotex'

get '/view_image' do
  user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
  url = 'http://blog.livedoor.jp/anime_info555/archives/1059025536.html'
  charset = nil
  html = open(url, "User-Agent" => user_agent) do |f|
    charset = f.charset
    f.read
  end

  doc = Nokogiri::HTML.parse(html, nil, charset)

  html = "<h1>NEWGAME! キャプチャ</h1>"

  n=0
  doc.css('img').each do |image|
    n += 1
    html << "<a href=#{image.attribute('src').value}><img src=#{image.attribute('src').value}></a>"
  end

  return html
end

