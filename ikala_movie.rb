# encoding: utf-8
require 'fileutils'
#require 'nokogiri'
require 'open-uri'
require 'pp'


# [ browse all ]
# http://www.moxbit.com/contact
#http://tympanus.net/codrops/2013/03/19/thumbnail-grid-with-expanding-preview/
#http://tympanus.net/codrops/2012/08/08/circle-hover-effects-with-css-transitions/
#http://tympanus.net/codrops/2011/10/07/draggable-image-boxes-grid/
# [ ikala movie today ]
#http://tympanus.net/codrops/2011/01/03/parallax-slider/
# [ new arrival]
#http://tympanus.net/codrops/2010/11/16/hover-slide-effect/
#http://tympanus.net/codrops/2010/07/05/minimalistic-slideshow-gallery/
# [ day & night effect]
#http://tympanus.net/codrops/2009/12/14/day-and-night-creating-animation-with-jquery-and-css/
#login
# http://tympanus.net/codrops/2012/10/16/custom-login-form-styling/
# checkbox
#http://tympanus.net/codrops/2012/09/13/button-switches-with-checkboxes-and-css3-fanciness/
#notification
#http://tympanus.net/codrops/2012/06/25/timed-notifications-with-css-animations/
# turtorial
#http://tympanus.net/codrops/2012/05/14/annotation-overlay-effect-with-css3/
# error input enhance
# http://tympanus.net/TipsTricks/EnhanceRequiredFields/index.html
# fold menu text 
#http://tympanus.net/codrops/2012/02/21/accordion-with-css3/
# grid list search filter
#http://tympanus.net/codrops/2012/01/09/filter-functionality-with-css3/
#cart
#http://tympanus.net/codrops/2013/05/17/product-grid-layout/
# http://net.tutsplus.com/tutorials/html-css-techniques/implementing-html5-drag-and-drop-new-premium-tutorial/

http://blog.entheosweb.com/ideas/awesome-html5-canvas-animations-applications
def open_url url, retry_delay=10, retry_count=2
  retry_count.times {|x| open(URI.escape(url),'User-Agent' => 'Mozilla/5.0') {|f| return f.read} rescue sleep(retry_delay) }
end

def google_search query
  query = query.gsub(/\W/, '+')
  url = "https://www.google.com/search?q=\"開眼電影\"+#{query}"
  pp "#{__method__}, url=#{url}"

  html_raw = open_url url
  pp "#{__method__}, raw size=#{html_raw.size}"
  raise "can not get google search html raw" unless html_raw

  key = (/<h3 class="r"><a href="([^"]+)"/ =~ html_raw) ? $1.strip : ""
  [/www.atmovies.com.tw\/movie\/(\w+)\/&/, /film_id\%3D(\w+)&/, /film_id=(\w+)&/].each do |pattern|
    return 'http://app.atmovies.com.tw/movie/movie.cfm?action=filmdata&film_id=' + $1 if key =~ pattern
  end
  raise "pattern not found"

rescue => e
  pp e
  return ""
end

def get_imdb_info url
  raise "empty url" if url.empty?
  pp "#{__method__}, url=#{url}"

  
  
  # ---- parse 開眼電影 web site ----
  html_raw = open_url url
  pp "#{__method__}, 3rd party html raw size=#{html_raw.size}"
  raise "can not get 3rd party info html raw" unless html_raw

  cht_name = /<span class="at21b">(.+)<\/span>/ =~ html_raw ? $1.strip : "?"
  eng_name = /<span class="at12b_gray">(.+)<\/span>/ =~ html_raw ? $1.strip : "?"
  imdb_link = /href="([^"]+)" target=_blank>IMDb<\/a>/ =~ html_raw ? $1.strip : nil
  raise "imdb pattern not found" unless imdb_link
  pp "#{__method__}, imdb url=#{imdb_link}"
  
  # ---- parse imdb web site ----
  html_raw = open_url imdb_link
  pp "#{__method__}, imdb html raw size=#{html_raw.size}"
  raise "can not get imdb html raw" unless html_raw

  img_src = /src="([^"]+)"\s+itemprop="image"/ =~ html_raw ? $1.strip : ""
  img_m = img_src.sub(/@@.+jpg\z/, '@@._V1_SX214_.jpg')
  img_s = img_src.sub(/@@.+jpg\z/, '@@._V1_SX67_CR0,0,67,98_.jpg')

  # ---- parse yahoo movie web site ----
  # html_raw = open_url url
  # pp "#{__method__}, 3rd party html raw size=#{html_raw.size}"
  # raise "can not get 3rd party info html raw" unless html_raw

  # cht_name = /<span class="at21b">(.+)<\/span>/ =~ html_raw ? $1.strip : "?"
  # <h4>([^<]+)<\/h4>
  # <h5>([^<]+)<\/h5>

  return {:cht_name => cht_name, :eng_name => eng_name, :imdb_link => imdb_link, 
          :img_m => img_m, :img_s => img_s, :cht_info_link => url}

