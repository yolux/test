# encoding: utf-8
require 'nokogiri'
require 'open-uri'
HOME_PATH = File.expand_path '.'

def diff_cf_table
  file_a = "#{HOME_PATH}/script_print/cf_table_from_rb_file_name_and_online_doc.txt"
  file_b = "#{HOME_PATH}/script_print/cf_table_from_source_code_l2_related.txt"
  File.open(file_a, "r:utf-8") do |f_a|
    File.open(file_b, "r:utf-8") do |f_b|
      set_a = f_a.readlines.map{|x| x.chomp}
      set_b = f_b.readlines.map{|x| x.chomp}

      puts set_a.size, set_b.size,(set_a-set_b).size
      File.open("#{HOME_PATH}/script_print/cf_table_useless_by_diff.txt", "w+") do |f|
        f.write (set_a-set_b).join("\n")
        f.close
      end

      f_b.close
    end
    f_a.close
  end
end

def print_xxx_cf_table category = 'dyn' 
  web_parse_result = []
  union = []
  cf_list = []
  issue = []
  out = []
  owner_table = {}
  cf_count_table = []

  # read owner table ====================================================
  file = "#{HOME_PATH}/script_print/#{category}_cf_owner_table.txt"
  puts "read owner table from #{file}..."
  File.open(file, "r:utf-8") do |f|
    f.readlines.each do |line| 
      cf, owner = line.split("\t")
      owner_table[File.basename(cf).sub('.rb','')] = owner.strip
    end
    f.close
  end

  # set online doc url ====================================================
  if category == 'dyn'
    url = 'http://192.168.0.61:8080/~chhsiao/NoSQLRoot-current/doc/dynamic/html/dir_49f1493d6025ddd077103351e1b7f299.html'
  else
    url = 'http://192.168.0.61:8080/~chhsiao/NoSQLRoot-current/doc/fixed/html/dir_cdbd8ff724b7edb0c30ab3b7d51d8cb3.html'
  end

  # read cache data if exist ==============================================
  cache_file = "#{HOME_PATH}/script_print/#{category}.cache"
  cache_issue_file = "#{HOME_PATH}/script_print/#{category}_issue.cache"
  puts "parse pages from online doc..."
  if File.exist? cache_file
    puts "read cache ..."
    web_parse_result = Marshal.load File.read(cache_file)
    issue = Marshal.load File.read(cache_issue_file)
  else
    # parse online doc =====================================
    parse_online_doc(url, web_parse_result, issue)
    serialized_array = Marshal.dump(web_parse_result)
    File.open(cache_file, 'w') {|f| f.write(serialized_array) }
    serialized_array = Marshal.dump(issue)
    File.open(cache_issue_file, 'w') {|f| f.write(serialized_array) }
  end
  
  # read rb files only for dyn category =====================================
  rb_path = "#{HOME_PATH}/../lib/models/dynamic/"
  rb_parse_result = []
  if category == 'dyn'
    puts "parse rb files..."
    check_dyn_rb rb_path, rb_parse_result
  end

  # generate html file =====================================
  puts "generate html file..."
  File.open("#{HOME_PATH}/script_print/L1 online doc #{category} api cf table.html", "w+") do |f|

    # print book mark *****
    out = []
    out << "<br><h1> book mark </h1><br>"
    out << "<ul>"
    out << "<li><a href='#issue'>issue pages</a></li>"
    out << "<li><a href='#cf1'>cf list on each online doc page</a></li>"
    out << "<li><a href='#cf2'>cf table by used count</a></li>"
    out << "<li><a href='#cf3'>abstract cf & its child cf list</a></li>"
    out << "<li><a href='#cf4'>total cf list on online doc</a></li>"
    out << "</ul></br></br>"

    # print issue pages *****
    out << "<br><h1><a name='issue'> issue pages </a></h1><br>"
    out << "<table border='1' cellpadding='5'>"
    issue.sort.each {|x| out << "<tr><td>#{x}</td></tr>"}
    out << "</table>"
    f.write out.join("\r\n")

    # print cf list on each online doc page *****
    out = []
    out << "<br><h1><a name='cf1'> cf list on each online doc page </a></h1><br>"
    out << "<table border='1' cellpadding='5'>"
    web_parse_result.sort.each {|cf, parent_cf_list| out << "<tr><td>%s</td><td>%s</td></tr>" % [cf, parent_cf_list.join("<br>")] }
    out << "</table>"

    # print cf table by used count *****
    out << "<br><h1> <a name='cf2'> cf table by used count </a></h1><br>"
    out << "<table border='1' cellpadding='5'>"

    # get cf count table *****
    web_parse_result.map{|x| 
      x[1]
    }.flatten.group_by{|x| 
      x
    }.sort_by{|x| 
      x[1].size
    }.each{|cf, dup_ary|
      cf_list << cf
      cf_count_table << [cf, dup_ary.size]
      out <<  "<tr><td>#{cf}</td><td>#{dup_ary.size}</td></tr>" 
    }
    out << "</table>"

    # get abstract cf list *****  
    # referenced count > 1 means abstract cf
    abs_cf_list = cf_count_table.each_with_object([]){|x, obj| obj << x[0] if x[1] > 1}

    # get cf_child_table ******
    cf_child_table = web_parse_result.each_with_object({}) do |hash, obj|
      page_name, parent_cf_list = hash
      cf = parent_cf_list[-1]

      next if abs_cf_list.include? cf # do not append abstract cf to anybody's child cf list

      # append self as child cf to all self's parent cf
      parent_cf_list.each do |parent_cf|
        if obj.key?  parent_cf
          obj[parent_cf] << cf
        else
          obj[parent_cf] = [cf]
        end
      end
    end

    # only show abstract cf's child cf table *****  
    abs_cf_child_table = cf_child_table.select{|key, value| abs_cf_list.include? key}

    # inorder to print by sorting, we need count info *****  
    abs_cf_child_table_print = abs_cf_child_table.map{|key, value| [value.size, key, value.sort!]}

    # print abstract cf & its child cf list *****
    out << "<br><h1><a name='cf3'>  abstract cf & its child cf list</a></h1><br>"
    out << "<table border='1' cellpadding='5'>"
    abs_cf_child_table_print.sort.each do |count, cf, child_list| 
      out << "<tr><td>%s</td><td>%d</td><td>%s</td></tr>" % [cf, count, child_list.sort.join("<br>")] 
    end
    out << "</table>"

    # print abstract cf & its child cf list (for excel)*****
    out << "<br><h1> for excel output </h1><br>"
    out << "<table border='1' cellpadding='5'>"
    abs_cf_child_table_print.sort.each do |count, cf, child_list| 
      #out << "<tr><td>%s</td><td>%d</td><td>%s</td></tr>" % [cf, count, child_list.sort.join("<br>")] 
      child_list.each_with_index do |x,i| 
        out << "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>" % [i == 0 ? cf : '-',
                                                                          i == 0 ? count.to_s : '-',
                                                                          x,
                                                                          owner_table[x]]
      end
      out << "<tr><td>*</td><td>*</td><td>*</td><td>*</td></tr>"
    end
    out << "</table>"

    # print cf list by rb file name *****
    if category == 'dyn'
      out << "<br><h1> cf list by rb file name </h1><br>"
      out << "<table border='1' cellpadding='5'>"
      rb_parse_result.sort.each {|x| out << "<tr><td>#{x}</td></tr>"}
      out << "</table>"
    end

    # print total cf list on online doc *****
    out << "<br><h1><a name='cf4'>  total cf list on online doc </a></h1><br>" 
    # in fix category case rb_parse_result will be []
    union = (rb_parse_result + cf_list).uniq.sort
    out << union.join("<br>")
    f.write out.join("\r\n")

    f.close
  end

  # generate txt file =====================================

  puts "generate cf_table_from_online_doc_#{category}.txt..."
  File.open("#{HOME_PATH}/script_print/cf_table_from_online_doc_#{category}.txt", "w+") do |f|
    f.write cf_list.sort.join("\r\n")
    f.close
  end

  if category == 'dyn'
    puts "generate cf_table_from_rb_file_name.txt..."
    File.open("#{HOME_PATH}/script_print/cf_table_from_rb_file_name.txt", "w+") do |f| 
      f.write rb_parse_result.sort.join("\r\n")
      f.close
    end

    puts "generate cf_table_from_rb_file_name_and_online_doc.txt..."
    File.open("#{HOME_PATH}/script_print/cf_table_from_rb_file_name_and_online_doc.txt", "w+") do |f| 
      f.write union.sort.join("\r\n")
      f.close
    end
  end

