# encoding: utf-8
require 'fileutils'
require 'nokogiri'
require 'open-uri'

db = "my_dic_db"
output = "dic.html"
input1 = "birdytc"
input2 = 4

def testt output_file
  tmp = []
  dic_ary = []
  dbg_count = 0
  dbg_time = nil

  # remove duplicate word between each dictionary
  [normalize_1(50), normalize_2(100), normalize_3(10), normalize_4(5)].sort.each{ |dummy, dic|
    puts dic.size
    dic_ary << (dic - tmp)
    tmp += dic_ary[-1]
  }

  # create folder
  dir = output_file
  FileUtils.mkdir_p(dir)
  #continue_test = [nil, nil, nil]
  continue_test = ['C', 12, 'dactylozooid']
  dbg_time = Time.now
  idx = 65

  dic_ary.each { |dic|
    
    # =================================================== test 1
    continue_test[0] = nil if (idx).chr == continue_test[0]
    unless continue_test[0]

      # save to different file according to word length
      dic.group_by {|w| 
        w.size 
      }.sort.each {|count, ary| 
        
        # =================================================== test 2
        continue_test[1] = nil if count == continue_test[1]
        unless continue_test[1]
        
          out_f = "#{dir}/#{(idx).chr}_#{count.to_s}.txt"
          puts out_f
          File.open(out_f, "a+") { |fos|    
            ary.sort.each {|w| 

              # =================================================== test 3
              continue_test[2] = nil if w == continue_test[2]
              unless continue_test[2]
                s = ""
                # ***************************** retry
                3.times do |x|
                  begin
                    dbg_count = dbg_count + 1
                    puts "#{dbg_count.to_s}, #{dbg_time.to_s}, #{(Time.now-dbg_time).to_i.to_s} sec"
                    #s = "#{w} : <尚未翻譯!>"
                    #s = dreye_tran(w)
                    s = google_tran(w)
                    puts s
                    fos.write("#{s}\n") 
                    sleep(Random.rand(3)+1)
                    break
                  rescue => e
                    if x == 1
                      puts e
                      puts "give up for #{w}"
                      fos.close
                      raise 'fail!'
                    else
                      puts "#{dbg_count.to_s}, #{Time.now.to_s}"
                      puts e
                      puts "sleep 60 min for #{w}"
                      sleep(3603)
                    end
                  end
                end
                # ***************************** retry

              end
              # =================================================== test 3
            }

            fos.close
          }
        
        end
        # =================================================== test 2
      }

    end
    # =================================================== test 1

    idx += 1
  }
end


# <cite>translate.google.com</cite>
#<table class=ts><tr><td style="padding:4px 0 0" valign=top width=47><a href="http://translate.google.com/translate_t?q=crib&amp;um=1&amp;ie=UTF-8&amp;sl=en&amp;tl=zh-TW&amp;sa=X&amp;ei=Q504UZ8TkNySBeKygKAN&amp;ved=0CC8Q_AgwAA" ><img src=/images/icons/onebox/translation-40.gif alt="" border=0 height=40 width=40></a><td valign=top><div class=f style="margin-bottom:5px"><cite>translate.google.com</cite></div><h3 class="r"><nobr>crib</nobr> - <nobr>嬰兒床</nobr></h3><br>字典： 飼槽,拘禁,娃娃床<br></table>
  
def google_tran query
  word0 = 'translate.google.com'
  result = "#{query} : ?"
  fail_pattern = /[a-z]/
  doc = nil

  5.times do |x|
    begin
      #doc = Nokogiri::HTML(open('http://www.google.com/search?q='+query+'+%E7%BF%BB%E8%AD%AF&aq=f&oq='+query+'+%E7%BF%BB%E8%AD%AF&sourceid=chrome&ie=UTF-8' ), nil, "big5")
      doc = Nokogiri::HTML(open( URI.escape('http://www.google.com/search?hl=zh-TW&ie=UTF-8&q='+query+'+翻譯') ), nil, "big5")
      break
    rescue => e
      if x == 1
        puts "give up for #{query}"
        raise 'fail!'
      else
        puts e
        puts "sleep 60 min for #{query}"
        sleep(3601)
      end
    end
  end

  #puts doc.to_s.encoding.to_s
  if doc.css("table[class='ts'] cite").any? {|x| x.text == word0 }
    word1 = doc.css("table[class='ts'] h3")[0].text
    temp = doc.css("table[class='ts']")[0].text
    temp.sub!(word1, '')
    temp.sub!(word0, '')
    word2 = temp[4..-1]
    word1.sub!(query, '')
    word1.sub!(/ -/, '')
    word1.strip!
    if word1 !~ fail_pattern
      result = word2 ? "#{query} : #{word1} (#{word2})" : "#{query} : #{word1}"
      #word2 = (temp.sub(word1, '').sub(word0, ''))[4..-1]
      #word1 = word1.sub(query, '')
      #result = word2 ? "#{query}#{word1} (#{word2} )" : "#{query} #{word1}"
    end
  end

  return result