rescue => e
  pp e
  return {}
end

def sync_movie_info cache_file, movie_file_path, manual_add_info_hash={}
  pp "read cache file"  
  movie_list = File.exist?(cache_file) ? Marshal.load(File.read(cache_file)) : {}

  unless manual_add_info_hash.empty?
    pp "merge manual add info hash"
    movie_list.merge! manual_add_info_hash
    pp "write to cache file"
    File.open(cache_file, 'w') {|f| f.write(Marshal.dump(movie_list)) }
  end
  
  pp "read movie file path & update"
  Dir["#{movie_file_path}/*"].each do |folder|
    movie = File.basename(folder)
    unless movie_list.has_key? movie
      pp "search info for #{movie}"
      result = get_imdb_info(google_search(movie))
      pp result
      movie_list[movie] = result unless result.empty?
      #
      pp "write to cache file"
      File.open(cache_file, 'w') {|f| f.write(Marshal.dump(movie_list)) }
      #
      pp "sleep 60 sec ..."
      sleep(20)
    end
  end
  pp movie_list
end


def sync_movie_info2 cache_file, movie_file_path, manual_add_info_hash={}
  pp "read cache file"  
  x_path = '/home/yolux/xlist.txt'
  x_list = File.exist?(x_path) ? Marshal.load(File.read(x_path)) : []
  movie_list = File.exist?(cache_file) ? Marshal.load(File.read(cache_file)) : {}

  unless manual_add_info_hash.empty?
    pp "merge manual add info hash"
    movie_list.merge! manual_add_info_hash
    pp "write to cache file"
    File.open(cache_file, 'w') {|f| f.write(Marshal.dump(movie_list)) }
  end
  
  pp "read movie file path & update"
  #Dir["#{movie_file_path}/*"].each do |folder|
  #pp x_list
  #return
  x_list.each do |folder|
    movie = File.basename(folder)
    #x_list << movie
    #next
    unless movie_list.has_key? movie
      pp "search info for #{movie}"
      next
      result = get_imdb_info(google_search(movie))
      pp result
      movie_list[movie] = result unless result.empty?
      #
      pp "write to cache file"
      serialized_array = Marshal.dump(movie_list)
      File.open(cache_file, 'w') {|f| f.write(serialized_array) }
      #
      pp "sleep 60 sec ..."
      sleep(60)
    end
  end
  
  # serialized_array = Marshal.dump(x_list)
  # File.open(x_path, 'w') {|f| f.write(serialized_array) }

  pp "write to cache file"
  serialized_array = Marshal.dump(movie_list)
  File.open(cache_file, 'w') {|f| f.write(serialized_array) }
  pp movie_list
end

#pp get_imdb_info google_search "[Chronicle.2012]"
#pp google_search "降魔戰警 tw"
#{}"Frankensteins.Army.2013"
#google_search "[Chronicle.2012]"

