# encoding: utf-8
require 'nokogiri'
require 'open-uri'
require 'fileutils'
HOME_PATH = File.expand_path '.'

def parse_php_function all_in_one=false
  path = "#{HOME_PATH}/../lib/no_sql_root/src/"
  total_cf_list = []
  parse_result = {}
  f_write = []
  issue = {:no_func_name => [], :key_exist => [], :call_before_function => []}

  # read cache data if exist ==============================================
  cache_file = "#{HOME_PATH}/script_print/phpsrc.cache"
  cache_issue_file = "#{HOME_PATH}/script_print/phpsrc_issue.cache"
  puts "read *.php in source code"
  if File.exist? cache_file
    puts "read cache ..."
    parse_result = Marshal.load File.read(cache_file)
    issue = Marshal.load File.read(cache_issue_file)
  else
    # parse php file in source code =====================================================
    check_php path, parse_result, issue

    # special case, remove duplicate php file from xxx/api/xxx and keep xxx/api-core/xxx
    puts "handle api or api-core issue"
    parse_result.each do |func_name, func_info_ary|

      if func_info_ary.size > 1
        puts "#{func_info_ary.size.to_s}, #{func_name}"
        api = []
        drop = []
        apicore = []
        apiphp = []
        apiweb = []
        sep = File::SEPARATOR
        test1 = "#{sep}api-core#{sep}"
        test2 = "#{sep}api#{sep}"
        test3 = "#{sep}php-common#{sep}"
        test4 = "#{sep}api-web#{sep}"
        
        func_info_ary.each do |func_info|
          if func_info[:path].include? test1
            apicore << func_info 
          elsif func_info[:path].include? test2
            api << func_info 
          elsif func_info[:path].include? test3
            apiphp << func_info 
          elsif func_info[:path].include? test4
            apiweb << func_info 
          else
            drop << func_info
          end
        end

        if apicore.size == api.size && apicore.size == 1
          func_info_ary.clear
          func_info_ary << apicore[0]
          #puts "#{apicore.size}, #{api.size}, #{apiweb.size}, #{apiphp.size}, #{drop.size}"
          [apiphp, apiweb].each{|x| func_info_ary.concat x}
        else
          func_info_ary.clear
          [apicore, api, apiphp, apiweb].each{|x| func_info_ary.concat x}
          #[apicore, api].each{|x| func_info_ary.concat x}
          #puts "#{apicore.size}, #{api.size}, #{apiweb.size}, #{apiphp.size}, #{drop.size}"
          #drop.each{|x| puts x[:path]}
        end

      end
    end

    # save to cache *****
    serialized_array = Marshal.dump(parse_result)
    File.open(cache_file, 'w') {|f| f.write(serialized_array) }
    serialized_array = Marshal.dump(issue)
    File.open(cache_issue_file, 'w') {|f| f.write(serialized_array) }
  end

  #
  # ==== L1 php source function call info table ======
  #
  # 這個表示把/lib/no_sql_root/src/ 下面所有的*.php去列出所有function的列表,包含該function有呼叫哪個外部function,以及用到的cf 列表
  #
  puts "generate L1 php source function call info table.html"
  File.open("#{HOME_PATH}/script_print/L1 php source function call info table.html", "w+") do |f|
    color = ["'color:green'","'color:blue'"]
    i = 0

    # **** issue table ****
    f_write = []
    f_write << "<br><h1> issue php file </h1><br>"
    f_write <<  "<table border='1' cellpadding='5'>"
    issue.each do |name, file|
      (f_write << "<tr><th>#{name.to_s}</th><td>#{ file.join("<br>") }</td></tr>") unless file.empty?
    end
    f_write << "</table>"

    # **** function info table ****
    f_write << "<br><h1> function call info table </h1><br>"    
    parse_result.sort.each do |func_name, func_info_ary|
      f_write << "<table border='1' cellpadding='5' style=#{color[i%2]}><tr><th colspan='2'>_#{func_name.to_s}_</th></tr>"
      func_info_ary.each_with_index do |func_info, idx|
        f_write << "<tr><th>id</th><td>#{idx.to_s}</td></tr>"
        f_write << "<tr><th>File Path</th><td>#{func_info[:path]}</td></tr>"
        f_write << "<tr><th>Function Call</th><td>#{ func_info[:ext_func_name].join(",<br>") }</td></tr>"
        f_write << "<tr><th>Function Call Params</th><td>#{ func_info[:ext_func_with_param].join(",<br>") }</td></tr>"
        f_write << "<tr><th>CF Table</th><td>#{ func_info[:cf_name].join(",<br>") }</td></tr>"
        total_cf_list.concat(func_info[:cf_name])
      end
      f_write << "<tr><th colspan='2'>-</th></tr></table><br><br>"
      i += 1
    end

    # **** cf table ****
    f_write << "<br><h1> cf table union </h1><br>"
    f_write << "<table border='1' cellpadding='5'><tr><th>"
    f_write << total_cf_list.uniq.compact.sort.join("<br>")
    f_write << "</th></hr></table>"
    f.write f_write.join("\r\n")
    
    f.close
  end   

  #
  # === L2 related function call info table ===
  # 
  # 這個表示利用RunL1PaiService.sh中會用到的API 去 L1 php source function call info table中反查,將所有會用到的延伸function以及cf 列表 編列成表格
  #
  
  l2_func_list = []
  sorted_total_cf_list = []
  total_cf_list = []
  issue_func_hash = {}
  issue_list = [ 'auto_complete', 'by_the_timestamp', 'by_word_count', 'comment', 'contact_user', 'count', \
                 'deleted', 'length_limited', 'postee', 'recommend', 'search_related', 'search', 'share', \
                 'system_all', 'user_postee_push', 'user_recommend', 'user_recommended_by_id', 'user_relation_by_name', \
                 'user_relation_by_the_timestamp', 'user_relation', 'user_see', 'user_share', 'user']
  issue_list.each{|x| issue_func_hash[x] = []}
  file = "#{HOME_PATH}/RunL1ApiService.sh"
  pattern = "/home/social_backend/deploy/current/lib/no_sql_root/thrift/Api1Server.sh Api1"

  # parse L2 related L1 api from RunL1PaiService.sh *********
  puts "read RunL1ApiService.sh..."
  File.open(file, "r:utf-8") do |f|
    l2_func_list = f.readlines.map{|line| line.chomp!.sub!(pattern, '')}.compact.sort
    f.close
  end

  # read cf_table_from_rb_file_name_and_online_doc *********
  # use this table to generate reference table to guess possible cf from a given function name
  puts "read cf_table_from_rb_file_name_and_online_doc.txt..."
  ref_table = []
  File.open("#{HOME_PATH}/script_print/cf_table_from_rb_file_name_and_online_doc.txt", "r:utf-8") do |f|
    def camel_case
      return self if self !~ /_/ && self =~ /[A-Z]+.*/
      split('_').map{|e| e.capitalize}.join
    end

    lines = f.readlines.map{|x| x.chomp}
    lines.delete('')
    ref_table = lines.map{|x| [x, x.camel_case]}
    f.close
  end

  # create folder *********
  FileUtils.mkdir_p("#{HOME_PATH}/script_print/page")
  color = ["'color:green'","'color:blue'"]
  i = 0

  # generate html file ******
  puts "generate L2 related function call info table.html"
  File.open("#{HOME_PATH}/script_print/L2 related function call info table_all_in_one.html", "w+") do |f_aio|
  File.open("#{HOME_PATH}/script_print/L2 related function call info table.html", "w+") do |f|

      # *** title ***
      f.write "<br><h1> L2 related function call info table </h1><br><br>"    
      f_aio.write "<br><h1> L2 related function call info table </h1><br><br>"

      # *** bookmark ***
      f.write "<table border='1' cellpadding='5'>"
      f_aio.write "<table border='1' cellpadding='5'>"
      l2_func_list.each do |l2_func_name|
        f_aio.write "<tr><td><a href='##{l2_func_name}'>Api1#{l2_func_name}</a></td></tr>"
        f.write "<tr><td><a href='page/#{l2_func_name}.html'>Api1#{l2_func_name}</a></td></tr>"
      end
      f.write "</table><br><br>"
      f_aio.write "</table><br><br>"

      # *** function info ***
      l2_func_list.each do |l2_func_name|
        puts l2_func_name
        f_write = []
        i += 1

        File.open("#{HOME_PATH}/script_print/page/#{l2_func_name}.html", "w+") do |f|
          # *** use parse result to generate recursive call list ***
          call_list, cf_list, call_stack = generate_call_list(parse_result, l2_func_name)

          f_aio.write "<table border='1' cellpadding='5' style=#{color[i%2]} ><tr><th colspan='2'><a name='#{l2_func_name}'><h3>_#{l2_func_name}_</h3></a></th></tr>"
          f.write "<table border='1' cellpadding='5'><tr><th colspan='2'><h3>_#{l2_func_name}_</h3></th></tr>"

          f_write << '<tr><td><center>Function Call</center></td></tr>'          
          f_write << '<tr><td><div STYLE=" max-height: 700px; width: 1400px; font-size: 12px; overflow: auto; "><table><tr><td>'
          f_write << call_list.each_with_index.map{|x,idx| "#{idx}.#{x}"}.join(",<br>")
          f_write << "</td></tr></table></div></td></tr>"

          f_write << '<tr><td><center>Function Call Stack</center></td></tr>'
          f_write << '<tr><td><div STYLE=" max-height: 700px; width: 1400px; font-size: 12px; overflow: auto;"><table><tr><td>'
          f_write << call_stack.join(",<br>")
          f_write << "</td></tr></table></div></td></tr>"

          f_write << '<tr><td><center>CF table</center></td></tr>'
          f_write << '<tr><td><div STYLE=" max-height: 700px; width: 1400px; font-size: 12px; overflow: auto;"><table><tr><td>'
          f_write << cf_list.join(",<br>")
          total_cf_list.concat cf_list
          f_write << "</td></tr></table></div></td></tr>"

          f_write << '<tr><td><center>Guessed CF table</center></td></tr>'
          f_write << '<tr><td><div STYLE=" max-height: 250px; width: 1400px; font-size: 12px; overflow: auto;"><table><tr><td>'
          # *** use ref table & l2 function name to guess possible cf list ***
          guess_result = guess_cf_table(call_list, ref_table, issue_list, issue_func_hash)
          guess_cf_list = guess_result - cf_list # do not duplicate with original cf_list
          f_write << guess_cf_list.join(",<br>")
          total_cf_list.concat guess_cf_list
          f_write << "</td></tr></table></div></td></tr>"

          f_write << "<tr><th colspan='2'>-</th></tr></table><br>"
          out = f_write.join("\r\n")
          f.write out
          f_aio.write out
          f.close
        end

      end

      sorted_total_cf_list = total_cf_list.uniq.compact.sort

      # *** cf table ***
      f_write = []
      f_write << "<br><h1> cf table union</h1><br>"    
      f_write << "<table border='1' cellpadding='5'><tr><td>"
      f_write << sorted_total_cf_list.join("<br>")
      f_write << "</td></tr></table>"

      # *** issue cf table ***
      f_write <<  "<br><h1> issue cf table union</h1><br>"    
      f_write << "<table border='1' cellpadding='5'>"
      issue_func_hash.sort.each do |cf, func|
        f_write << "<tr><th>#{cf}</th><td>#{func.join("<br>")}</td></tr>" 
      end
      f_write << "</table>"
      
      out = f_write.join("\r\n")
      f.write out
      f_aio.write out
      f_aio.close
      f.close
  end
  end

  # *** generate cf_table_from_source_code_l2_related.txt ***
  puts "generate cf_table_from_source_code_l2_related.txt..."
  File.open("#{HOME_PATH}/script_print/cf_table_from_source_code_l2_related.txt", "w+") do |f| 
    f.write sorted_total_cf_list.join("\r\n")
    f.close
  end

