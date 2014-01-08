require 'json'
require 'net/http'

download_proc = Proc.new do |url|
	file = Net::HTTP.get_response(URI(url))
	open("/Users/yolux/Ramdisk/slide/#{File.basename(url)}", 'w') { |f| f.write file.body }
end

input = 'https://speakerdeck.com/player/4eb80921b029470054011d3f?slide=1#'

Net::HTTP.get_response(URI(input)).body =~ /"slides":(.+)};/
JSON.parse($1).each do |h|
	puts slide = h['original']
	download_proc.call slide
end