# hash = {
#  'Frankensteins.Army.2013' => {:cht_name => '弗蘭肯斯坦大兵', 
#  :eng_name => "Frankenstein's Army", 
#  :imdb_link => 'http://www.imdb.com/title/tt1925435/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMjA1NDE0MzcyMF5BMl5BanBnXkFtZTcwNTU2MzA3OQ@@._V1_SY317_CR5,0,214,317_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMjA1NDE0MzcyMF5BMl5BanBnXkFtZTcwNTU2MzA3OQ@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'Hugo.2011' => {:cht_name => '雨果', 
#  :eng_name => 'Hugo', 
#  :imdb_link => 'http://www.imdb.com/title/tt0970179/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMjAzNzk5MzgyNF5BMl5BanBnXkFtZTcwOTE4NDU5Ng@@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMjAzNzk5MzgyNF5BMl5BanBnXkFtZTcwOTE4NDU5Ng@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'Iron Man 3 2013 720p WEB-DL x264 AAC-JYK' => {:cht_name => '鋼鐵人3', 
#  :eng_name => 'Iron Man 3', 
#  :imdb_link => 'http://www.imdb.com/title/tt1300854/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMjIzMzAzMjQyM15BMl5BanBnXkFtZTcwNzM2NjcyOQ@@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMjIzMzAzMjQyM15BMl5BanBnXkFtZTcwNzM2NjcyOQ@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'le.magasin.des.suicides.2012' => {:cht_name => '自殺專賣店', 
#  :eng_name => 'The Suicide Shop', 
#  :imdb_link => 'http://www.imdb.com/title/tt1655413/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMjA5NTk2MTA5MV5BMl5BanBnXkFtZTcwNTcyNjU1OQ@@._V1_SY317_CR51,0,214,317_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMjA5NTk2MTA5MV5BMl5BanBnXkFtZTcwNTcyNjU1OQ@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'Planet.Ocean.2012' => {:cht_name => '海洋星球', 
#  :eng_name => 'Planet Ocean', 
#  :imdb_link => 'http://www.imdb.com/title/tt2240784/?ref_=fn_al_tt_1', 
#  :img_m => 'http://img3.douban.com/view/photo/photo/public/p1968411215.jpg', 
#  :img_s => 'http://img3.douban.com/mpic/s22792497.jpg', 
#  :cht_info_link => ''},
#  'Puss.In.Boots.2011' => {:cht_name => '鞋貓劍客', 
#  :eng_name => 'Puss in Boots ', 
#  :imdb_link => 'http://www.imdb.com/title/tt0448694/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMTMxMTU5MTY4MV5BMl5BanBnXkFtZTcwNzgyNjg2NQ@@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMTMxMTU5MTY4MV5BMl5BanBnXkFtZTcwNzgyNjg2NQ@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'Resident.Evil.Retribution.2012' => {:cht_name => '惡靈古堡5：天譴日', 
#  :eng_name => 'Resident Evil: Retribution', 
#  :imdb_link => 'http://www.imdb.com/title/tt1855325/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMTA2NTkwNjUxNTZeQTJeQWpwZ15BbWU3MDE2OTMxMTg@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMTA2NTkwNjUxNTZeQTJeQWpwZ15BbWU3MDE2OTMxMTg@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#   'Resident.Evil：Damnation.2012' => {:cht_name => '生化危機：詛咒', 
#  :eng_name => 'Resident Evil: Damnation', 
#  :imdb_link => 'http://www.imdb.com/title/tt1753496/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BNzg2ODUxOTIzN15BMl5BanBnXkFtZTcwMDM0NzAzOA@@._V1_SY317_CR5,0,214,317_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BNzg2ODUxOTIzN15BMl5BanBnXkFtZTcwMDM0NzAzOA@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#   'RIPD.2013' => {:cht_name => '降魔戰警', 
#  :eng_name => 'R.I.P.D.', 
#  :imdb_link => 'http://www.imdb.com/title/tt0790736/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMTM5OTYxNzE5N15BMl5BanBnXkFtZTcwMDU1MTQ4OQ@@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMTM5OTYxNzE5N15BMl5BanBnXkFtZTcwMDU1MTQ4OQ@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#   'Ted.2012' => {:cht_name => '熊麻吉', 
#  :eng_name => 'Ted', 
#  :imdb_link => 'http://www.imdb.com/title/tt1637725/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMTQ1OTU0ODcxMV5BMl5BanBnXkFtZTcwOTMxNTUwOA@@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMTQ1OTU0ODcxMV5BMl5BanBnXkFtZTcwOTMxNTUwOA@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'The.Bourne.Legacy.2012' => {:cht_name => '神鬼認證4', 
#  :eng_name => 'The Bourne Legacy', 
#  :imdb_link => 'http://www.imdb.com/title/tt1194173/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMTc4Njk3MDM1Nl5BMl5BanBnXkFtZTcwODgyOTMxOA@@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMTc4Njk3MDM1Nl5BMl5BanBnXkFtZTcwODgyOTMxOA@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'The.Great.Gatsby.2013.720p.BluRay.x264-SPARKS [PublicHD]' => {:cht_name => '大亨小傳', 
#  :eng_name => 'The Great Gatsby', 
#  :imdb_link => 'http://www.imdb.com/title/tt1343092/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMTkxNTk1ODcxNl5BMl5BanBnXkFtZTcwMDI1OTMzOQ@@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMTkxNTk1ODcxNl5BMl5BanBnXkFtZTcwMDI1OTMzOQ@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'The.Hobbit.An.Unexpected.Journey.2012' => {:cht_name => '哈比人：意外旅程', 
#  :eng_name => 'The Hobbit: An Unexpected Journey', 
#  :imdb_link => 'http://www.imdb.com/title/tt0903624/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMTcwNTE4MTUxMl5BMl5BanBnXkFtZTcwMDIyODM4OA@@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMTcwNTE4MTUxMl5BMl5BanBnXkFtZTcwMDIyODM4OA@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'Thermae.Romae.mkv' => {:cht_name => '羅馬浴場', 
#  :eng_name => 'Thermae Romae', 
#  :imdb_link => 'http://www.imdb.com/title/tt1867101/', 
#  :img_m => 'http://doramax264.com/wp-content/uploads/2012/11/Thermae_Romae-P1.jpg?2105de', 
#  :img_s => 'http://doramax264.com/wp-content/uploads/2012/11/Thermae_Romae-P1.jpg?2105de', 
#  :cht_info_link => ''},
#  'Wreck-It.2012' => {:cht_name => '無敵破壞王', 
#  :eng_name => 'Wreck-It Ralph', 
#  :imdb_link => 'http://www.imdb.com/title/tt1772341/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BNzMxNTExOTkyMF5BMl5BanBnXkFtZTcwMzEyNDc0OA@@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BNzMxNTExOTkyMF5BMl5BanBnXkFtZTcwMzEyNDc0OA@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'Zero.Drak.Thirty' => {:cht_name => '凌晨密令', 
#  :eng_name => 'Zero Dark Thirty', 
#  :imdb_link => 'http://www.imdb.com/title/tt1790885/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMTQ4OTUyNzcwN15BMl5BanBnXkFtZTcwMTQ1NDE3OA@@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMTQ4OTUyNzcwN15BMl5BanBnXkFtZTcwMTQ1NDE3OA@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'Ernest.And.Celestine.2012' => {:cht_name => '艾特熊和赛娜鼠', 
#  :eng_name => 'Ernest & Celestine', 
#  :imdb_link => 'http://www.imdb.com/title/tt1816518/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMTk2NDg4NTQwOF5BMl5BanBnXkFtZTcwNDE2Mjg2OA@@._V1_SY317_CR10,0,214,317_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMTk2NDg4NTQwOF5BMl5BanBnXkFtZTcwNDE2Mjg2OA@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'DORAEMON_MOVIE2013_HIMITSUDOUGU_MUSEUM.mp4' => {:cht_name => '哆啦A梦：大雄的秘密道具博物馆', 
#  :eng_name => 'ドラえもん のび太のひみつ道具博物館', 
#  :imdb_link => 'http://en.wikipedia.org/wiki/Doraemon:_Nobita_no_Himitsu_D%C5%8Dgu_Museum', 
#  :img_m => 'http://upload.wikimedia.org/wikipedia/commons/e/e8/Doraemon-Nobita_no_Himitsu_D%C5%8Dgu_Museum.jpg', 
#  :img_s => 'http://upload.wikimedia.org/wikipedia/commons/e/e8/Doraemon-Nobita_no_Himitsu_D%C5%8Dgu_Museum.jpg', 
#  :cht_info_link => ''},
#  'The.East.2013' => {:cht_name => '東方', 
#  :eng_name => 'The East', 
#  :imdb_link => 'http://www.imdb.com/title/tt1869716/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMjEyNjQzMzg5Nl5BMl5BanBnXkFtZTcwMjExNzU1OQ@@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMjEyNjQzMzg5Nl5BMl5BanBnXkFtZTcwMjExNzU1OQ@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'The.Hangover.Part.III.2013' => {:cht_name => '醉後大丈夫3', 
#  :eng_name => 'The Hangover Part III', 
#  :imdb_link => 'http://www.imdb.com/title/tt1951261/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMTA0NjE1MzMzODheQTJeQWpwZ15BbWU3MDY4MTQ3Mzk@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMTA0NjE1MzMzODheQTJeQWpwZ15BbWU3MDY4MTQ3Mzk@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  'World.War.Z.2013.Unrated.Cut' => {:cht_name => '末日之戰', 
#  :eng_name => 'World War Z', 
#  :imdb_link => 'http://www.imdb.com/title/tt0816711/', 
#  :img_m => 'http://ia.media-imdb.com/images/M/MV5BMTg0NTgxMjIxOF5BMl5BanBnXkFtZTcwMDM0MDY1OQ@@._V1_SX214_.jpg', 
#  :img_s => 'http://ia.media-imdb.com/images/M/MV5BMTg0NTgxMjIxOF5BMl5BanBnXkFtZTcwMDM0MDY1OQ@@._V1_SX67_CR0,0,67,98_.jpg', 
#  :cht_info_link => ''},
#  '初音ミク ライブパーティー 2013 in Kansai ミクパ♪' => {:cht_name => '初音ミク ライブパーティー', 
#  :eng_name => '初音ミク ライブパーティー', 
#  :imdb_link => 'http://5pb.jp/mikupa/', 
#  :img_m => 'http://ecx.images-amazon.com/images/I/51TByKrpIOL._AA300_.jpg', 
#  :img_s => 'http://ecx.images-amazon.com/images/I/51TByKrpIOL._AA300_.jpg', 
#  :cht_info_link => ''}
 