end

def generate_call_list tmp, name
  call_list = []
  cf_list = []
  call_stack = []
  do_generate_call_list tmp, name, call_list, cf_list, call_stack, []

  return [call_list.uniq.compact.sort, cf_list.uniq.compact.sort, call_stack.uniq.compact.sort]
end

def do_generate_call_list tmp, name, call_list, cf_list, call_stack, call_stack_tmp
  call_list << name
  result = tmp[name]

  if result.nil?
    call_stack << "#{call_stack_tmp.join(' -> ')} -> #{name}*"
  else

    call_stack_tmp << name
    result.each do |func_info|
      cf_list.concat func_info[:cf_name]
      func_info[:ext_func_name].each do |x| 
        if call_list.include? x
          call_stack << "#{call_stack_tmp.join(' -> ')} -> #{x}"
        else
          do_generate_call_list(tmp, x, call_list, cf_list, call_stack, call_stack_tmp) 
        end
      end 
    end
    call_stack_tmp.delete_at(-1)

  end
end

def check_php path, tmp, issue

  # =====================  php files =========================
  Dir["#{path}*.php"].each do |file|
    File.open(file, "r:utf-8") do |f|
      funcs = []

      f.readlines.each do |line|
        # parse function name
        result = line.scan(/function [A-Z]+[a-zA-Z0-9]+\(/).map{|x| x[9...-1]}
        puts "warning !! 2 func in 1 line !!  #{file.to_s}" if result.size > 1
        funcs << {:path => file.to_s, :func_name => result[0], :ext_func_with_param => [], :ext_func_name => [], :cf_name => []} if result.size == 1
        
        # parse external function name
        result = line.scan(/[A-Z]+[a-zA-Z0-9]+\(/).map{|x| x[0...-1]}
        issue[:call_before_function] << file.to_s if !result.empty? && funcs.empty?
        funcs[-1][:ext_func_name].concat result if !result.empty? && !funcs.empty?

        # parse external function name with all params
        result = line.scan(/[A-Z]+[a-zA-Z0-9]+\(.*\)/)
        funcs[-1][:ext_func_with_param].concat result if !result.empty? && !funcs.empty?

        #if ext_func_name.size != ext_func_with_params.size
        #  #puts 'warnning params error ! ' + file.to_s + ext_func_with_params.to_s
        #  issue[:params_no_match] << file.to_s
        #end
        
        # parse cf table  #(GetCFS\(\S+') #(GetCFS\([^\)]+\))
        result = line.scan(/GetCFS\([^\)]+\)/).map{|x| x.split("'")[1]}        
        funcs[-1][:cf_name].concat result if !result.empty? && !funcs.empty?
      end
        
      # insert func_info into tmp
      funcs.each do |func_info|
        func_info[:ext_func_name].uniq!
        func_info[:cf_name].uniq!
        name = func_info[:func_name]

        # check function name uniq
        if tmp.key? name
          issue[:key_exist] << file.to_s
          tmp[name] << func_info
        else
          tmp[name] = [func_info]
        end
      end

      issue[:no_func_name] << file.to_s if funcs.empty?
      f.close
    end
  end

  # ===================== folders =========================
  Dir["#{path}*/"].each do |folder|
    check_php folder, tmp, issue
    puts path
  end

end

def guess_cf_table list, ref_table, issue_list, issue_func_hash
  result = []
  list.each do |x|
    # take the longest match string as the guess value
    guess = ref_table.select{|ref| x.include? ref[1]}.sort{|x,y| y[1].size <=> x[1].size}
    unless guess.empty?
      cf = guess[0][0]
      result << cf
      (issue_func_hash[cf] << x) if issue_list.include?(cf) && !issue_func_hash[cf].include?(x)
    end
  end

  return result.uniq.sort
end

# *** command line ***

path = HOME_PATH
get_path = false
puts "\r\nScript folder will be \"#{path}\"\r\nChange path? (y/n)"
path_ok = false

ARGF.each do |input|   
  case input.chomp
  when 'n'

    # check path
    unless File.directory? path
      puts "path not exist!\r\nPlease input new output path:"
      get_path = true
      next
    end

    puts "start..."
    parse_php_function
    puts "done..."
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
