# -*- coding: utf-8 -*-
require 'anemone'

Anemone.crawl(
           "http://www.amazon.co.jp/gp/bestsellers/", :depth_limit => 1) do |anemone|

  anemone.focus_crawl do |page|
    page.links.keep_if { |link|
      # bestsellesを含むurlのみ取得
      link.to_s.match(/\/bestsellers/)
      # videogameを含むurlを抽出
      link.to_s.match(/videogame/)
    }
  end
  anemone.on_every_page do |page|
    puts page.url
  end
end