# }

 # { '' => {:cht_name => '', 
 # :eng_name => '', 
 # :imdb_link => '', 
 # :img_m => '', 
 # :img_s => '', 
 # :cht_info_link => ''},
 # '' => {:cht_name => '', 
 # :eng_name => '', 
 # :imdb_link => '', 
 # :img_m => '', 
 # :img_s => '', 
 # :cht_info_link => ''} }

# hash = {
#   "star.trek.into.darkness"=>
#   {:cht_name=>"闇黑無界：星際爭霸戰",
#    :eng_name=>"Star Trek Into Darkness",
#    :imdb_link=>"http://us.imdb.com/Title?1408101",
#    :img_m=>
#     "http://ia.media-imdb.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX214_.jpg",
#    :img_s=>
#     "http://ia.media-imdb.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX67_CR0,0,67,98_.jpg"},
#  "The.Frozen.Ground.2013"=>
#   {:cht_name=>"驚天凍地",
#    :eng_name=>"The Frozen Ground",
#    :imdb_link=>"http://us.imdb.com/Title?2005374",
#    :img_m=>
#     "http://ia.media-imdb.com/images/M/MV5BMjA0MjAyMjIxMl5BMl5BanBnXkFtZTcwNTQ1NDc2OQ@@._V1_SX214_.jpg",
#    :img_s=>
#     "http://ia.media-imdb.com/images/M/MV5BMjA0MjAyMjIxMl5BMl5BanBnXkFtZTcwNTQ1NDc2OQ@@._V1_SX67_CR0,0,67,98_.jpg"},
#  "After.Earth.2013"=>
#   {:cht_name=>"地球過後",
#    :eng_name=>"After Earth",
#    :imdb_link=>"http://us.imdb.com/Title?1815862",
#    :img_m=>
#     "http://ia.media-imdb.com/images/M/MV5BMTY3MzQyMjkwMl5BMl5BanBnXkFtZTcwMDk2OTE0OQ@@._V1_SX214_.jpg",
#    :img_s=>
#     "http://ia.media-imdb.com/images/M/MV5BMTY3MzQyMjkwMl5BMl5BanBnXkFtZTcwMDk2OTE0OQ@@._V1_SX67_CR0,0,67,98_.jpg",
#    :cht_info_link=>
#     "http://app.atmovies.com.tw/movie/movie.cfm?action=filmdata&film_id=faus01815862"},
#  "Dragon Ball Z：Battle of Gods"=>
#   {:cht_name=>"ドラゴンボールZ 神と神",
#    :eng_name=>"Dragon Ball Z: Battle of Gods",
#    :imdb_link=>"http://us.imdb.com/Title?2263944",
#    :img_m=>"",
#    :img_s=>"",
#    :cht_info_link=>
#     "http://app.atmovies.com.tw/movie/movie.cfm?action=filmdata&film_id=fdjp92263944"},
#  "Iron Man 3 2013"=>
#   {:cht_name=>"鋼鐵人3",
#    :eng_name=>"Iron Man 3",
#    :imdb_link=>"http://us.imdb.com/Title?1300854",
#    :img_m=>
#     "http://ia.media-imdb.com/images/M/MV5BMjIzMzAzMjQyM15BMl5BanBnXkFtZTcwNzM2NjcyOQ@@._V1_SX214_.jpg",
#    :img_s=>
#     "http://ia.media-imdb.com/images/M/MV5BMjIzMzAzMjQyM15BMl5BanBnXkFtZTcwNzM2NjcyOQ@@._V1_SX67_CR0,0,67,98_.jpg",
#    :cht_info_link=>
#     "http://app.atmovies.com.tw/movie/movie.cfm?action=filmdata&film_id=fius41300854"},
#  "The.Bling.Ring.2013"=>
#   {:cht_name=>"炫富幫",
#    :eng_name=>"The Bling Ring",
#    :imdb_link=>"http://us.imdb.com/Title?2132285",
#    :img_m=>
#     "http://ia.media-imdb.com/images/M/MV5BMTQzMTgwMzQxN15BMl5BanBnXkFtZTcwOTcwNTY0OQ@@._V1_SX214_.jpg",
#    :img_s=>
#     "http://ia.media-imdb.com/images/M/MV5BMTQzMTgwMzQxN15BMl5BanBnXkFtZTcwOTcwNTY0OQ@@._V1_SX67_CR0,0,67,98_.jpg",
#    :cht_info_link=>
#     "http://app.atmovies.com.tw/movie/movie.cfm?action=filmdata&film_id=fbus52132285"},
#  "The.Great.Gatsby"=>
#   {:cht_name=>"大亨小傳",
#    :eng_name=>"The Great Gatsby",
#    :imdb_link=>"http://us.imdb.com/Title?1343092",
#    :img_m=>
#     "http://ia.media-imdb.com/images/M/MV5BMTkxNTk1ODcxNl5BMl5BanBnXkFtZTcwMDI1OTMzOQ@@._V1_SX214_.jpg",
#    :img_s=>
#     "http://ia.media-imdb.com/images/M/MV5BMTkxNTk1ODcxNl5BMl5BanBnXkFtZTcwMDI1OTMzOQ@@._V1_SX67_CR0,0,67,98_.jpg",
#    :cht_info_link=>
#     "http://app.atmovies.com.tw/movie/movie.cfm?action=filmdata&film_id=fgen41343092"},
#  "This.is.the.End.2013"=>
#   {:cht_name=>"大明星世界末日",
#    :eng_name=>"This Is the End",
#    :imdb_link=>"http://us.imdb.com/Title?1245492",
#    :img_m=>
#     "http://ia.media-imdb.com/images/M/MV5BMTQxODE3NjM1Ml5BMl5BanBnXkFtZTcwMzkzNjc4OA@@._V1_SX214_.jpg",
#    :img_s=>
#     "http://ia.media-imdb.com/images/M/MV5BMTQxODE3NjM1Ml5BMl5BanBnXkFtZTcwMzkzNjc4OA@@._V1_SX67_CR0,0,67,98_.jpg",
#    :cht_info_link=>
#     "http://app.atmovies.com.tw/movie/movie.cfm?action=filmdata&film_id=ften71245492"}
# }

