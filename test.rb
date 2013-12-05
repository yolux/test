# encoding: utf-8
require 'nokogiri'
require 'open-uri'

def diff_cf_table
  file_a = '/home/yolux/Downloads/cf_table_from_online_doc_with_count.txt'
  file_b = '/home/yolux/Downloads/cf_table_from_source_code_l2_related.txt'
  ignore_list = ['user_recommended_by_id',
                  'user_reply_action',
                  'user_reply_recommend',
                  'user_reply_recommend_by_id',
                  'user_reply_report_by_id',
                  'recommend_to_by_user_id',
                  'reply_action',
                  'reply_recommend',
                  'reply_recommend_by_user_id',
                  'reply_report',
                  'length_limited']
  File.open(file_a, "r:utf-8") do |f_a|
    File.open(file_b, "r:utf-8") do |f_b|
      set_a = []
      f_a.readlines.each do |line| 
        name_count = line.chomp.split(':')
        set_a << name_count[0].chomp if name_count[1].to_i == 1
      end
      set_b = f_b.readlines.map{|x| x.chomp}

      #puts set_a, set_b
      puts set_a.size, set_b.size,(set_a-set_b).size
      File.open("/home/yolux/Downloads/cf_table_useless_by_diff.txt", "w+") do |f|
        (set_a-set_b).each do |x|
          f.write "#{x}\r\n" unless ignore_list.include? x
        end
        f.close
      end

      f_b.close
    end
    f_a.close
  end
end

def print_dyn_rb
  path = '/home/yolux/work/web_mobile30_backend/lib/models/dynamic/'
  tmp = []
  check_dyn_rb path, tmp
  File.open("/home/yolux/Downloads/cf_table_from_rb_file_name.txt", "w+") do |f| 
    f.write tmp.sort.join("\r\n")
    f.close
  end
end

def check_dyn_rb path, tmp
  Dir["#{path}*.rb"].each {|file| tmp << File.basename(file).sub(".rb", '') }
  Dir["#{path}*/"].each {|folder| check_dyn_rb folder, tmp }
end

def print_dyn_cf_table
  tmp = []
  url = 'http://192.168.0.61:8080/~chhsiao/NoSQLRoot-current/doc/dynamic/html/dir_49f1493d6025ddd077103351e1b7f299.html'
  get_dyn_page(url, tmp)

  File.open("/home/yolux/Downloads/CFTable3.html", "w+") { |f|
    f.write "<br><h1> cf table list by page </h1><br>"
    f.write("<table border='1' cellpadding='5'>")
    tmp.sort.each {|cf, api| f.write "<tr><td>%s</td><td>%s</td></tr>\n" % [cf, api.join("<br>")] }
    f.write("</table>")

    f.write "<br><h1> cf table list by used count </h1><br>"
    f.write("<table border='1' cellpadding='5'>")
    tmp.map{|x| 
      x[1]
    }.flatten!.group_by{|x| 
      x
    }.sort_by{|x| 
      x[1].size
    }.each{|cf, ary| 
      f.write "<tr><td>#{cf}</td><td>#{ary.size}</td></tr>\n" 
    }
    f.write("</table>")

    f.write "<br><h1> cf table list for excel </h1><br>"
    tmp.map {|x| x[1]}.flatten!.uniq!.each { |x| f.write "#{x.sub!(':','')}<br>\n" }
    
    f.close
  }
end

def get_dyn_page uri, tmp, is_php=false
  doc = Nokogiri::HTML(open(uri))

  if is_php # php page
    # try to parse cf table in php page
    cf = doc.css("div[class='memdoc'] ul")

    if cf.size > 0 # with cf table
      cf_name = doc.css("div[class='memdoc'] p")[0].text
      parent_cf_name_ary = cf[0].text.each_line.select {|x| x =~ /\w+:\s*$/}
      tmp << [cf_name, parent_cf_name_ary]
    else # without cf table
      tmp << ["*#{doc.css("title").text.split(' ')[1]}", ["no cf table!"]]
    end
  else # dir page
    # parse php/dir page link
    prefix = File.dirname(uri)
    dir, php = doc.css("div[class='contents'] a[class='el']").partition {|a| a["href"] =~ /^dir_/}
    dir.each {|d| get_dyn_page("#{prefix}/#{d["href"]}", tmp, false) }
    php.each {|d| get_dyn_page("#{prefix}/#{d["href"]}", tmp, true)  }
  end
  
