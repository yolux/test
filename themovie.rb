
begin

path = ARGV.first
raise 'no cvs file found!' if path.nil?
raise 'no file exist!' unless File.exist? path

output = []
File.open(path, "r:utf-8") do |f|
	puts "read file"
	f.readlines.each do |line|
		# Hours ,搏命關頭,126,12/4/2013,Drama | Thriller,4.38,http://www.imdb.com/title/tt2094018/,,Hours.2013,,,,4692389951
		infos = line.split(',')
		eng_name = infos[0].strip
		next if eng_name == 'name'
		break if eng_name.empty?
		cht_name = infos[1].strip
		id = infos[2].strip
		release = infos[3].strip
		category = infos[4].strip
		size = infos[5].strip
		imdb = infos[6].strip
		folder = infos[7].strip
		output << "<li><a href=\"#{imdb}\" data-btdate=\"#{release}\" data-category=\"#{category}\" data-size=\"#{size}G\" data-copypath=\"~/#{folder}\" data-largesrc=\"images/m#{id}.jpg\" data-title=\"#{eng_name}\" data-description=\"#{cht_name}\"><img src=\"images/s#{id}.jpg\" alt=\"#{eng_name}\"/></a></li>"
	end
    puts "html file output"
	puts output.size
	output.reverse!
	output.each {|x| puts x}
    puts "save to txt"
	File.open("#{path}.txt", 'w+') {|f| f.write output.join("\n")}
end

rescue => e
	puts e.to_s
end