# hash =
# {"Usagi-Drop"=>
#   {:cht_name=>"白兔玩偶",
#    :eng_name=>"Bunny Drop",
#    :imdb_link=>"http://us.imdb.com/Title?1672214",
#    :img_m=>"http://upload.wikimedia.org/wikipedia/en/3/3f/Usagi_Drop_movie_poster.jpg",
#    :img_s=>"http://upload.wikimedia.org/wikipedia/en/3/3f/Usagi_Drop_movie_poster.jpg"},
#  "Dragon Ball Z：Battle of Gods"=>
#   {:cht_name=>"ドラゴンボールZ 神と神",
#    :eng_name=>"Dragon Ball Z: Battle of Gods",
#    :imdb_link=>"http://us.imdb.com/Title?2263944",
#    :img_m=>"http://stat.news.ameba.jp/news_images/20121204/11/73/0d/j/o065009191009345_650.jpg",
#    :img_s=>"http://stat.news.ameba.jp/news_images/20121204/11/73/0d/j/o065009191009345_650.jpg",
#    :cht_info_link=>
#     "http://app.atmovies.com.tw/movie/movie.cfm?action=filmdata&film_id=fdjp92263944"}}

#"Yahoo!奇摩電影" 鞋貓劍客
#http://tw.movie.yahoo.com/movieinfo_main.html/id=3814
#http://tw.ent4.yimg.com/mpost2/38/14/3814.jpg
#http://tw.ent4.yimg.com/mpost/38/14/3814.jpg
#sync_movie_info '', '/media/Element1.5T/Ikala_Movie'
#sync_movie_info '/home/yolux/ikala_movie.txt', '/media/Element1.5T/Ikala_Movie', hash
 cache_file = '/home/yolux/ikala_movie.txt'
 movie_list = File.exist?(cache_file) ? Marshal.load(File.read(cache_file)) : {}