end

def print_cf_table
  hash = {}
  file_list = ["/home/yolux/work/web_mobile30_backend/script/RunL1ApiService.sh"]
  uri_list = ["http://192.168.0.61:8080/~chhsiao/NoSQLRoot-current/doc/fixed/html/dir_ccd701293dd39aa2104416f3bfcc5d24.html"]
  

  #file_list.each {|x| hash.update(from_file(x))}
  uri_list.each {|x| hash.update(from_uri(x))}
  hash.delete('?')

  File.open("/home/yolux/Downloads/CFTableuri.txt", "w+") { |f|
  
    hash.sort.each {|cf, api|
  	  f.write "#{cf.chomp}\n"
    }
    f.close
  }
end

def print_cf_table2
  hash = {}
  file_list = ["/home/yolux/work/web_mobile30_backend/script/RunL1ApiService.sh"]
  uri_list = ["http://192.168.0.61:8080/~chhsiao/NoSQLRoot-current/doc/fixed/html/dir_ccd701293dd39aa2104416f3bfcc5d24.html"]
  select_str = '<select><option>Chris</option><option>Yehudi</option><option>Yolux</option></select>'

  file_list.each {|x| hash.update(from_file(x))}
  uri_list.each {|x| hash.update(from_uri(x))}
  hash.delete('?')

  File.open("/home/yolux/Downloads/CFTable.html", "w+") { |f|
    f.write("<table border='1' cellpadding='5'>")
    f.write("<tr><td>Owner</td><td>CF Name</d><td>Count</td><td>Function</td></tr>")
    hash.sort.each {|cf, api|
      f.write("<tr><td>%s</td><td>%s</d><td>%d</td><td>%s</td></tr>"%[select_str, cf, api.size, api.join("<br>")])
    }
    f.write("</table>")
    f.close
  }
end

def from_file file
  pattern = "/home/social_backend/deploy/current/lib/no_sql_root/thrift/Api1Server.sh "
  hash = {}

  File.open(file, "r"){ |f|
  	hash = f.readlines.group_by { |line|
  	  (word = line.sub!(pattern, '')) ? word.sub(/^Api1(Update|Remove|Add|\w*GetCount|\w*Get)/, '') : '?'
  	}
  	f.close
  }
  
  return hash
end

def from_uri uri
  doc = Nokogiri::HTML(open(uri))

  doc.css("a[class='el']").map {|a| 
    a.text unless a["href"] =~ /^dir_/
  }.compact!.group_by {|x|
    (x =~ /.php$/) ? x.sub(".php","") : '?'
  }
end

print_cf_table




def from_web uri
  ary = []
  # recursive parse html
  find_next(ary, uri)

  # group by CF name
  res = ary.group_by {|x|
    x.split("'")[1] || "? (from web)"
  }

  return res
end

def find_next res, uri
  doc = Nokogiri::HTML(open(uri))
  title = doc.css("title").text
  
  case title
  when /File Reference/ # php source code page
    name = title.sub!(" File Reference", "")
    fail = true

    doc.css("div[class='line']").each {|t| 
      if t.text.include?("GetCF")
        res << "#{name}:#{t.text}" 
        fail = false
      end
    }
    # mark 'not found' if no pattern match
    res << "#{name}:not found;" if fail
    
  when /Directory Reference/ # folder page
    prefix = File.dirname(uri)
    doc.css("table[class='memberdecls'] a").each { |a|
      find_next(res, "#{prefix}/#{a["href"]}") if a["href"] && !a["href"].empty?
    }

  end

end
<<-TEST
require 'benchmark'

a = (1..100000).map { rand(100000) }

Benchmark.bm(10) do |b|
  c = ['1','3','56','','63','','','3','3','3','3','3','3', nil, '3','3','3','3','3','3','3','3','3','3','3','3','3','3','3','3','3','3']
  a = c*50
  res = []
  b.report("A")  { a.each{ |x| res << x if x && !x.empty?} }
  res = []
  b.report("B")  { a.reject {|x| x.nil? || x.empty?}.each { |x| res << x} }
end

                 user     system      total        real
A            0.000000   0.000000   0.000000 (  0.000233)
B            0.010000   0.000000   0.010000 (  0.000394)
TEST

#print_dyn_cf_table
#diff_cf_table
#print_dyn_rb