end



def dreye_tran query
  result = "#{query} : ?"
  doc = nil

  5.times do |x|
    begin      
      doc = Nokogiri::HTML(open( URI.escape('http://www.dreye.com:8080/axis/ddict.jsp?dod=0102&ver=big5&w='+query) ), nil, "big5")
      break
    rescue => e
      if x == 1
        puts "give up for #{query}"
        raise 'fail!'
      else
        puts e
        puts "sleep 3 min for #{query}"
        sleep(181)
      end
    end
  end
  
  if doc.css("div[class='ptitle']")[0].text.split("KK")[0].strip == query
    doc.css("div[class='pexplain']").each {|x|
      result = "#{query} : #{x.text.split('.')[1].strip}"
      break
    }
  end

  return result
end

def yahoo_tran query
  result = "#{query} : ?"
  doc = nil

  5.times do |x|
    begin      
      doc = Nokogiri::HTML(open( URI.escape('http://tw.dictionary.yahoo.com/dictionary?p='+query) ), nil, "big5")
      break
    rescue => e
      if x == 1
        puts "give up for #{query}"
        raise 'fail!'
      else
        puts e
        puts "sleep 3 min for #{query}"
        sleep(181)
      end
    end
  end
  puts doc.inner_html
  doc.css("div[class='description']").each {|x|
    puts x.inner_html
    result = "#{query} : #{x.text.split('.')[1].strip}"
    break
  }

  return result
end

def find letter_set, target_word_length, db_name, output_name
  
   test = Array(('a'..'z')) - Array(letter_set.each_char)
  re = eval("/[#{test.join}]/")
  buf = []
  
  ['A', 'B', 'C', 'D'].each { |piority|
    db_file = "#{db_name}/#{piority}_#{target_word_length.to_s}.txt"

    next unless File.exist?(db_file)

    buf << "<H3><font color='blue'> Table #{piority} </font></H3>"
    File.open(db_file, "r:utf-8"){ |f|
      f.readlines.each { |word|
        buf << word.chomp if word !~ re
      }
      f.close
    }
  }

  fos = File.open(output_name, "w+:utf-8") { |fos|
    fos.write( buf.join("<br>") )
    fos.close
  }
end

def findVer1 letter_set, target_word_length, db_name, output_name
  fos = File.open(output_name, "w+")
  test = Array(('a'..'z')) - Array(letter_set.each_char)
  re = eval("/[#{test.join}]/")

  ['A', 'B', 'C', 'D'].each { |piority|
    db_file = "#{db_name}/#{piority}_#{target_word_length.to_s}.txt"
    fos.write("<H1><font color='blue'> Table #{piority} </font></H1>")

    File.open(db_file, "r"){ |f|
      begin
        while word = f.readline    
          # clear space & write to file
          fos.write("#{word}<br>") if word !~ re
        end
      rescue EOFError
      rescue => e
        puts e
      end
      f.close
    }
  }
  fos.close
end

def normalize output_file
  tmp = []
  dic_ary = []

  #normal1 = normalize_1(50)
  #normal3 = normalize_3(10)
  #special = [1, normal1[1] & normal3[1]]
  
  #[special, normalize_2(100), normal1, normal3].sort.each{ |dummy, dic|
  # remove duplicate word between each dictionary
  [normalize_1(50), normalize_2(100), normalize_3(10), normalize_4(5)].sort.each{ |dummy, dic|
    puts dic.size
    dic_ary << (dic - tmp)
    tmp += dic_ary[-1]
  }

  # create folder
  dir = output_file
  FileUtils.mkdir_p(dir)

  idx = 65
  dic_ary.each { |dic|
    # save to different file according to word length
    dic.group_by {|w| 
      w.size 
    }.sort.each {|count, ary| 
      File.open("#{dir}/#{(idx).chr}_#{count.to_s}.txt", "w+") { |fos|    
        #ary.sort.each {|w| fos.write("#{w}\n") }
        ary.sort.each {|w| 
          s = google_tran(w)
          puts s
          fos.write("#{s}\n") 
          sleep(1)
        }

        fos.close
      }
    }
    idx += 1
  }
end

def normalize_1 piority
  input_file = "raw_dic/29765-8.txt"
  buff = []
  candidate = nil
  
  File.open(input_file, "r"){ |f|
    begin
      while line = f.readline.encode!("UTF-8", "binary", invalid: :replace, undef: :replace, :replace => '?')
        if candidate
          buff.concat(candidate) if line.include? "n."
          candidate = nil
        #elsif line =~ /\A[A-Z]+[ ;]*[A-Z]+\z/
        elsif line =~ /[a-z]|\.|-|'/
          next
        elsif line =~ /\A[A-Z]+\b/
          candidate = line.split(";").map { |w| w.strip.downcase if !w.include? ' ' }
          #puts candidate
        end
      end
    rescue EOFError
    end
    f.close
  }

  return [piority, buff.compact.uniq]