end

def parse_online_doc uri, tmp, issue, is_php=false
  doc = Nokogiri::HTML(open(uri))

  if is_php # *** php page ***

    # try to parse cf table in php page
    cf = doc.css("div[class='memdoc'] ul")

    # ** with cf table **
    if cf.size > 0 
      cf_name = doc.css("div[class='memdoc'] p")[0].text
      parent_cf_name_ary = cf[0].text.each_line.select {|x| x =~ /\w+:\s*$/}
      tmp << [cf_name.strip, parent_cf_name_ary.map{|x| x.chomp.gsub(/[\s:]/, '')}] unless parent_cf_name_ary.empty?

    # ** without cf table **
    else 
      issue << "#{doc.css("title").text.split(' ')[1]}"
    end

  else # *** dir page ***

    # parse php/dir page link
    prefix = File.dirname(uri)
    dir, php = doc.css("div[class='contents'] a[class='el']").partition {|a| a["href"] =~ /^dir_/}
    dir.each {|d| parse_online_doc("#{prefix}/#{d["href"]}", tmp, issue, false) }
    php.each {|d| parse_online_doc("#{prefix}/#{d["href"]}", tmp, issue, true)  }
    puts uri
  end
  
end

def check_dyn_rb path, tmp
  Dir["#{path}*.rb"].each {|file| tmp << File.basename(file).sub(".rb", '').chomp }
  Dir["#{path}*/"].each {|folder| check_dyn_rb folder, tmp }
end






# ========================== command line ====================================

path = HOME_PATH
get_path = false
puts "\r\nScript folder will be \"#{path}\"\r\nChange path? (y/n)"

ARGF.each do |input|   
  case input.chomp
  when 'n'

    # check path
    unless File.directory? path
      puts "path not exist!\r\nPlease input new output path:"
      get_path = true
      next
    end

    puts 'start ...'
    HOME_PATH.replace(path)
    # ! start ================================
    puts 'parse dyn online doc ...'
    print_xxx_cf_table 'dyn'
    puts 'parse fix online doc ...'
    print_xxx_cf_table 'fix'
    #diff_cf_table
    # ! start ================================
    puts 'done ...'
    break

  else
    if get_path
      path = File.expand_path(input.chomp)
      puts "\r\nScript folder will be \"#{path}\"\r\nChange path? (y/n)"
      get_path = false
    else
      puts "\r\nPlease input new output path:"
      get_path = true
    end
  end
end