def killcomment file
  dir, basename = File.split(file)
  ext = File.extname(basename)

  File.open(file, "r:utf-8") do |fr|
  File.open("#{dir}/#{basename[0...(basename.size-ext.size)]}_re#{ext}", "w+") do |f|
    skip_mark_rex = Regexp.new (['Binary file', '\.txt:', '~:', '\.html:', '//設定', '.tex:', '中文\(傳統\)', '//沒有 ', '.privacy:','.bak:', '# ', '#x ', '#v ', 'lib/no_sql_root/backend_if/', 'lib/no_sql_root/dev-cassandra/', 'lib/no_sql_root/browser/', 'lib/no_sql_root/src/php-common/Common/ConstantsIKalaHTML', 'lib/no_sql_root/src/php-common/ConstantsIKalaHTML'].join('|'))
    skip_mark_list = ['*', '#', '/']
    output = [] 
    fr.readlines.each do |line|
      #next if line.index skip_mark_rex
      next unless line.index Regexp.new 'lib/no_sql_root/src/api'
      next if skip_mark_list.include? (line.split(':')[1].strip)[0]
      output << line
    end
    f.write output.join("")
  end

  end

end

killcomment('/home/yolux/find_chinese.txt')

return

def killmark file, mark=';'
  dir, basename = File.split(file)
  ext = File.extname(basename)

  File.open(file, "r:utf-8") do |fr|
  File.open("#{dir}/#{basename}_re#{ext}", "w+") do |f|
    output = fr.readlines.find_all{|x| x[0] != mark}
    f.write output.join("")
  end

  end

end

killmark("/home/yolux/Downloads/php_from_81.ini")
killmark("/home/yolux/Downloads/php_from_99.ini")
killmark("/home/yolux/Downloads/php_from_164.ini")

return
def cs str
  funcname = str.split('_').map(&:capitalize).join
  puts funcname
  "function (?:GetByIndexedColumn|Update|MultiUpdate|Add|Get|MultiAdd|MultiGet|Remove)#{funcname}(?:CheckParams|DealWith|Preprocess)"
end

File.open('/home/yolux/Downloads/IN.txt', "r:utf-8") do |f|

  t1 = f.readlines.map{|x| x.strip}.uniq
  out = t1.map {|x| cs(x) }
  
  File.open('/home/yolux/Downloads/OUT.txt', "w+") do |f|
    f.write out.join("\n")
    f.close
  end
  f.close

end

return

def cs str
  funcname = str.split('_').map(&:capitalize).join
  "function (Add|Get|MultiAdd|MultiGet|Remove|Update|MultiUpdate)#{funcname}(CheckParams|DealWith)"
end

File.open('/home/yolux/Downloads/TEST92', "r:utf-8") do |f|

  t1 = f.readlines.map{|x| x.strip.gsub('.rb','').split('/')[-1]}.compact
  out = t1.map {|x| cs(x) }
  
  File.open('/home/yolux/Downloads/TEST92out', "w+") do |f|
    f.write out.join("\n")
    f.close
  end
  f.close

end

return 
File.open('/home/yolux/Downloads/TEST', "r:utf-8") do |f|
File.open('/home/yolux/Downloads/TEST2', "r:utf-8") do |f2|
  t1 = f.readlines.map{|x| x.strip}
  t2 = f2.readlines.map{|x| x.strip}.compact
  puts t1.size
  puts t2.size
  out = t1.map {|x| (t2.include? x) ? x : ( x == '' ? '' : "[X] #{x}") }
  
  File.open('/home/yolux/Downloads/OUT', "w+") do |f|
    f.write out.join("\r\n")
    f.close
  end
  f.close
  f2.close
end
end


return
File.open('/home/yolux/work/web_mobile30_backend/script/abc.txt', "r:utf-8") do |f|
File.open('/home/yolux/work/web_mobile30_backend/script/target.txt', "r:utf-8") do |f2|
  t1 = f.readlines.map{|x| x.strip}
  t2 = f2.readlines.map{|x| x.strip}
  puts t1.size
  puts t2.size
  res = []
  i = 0
  t2.each{|x| 
    item = '-'
    t1.each{|y| 
      if x.include? y 
        item = "L2不會碰到" 
        i += 1
        break
      end
    }
    res << item
  }
  puts i
  puts res.size
  File.open('/home/yolux/work/web_mobile30_backend/script/c.txt', "w+") do |f|
    f.write res.join("\r\n")
    f.close
  end
  f.close
  f2.close
end
end