File.open('/home/yolux/listmovie.txt', 'w') do |f|
  movie_list.sort.each do |k,v|
    p k
    f.write("<li> \n <a href='#{v[:imdb_link]}' data-largesrc='#{v[:img_m]}' data-title='#{v[:eng_name]}' data-description='#{v[:cht_name]}'> \n <img src='#{v[:img_s]}' alt='#{v[:eng_name]}' width='67' height='98' /> \n </a> \n </li>") 
  end
end






# m_list = [
# '-IMAX.Under.The.Sea.3D.2009',
# 'A.Single.Shot.2013',
# 'Brave.2012',
# 'Captain.America.The.First.Avenger.2011',
# 'Chronicle.2012',
# 'Disconnect.2013',
# 'DORAEMON_MOVIE2013_HIMITSUDOUGU_MUSEUM.mp4',
# 'Ernest.And.Celestine.2012',
# 'Flight.2012',
# 'Frankensteins.Army.2013',
# 'Frankenweenie.2012',
# 'Hansel.and.Gretel.Witch.Hunters.2013',
# 'Harry.Potter.And.The.Deathly.Hallows.Part.2.2011',
# 'Hugo.2011',
# 'Ice.Age.Continental.Drift.2012',
# 'Iron Man 3 2013',
# 'Jack.the.Giant.Slayer.2013',
# 'La.Luna.2011',
# 'le.magasin.des.suicides.2012',
# 'Life.of.Pi.2012',
# 'Now.You.See.Me.2013',
# 'Oblivion.2013',
# 'Olympus.Has.Fallen.2013',
# 'Osamu_Tezukas_Buddha_The_Great_Departure.mp4',
# 'Partysaurus.Rex.2012.mkv',
# 'Planet.Ocean.2012',
# 'Premium.Rush.2012',
# 'Prometheus.2012',
# 'Puss.In.Boots.2011',
# 'Red.Lights.2012',
# 'Resident.Evil.Retribution.2012',
# 'Resident.Evil：Damnation.2012',
# 'RIPD.2013',
# 'Silent.Hill.Revelation.2012',
# 'Skyfall.2012',
# 'star.trek.into.darkness',
# 'Ted.2012',
# 'The Campaign.2012',
# 'The.Amazing.Spiderman.2012',
# 'The.Avengers.2012',
# 'The.Bling.Ring.2013',
# 'The.Bourne.Legacy.2012',
# 'The.Dark.Knight.Rises.2012',
# 'The.East.2013',
# 'The.Frozen.Ground.2013',
# 'The.Great.Gatsby',
# 'The.Grey.2012',
# 'The.Hobbit.An.Unexpected.Journey.2012',
# 'The.Kings.Of.Summer.2013',
# 'The.Odd.Life.of.Timothy.Green.2012',
# 'The.Pirates.Band.of.Misfits.2012',
# 'The.Reluctant.Fundamentalist.2012',
# 'Thermae.Romae.mkv',
# 'Usagi-Drop',
# 'World.War.Z.2013.Unrated.Cut',
# 'Wreck-It.2012',
# 'Zero.Drak.Thirty',
# '初音ミク ライブパーティー 2013 in Kansai ミクパ♪'
# ]