end


def normalize_2 piority
  input_file = "raw_dic/2+2gfreq.txt"
  replace_list = [/-> \[\w+\]/, '+']
  remove_list = [/-----\w*/]
  buff = []

  File.open(input_file, "r"){ |f|
    begin
      while line = f.readline.encode!("UTF-8", "binary", invalid: :replace, undef: :replace, :replace => '?')
        # check useless line, such as comment
        next if remove_list.any? { |re| line =~ re }

        # remove unwanted symbol
        replace_list.each{ |re| line.gsub!(re,'') }

        # several words in one line
        # clear space & write to file
        buff.concat(line.split(',').map{ |w| w.strip })
      end
    rescue EOFError
    end
    f.close
  }

  return [piority, buff.compact.uniq]
end

def normalize_3 piority
  input_file = "raw_dic/Ratings_Warriner_et_al.csv"
  buff = []

  File.open(input_file, "r"){ |f|
    begin
      while line = f.readline.encode!("UTF-8", "binary", invalid: :replace, undef: :replace, :replace => '?')
        buff << line.split(',')[1].strip.downcase
      end
    rescue EOFError
    end
    f.close
  }

  return [piority, buff.compact.uniq]
end

def normalize_4 piority
  input_file = "raw_dic/Nolls Top 3000 American English.txt"
  buff = []
  candidate = nil
  
  File.open(input_file, "r"){ |f|
    begin
      while line = f.readline.encode!("UTF-8", "binary", invalid: :replace, undef: :replace, :replace => '?')
        buff << line.strip.downcase if !line.include? "'"
      end
    rescue EOFError
    end
    f.close
  }

  return [piority, buff.compact.uniq]
end


def normalizeVer3 input_file, output_file
   buff = []
  candidate = nil
  
  File.open(input_file, "r"){ |f|
    begin
      while line = f.readline.encode!("UTF-8", "binary", invalid: :replace, undef: :replace, :replace => '?')
        if candidate
          buff.concat(candidate) if line.include? "n."
          candidate = nil
        #elsif line =~ /\A[A-Z]+[ ;]*[A-Z]+\z/
        elsif line =~ /[a-z]|\.|-|'/
          next
        elsif line =~ /\A[A-Z]+\b/
          candidate = line.split(";").map { |w| w.strip }
          puts candidate
        end
      end
    rescue EOFError
    end
    f.close
  }
  
  # create folder
  dir = "#{File.dirname(input_file)}/#{output_file}"
  FileUtils.mkdir_p(dir)
  puts buff.size
  buff.compact.group_by {|w| 
    w.size 
  }.each {|count, ary| 
    File.open("#{dir}/#{(65).chr}_#{count.to_s}.txt", "w+") { |fos|    
      ary.sort.each {|w| fos.write("#{w}\n") }
      fos.close
    }
  }

end

def normalizeVer2 input_file, output_file
  
  replace_list = [/-> \[\w+\]/, '+']
  remove_list = [/-----\w*/]
  buff1 = [] # std word
  buff2 = [] # varient of word

  File.open(input_file, "r"){ |f|
    begin
      while line = f.readline
        # check useless line, such as comment
        next if remove_list.any? { |re| line =~ re }
        buff = line[0] == ' ' ? buff2 : buff1

        # remove unwanted symbol
        replace_list.each{ |re| line.gsub!(re,'') }

        # several words in one line
        # clear space & write to file
        buff.concat(line.split(',').map{ |w| w.strip! })
      end
    rescue EOFError
    end
    f.close
  }
  
  # create folder
  dir = "#{File.dirname(input_file)}/#{output_file}"
  FileUtils.mkdir_p(dir)
  idx = 65
  [buff1, buff2].each { |buff|
    # save to different file according to word length
    buff.compact.group_by {|w| 
      w.size 
    }.each {|count, ary| 
      File.open("#{dir}/#{(idx).chr}_#{count.to_s}.txt", "w+") { |fos|    
        ary.sort.each {|w| fos.write("#{w}\n") }
        fos.close
      }
    }
    idx += 1
  }

end

def normalizeVER1 input_file, output_file
  fos = File.open(output_file, "w+")
  replace_list = [/-> \[\w+\]/, '+']
  remove_list = [/-----\w*/]

  File.open(input_file, "r"){ |f|
    begin
      while line = f.readline
        # check useless line, such as comment
        next if remove_list.any? { |re| line =~ re }

        # remove unwanted symbol
        replace_list.each{ |re| line.gsub!(re,'') }

        # several words in one line
        line.split(',').each{ |w|
          # clear space & write to file
          fos.write("#{w}\n") if w.strip!
        }
      end
    rescue EOFError
    end
    f.close
  }
  fos.close
end


#normalize_2 "2+2gfreq.txt", db
#normailize_3
#normalize db
testt db
#dreye_tran("mobile")
#find input1, input2, db, output
#puts google_tran('rumen')
#puts google_tran('brose')
#puts google_tran('mobile')
