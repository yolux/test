# encoding: utf-8
require 'nokogiri'
require 'open-uri'
require 'fileutils'

=begin
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

Api1MultiGetRecordFolderBasic
Api1AddSystemRankingAll
Api1RemoveSystemRankingAll
Api1GetSystemRankingAll
Api1Common
Api1AddRecordBasic
Api1GetUserRecordPublish
Api1MultiGetRecordBasic
Api1MultiGetUserBasic
Api1AddUserBasic
Api1UpdateUserBasic
Api1GetUserBasic
Api1GetUserFriend
Api1GetUserFans
Api1GetUserIdol
Api1GetUserFriendByName
Api1GetUserRecordFolder
Api1GetUserRecordFolderCollect
Api1AddRecordFolderCollect
Api1RemoveRecordFolderCollect
Api1RemoveRecordFolderCollectByUserId
Api1GetRecordFolderCollectByUserId
Api1GetRecordFolderBasic
Api1GetRecordFolderRecommendByUserId
Api1GetRecordFolderShareByUserId
Api1AddRecordFolderBasic
Api1AddRecordFolderRecord
Api1UpdateRecordFolderBasic
Api1AddRecordFolderReportedByUserId
Api1GetRecordFolderRecord
Api1GetRecordFolderRecordByTheTimestamp
Api1RemoveRecordFolderRecord
Api1GetRecordFolderReply
Api1AddRecordFolderReply
Api1RemoveRecordFolderReply
Api1GetSystemFlowPosteeLatestId
Api1GetUserPhotoFolder
Api1MultiGetPhotoFolderBasic
Api1GetPhotoFolderBasic
Api1GetPhotoFolderRecommendByUserId
Api1MultiGetPhotoFolderRecommendByUserId
Api1GetPhotoFolderShareByUserId
Api1AddPhotoFolderBasic
Api1AddPhotoBasic
Api1AddPhotoFolderPhoto
Api1GetPhotoFolderPhoto
Api1UpdatePhotoBasic
Api1UpdatePhotoFolderBasic
Api1RemovePhotoFolderPhoto
Api1MultiGetPhotoBasic
Api1GetPhotoBasic
Api1GetPhotoFolderReply
Api1AddPhotoFolderReply
Api1RemovePhotoFolderReply
Api1RecursiveGetSystemFlowPostee
Api1MultiGetPoolContentBasic
Api1MultiGetCountArtistSong
Api1MultiGetArtistBasic
Api1GetArtistSong
Api1MultiGetSongBasic
Api1GetSongBasic
Api1GetUserRecordTemporary
Api1UpdateRecordBasic
Api1GetUserRecordVideo
Api1GetUserPhoto
Api1GetUserFlowPostee
Api1GetUserUpdate
Api1MultiGetPoolContentReply
Api1GetPoolContentReply
Api1AddUserSongToSing
Api1GetUserSongToSing
Api1GetCountUserSongToSing
Api1RemoveUserSongToSing
Api1GetChannelRecommendByUserId
Api1GetChannelShareByUserId
Api1GetRecordVideoAll
Api1GetRecordVideoAllLatestId
Api1MultiGetRecordVideoAll
Api1GetRecordBasic
Api1AddRecordRecommend
Api1AddVideoUploadRecommend
Api1AddRecordFolderRecommend
Api1AddPhotoFolderRecommend
Api1AddChannelRecommend
Api1AddRecordShare
Api1AddVideoUploadShare
Api1AddRecordFolderShare
Api1AddPhotoFolderShare
Api1AddChannelShare
Api1GetPoolContentBasic
Api1AddPoolContentReply
Api1RemovePoolContentReply
Api1GetUserFriendToAcceptByTheTimestamp
Api1GetUserFriendToBeByTheTimestamp
Api1GetUserFriendByTheTimestamp
Api1GetUserFansByTheTimestamp
Api1GetUserIdolByTheTimestamp
Api1GetUserBlockByTheTimestamp
Api1GetUserFriendToAccept
Api1GetUserFriendToBe
Api1GetUserBlock
Api1AddUserFriendToBe
Api1AddUserFriend
Api1AddUserIdol
Api1AddUserBlock
Api1RemoveUserBlock
Api1RemoveUserIdol
Api1RemoveUserFans
Api1RemoveUserFriend
Api1RemoveUserFriendToAccept
Api1RemoveUserFriendToBe
Api1GetUserFlowReply
Api1RemoveUserUpdate
Api1RemoveUserFlowPostee
Api1GetFlowReply
Api1AddFlowReply
Api1RemoveFlowReply
Api1AddFlowBasic
Api1GetFlowBasic
Api1UpdateFlowBasic
Api1MultiGetUserRecordPublish
Api1MultiGetUserVideoUploadPublish
Api1MultiGetUserPhotoFolder
Api1MultiGetUserRecordFolder
Api1MultiGetUserRecordVideo
Api1GetSongRecord
Api1GetRecordRecommend
Api1GetRecordRecommendByUserId
Api1GetRecordShare
Api1GetRecordShareByUserId
Api1RecursiveGetRecordVideoAll
Api1RecursiveGetRecordAll
Api1AddVideoUploadBasic
Api1GetVideoUploadBasic
Api1UpdateVideoUploadBasic
Api1GetUserVideoUploadPublish
Api1GetUserVideoUpload
Api1GetUserVideoUploadTemporary
Api1GetVideoUploadRecommendByUserId
Api1GetVideoUploadShareByUserId
Api1GetSearchArtist
Api1GetSearchSong
Api1GetSearchUser
Api1GetSearchRecord
Api1GetSearchVideoUpload
Api1GetAutoCompleteArtist
Api1GetAutoCompleteSong
Api1GetAutoCompleteUser
Api1GetAutoCompleteRecord
Api1GetAutoCompleteVideoUpload
Api1MultiGetVideoUploadBasic
Api1GetUserMessagePostee
Api1GetCountUserMessagePostee
Api1GetMessageAll
Api1GetCountMessageAll
Api1AddMessageBasic
Api1AddMessageAll
Api1RemoveMessageAll
Api1AddMessageBasicWithMessageAll
Api1UnserializeKeyMessageAll
Api1GetUserNotificationPostee
Api1GetUserChorusPostee
Api1GetUserSocialPostee
Api1GetCountUserNotificationPostee
Api1GetCountUserChorusPostee
Api1GetCountUserSocialPostee
Api1GetCountUserMessagePosteeNoSender
Api1GetUserSponsoredByTheTimestamp
Api1AddUserSponsorByTheTimestamp
Api1GetSystemConfig
Api1AddSystemConfig
Api1AddSongSeen
Api1GetCountSongSeenHomeboxOne
Api1GetCountSongSeenMobileAndroid
Api1GetCountSongSeenMobileIos
Api1GetCountSongSeenWeb
Api1GetCountSongSeenSmarttvLg
Api1GetCountSongSeenSmarttvSamsung
Api1GetCountSongSingHomeboxOne
Api1GetCountSongSingMobileAndroid
Api1GetCountSongSingMobileIos
Api1GetCountSongSingWeb
Api1GetCountSongSingSmarttvLg
Api1GetCountSongSingSmarttvSamsung
Api1MultiGetCountSongSeenHomeboxOne
Api1MultiGetCountSongSeenMobileAndroid
Api1MultiGetCountSongSeenMobileIos
Api1MultiGetCountSongSeenWeb
Api1MultiGetCountSongSeenSmarttvLg
Api1MultiGetCountSongSeenSmarttvSamsung
Api1MultiGetCountSongSingHomeboxOne
Api1MultiGetCountSongSingMobileAndroid
Api1MultiGetCountSongSingMobileIos
Api1MultiGetCountSongSingWeb
Api1MultiGetCountSongSingSmarttvLg
Api1MultiGetCountSongSingSmarttvSamsung
Api1AddSongBasic
Api1UpdateSongBasic
Api1AddArtistBasic
Api1UpdateArtistBasic
Api1GetRecordAll
Api1GetRecordPublishAll
Api1GetRecordAllLatestId
Api1GetRecordPublishAllLatestId
Api1RecursiveGetRecordPublishAll
Api1GetVideoUploadPublishAll
Api1GetVideoUploadPublishAllLatestId
Api1RecursiveGetVideoUploadPublishAll
Api1GetPhotoFolderAllLatestId
Api1RecursiveGetPhotoFolderAll
Api1GetUserAll
Api1GetUserAllLatestId
Api1RecursiveGetUserAll
Api1MultiGetRecordVideoBasic
Api1MultiGetCountRecordReply
Api1MultiGetCountRecordSeen
Api1MultiGetRecordReply
Api1SerializeColumnNameRecordReply
Api1RecursiveGetVideoUploadAll
Api1GetVideoUploadAllLatestId
Api1RecursiveGetPhotoAll
Api1GetPhotoAllLatestId
Api1MultiGetCountVideoUploadReply
Api1MultiGetCountVideoUploadSeen
Api1MultiGetCountUserSeen
Api1MultiGetCountUserFansByTheTimestamp
Api1MultiGetCountUserFriendByTheTimestamp
Api1RecursiveGetFlowAll
Api1GetFlowAllLatestId


def remove_useless_thrift target_file, target_path
  File.open(target_file, "r:utf-8") do |fr|
    log = []
    cmd = "mkdir #{target_path}/keep"
    log << `#{cmd}`

    fr.readlines.map(&:strip).each do |line|
      next if line.empty?
      cmd = "cp #{target_path}/#{line}.* #{target_path}/keep/"
      log << `#{cmd}`
    end

    p log
  end

end

remove_useless_thrift('/home/yolux/Downloads/RP.txt', '/home/yolux/work/ikala_web_mobile30_backend/lib/no_sql_root/thrift_core/bin')


def find_rb path, white_list, output
  # =====================  rb files =========================
  Dir["#{path}*.rb"].each do |file|
    File.open(file, "r:utf-8") do |f|
      candidate = f.read.scan(/require '(Api1\w+)'/).flatten
      output[:candidate].concat candidate
      missing = candidate.delete_if {|x| white_list.include? x}
      output[:missing] << [file, missing] unless missing.empty?
    end
  end
  # ===================== folders =========================
  Dir["#{path}*/"].each do |folder|
    find_rb folder, white_list, output
  end
end

def find_missing_require_rb_file keep_list_file_path, target_search_path
  white_list = []
  File.open(keep_list_file_path, "r:utf-8") do |fr|
    white_list.concat fr.readlines.map(&:strip).delete_if(&:empty?)
    p white_list.size
  end
  output = {:candidate => [], :missing => []}
  find_rb target_search_path, white_list, output

  p output[:candidate].size
  p output[:missing].size
  output[:missing].each do |item|
    p item[0]
    p item[1]
    p '---------------------'
  end
end

find_missing_require_rb_file('/home/yolux/Downloads/RP.txt', '/home/yolux/work/ikala_web_mobile30_backend/app')



def replaceit log_file

  #test_pattern = /AJAX_|API_WEB/  
  test_pattern = /\$NoSQL\['API2_FLOW_INFO_DIR'/  
  
  File.open(log_file, "r:utf-8") do |fr|
    fr.readlines.each do |x|
      next if x.strip.empty?
      p x

      newfile_name = "/home/yolux/work/kill/cached-copy/lib/no_sql_root/#{x.split(':')[0]}"
      newfile = []
      File.open(newfile_name, "r:utf-8") do |fr2|
        fr2.readlines.each do |line|
          if line.strip.start_with?('/*', '*') || line.index(/\['API2_FLOW_INFO_DIR'\]/ ) || !line.index(test_pattern) 
            newfile << line
          else
            newfile << "#{line.chomp}]\n"
            p 'hit'
          end
        end
      end    

      if newfile.size > 0
       File.open(newfile_name, "w+") do |f2|
         f2.write newfile.join("")
       end
      else
       p "!!!!!!!!!!!!!!!!!!!!!!!!! error !!!!!!!!!!!!!!!!!!!!!!"
      end
          
    end
  end

end

replaceit('/home/yolux/fuckyouuuuuu.txt')



File.open("/home/yolux/work/kill/cached-copy/script/script_print/x_func_to_kill2.txt", "r:utf-8") do |fr|
  
  out_grep = "/home/yolux/work/kill/cached-copy/script/script_print/x_func_to_kill2grep_ex.log"
  fr.readlines.each_with_index do |x, i| 
    next if x.strip.empty?
    s = x.sub('/home/yolux/work/kill/cached-copy/script/../lib/no_sql_root/src/', '').chomp
    str_array = s.split('/')
    str_array.shift
    include_str = "include_once('#{str_array.join('/')}');"
    # "include_once('Artist\/ArtistBasic\/GetArtistBasic.php');"
        include_str = include_str.gsub('/','\/')
    #puts include_str
    cmd = "grep -r -n \"#{include_str}\" /home/yolux/work/kill/cached-copy/lib/no_sql_root/src >> #{out_grep}"
    puts "#{i}:#{cmd}"
    `#{cmd}` 
  end
end


  File.open("/home/yolux/work/kill/cached-copy/script/script_print/x_func_to_kill2grep_ex.log", "r:utf-8") do |fr|
    fr.readlines.each do |x|
      next if x.strip.empty?
      next if x.index '/*'


      sep = x.strip.split(':')
      phpfile = sep[0]

      next if !File.exists?(phpfile)

      line_num = sep[1].to_i
      orig_str = sep[-1]
      new_str = orig_str.sub(/include_once/,'/* #yx2# include_once').sub(/;/, '; */')
      replace_str =  Regexp.new orig_str.gsub(/\?/,'\?').gsub(/\(/,'\(').gsub(/\)/,'\)').gsub(/\//,'\/').gsub(/\./,'\.')
      p [phpfile, orig_str, new_str, replace_str]

      newfile = []
      File.open(phpfile, "r:utf-8") do |fr2|
        fr2.readlines.each_with_index do |line, line_i|
          if line.index '/*'
            newfile << line
          elsif line.index(replace_str) and line_i+1 == line_num
            newfile << line.sub(replace_str, new_str)
            p 'hit'
          elsif line.index(replace_str) and line_i+1 != line_num
            newfile << line
            p 'hit but line is not correct'
          else
            newfile << line
          end
        end
      end    

      if newfile.size > 0
        File.open(phpfile, "w+") do |f2|
          f2.write newfile.join("")
        end
      else
        p "!!!!!!!!!!!!!!!!!!!!!!!!! error !!!!!!!!!!!!!!!!!!!!!!"
      end

    end
  end



## grep

ROOT = '/home/yolux/work/branch_test2/lib/no_sql_root'
GREP_FILE_NAME = '/home/yolux/summary_chorus_grep.log'
SUMMARY_FILE_NAME = "/home/yolux/summary_chorus.log"
BLACK_LIST = ['//', '/*', '*', '<?php /*']
RECURSIVE_INCLUDE_FILE = true
RECURSIVE_FUNCTION_CALL_FILE = false

def find_func_info list, funcs, params, includes, const_files, tmp
  greps1, greps2, greps3, greps4 = tmp
  new_list = []
  list.each_with_index do |file, file_i|
    new_includes = []
    new_params = []
    new_funcs = []
    is_constant_file = File.basename(file).downcase.index('constant')
    p "this is constant file : #{file}" if is_constant_file

    File.open(file, "r:utf-8") do |fr|
      fr.readlines.each do |line|
        line.strip!
        next if line.start_with?(*BLACK_LIST)
        new_includes.concat line.scan(/include_once\((\S*)\);/).flatten
        new_params.concat line.scan(/\$NoSQL\[(\S*[^\]])\]/).flatten
        new_funcs.concat line.scan(/([A-Z]+[a-zA-Z0-9_]+)\(/).flatten
      end
    end # each line in file

    new_includes.uniq!
    new_params.uniq!
    new_funcs.uniq!
    includes.concat new_includes
    params.concat new_params
    funcs.concat new_funcs
    const_files << file if is_constant_file

    cur_i = 0
    total_i = new_includes.size + new_params.size + new_funcs.size
 
    new_funcs.each do |x|
      cur_i = cur_i + 1
      next if greps1.include? x
      greps1 << x

      `echo ===X funcs:#{x} X=== >> #{GREP_FILE_NAME}` 
      cmd = "grep -r -n 'function #{x}(' #{ROOT} >> #{GREP_FILE_NAME}"
      puts "#{file_i+1}/#{list.size}:#{cur_i}/#{total_i}:#{cmd}"
      `#{cmd}`

      # recursive find the defination of call function
      `grep -r -n 'function #{x}(' #{ROOT}`.split("\n").each do |y|
        if php_file = y.split(':')[0]
          new_list << php_file if (php_file.include?(ROOT)) and !(File.basename(php_file).start_with?('Api1'))
        end
      end if RECURSIVE_FUNCTION_CALL_FILE
    end 

    new_params.each do |x|
      cur_i = cur_i + 1
      next if greps2.include? x
      greps2 << x

      `echo ===X params:#{x} X=== >> #{GREP_FILE_NAME}` 
      cmd = "grep -r -n '\\$NoSQL\\[\\S#{x[1..-2]}\\S\\] =' #{ROOT} >> #{GREP_FILE_NAME}"
      puts "#{file_i+1}/#{list.size}:#{cur_i}/#{total_i}:#{cmd}"
      `#{cmd}` 
    end unless is_constant_file

    new_includes.each do |x|
      cur_i = cur_i + 1
      next if greps3.include? x
      greps3 << x

      `echo ===X includes:#{x} X=== >> #{GREP_FILE_NAME}` 
      fname = x[1..-2]
      pattern = fname.split('/')[-1] || fname
      cmd = "find #{ROOT} -name #{pattern} | grep #{fname.gsub('/','\/')} >> #{GREP_FILE_NAME}"
      puts "#{file_i+1}/#{list.size}:#{cur_i}/#{total_i}:#{cmd}"
      `#{cmd}` 

      # recursive find the defination of include file
      `find #{ROOT} -name #{pattern} | grep #{fname.gsub('/','\/')}`.split("\n").each do |y|
        new_list << y if !(File.basename(y).start_with?('Api1'))
      end if RECURSIVE_INCLUDE_FILE
    end

  end # each file

  new_list = new_list - greps4
  greps4.concat new_list
  puts new_list.size
  `echo ===X new_list X=== >> #{GREP_FILE_NAME}` 
  new_list.each {|x| `echo #{x} >> #{GREP_FILE_NAME}`}
  find_func_info(new_list, funcs, params, includes, const_files, tmp) if new_list.size > 0

end

def go
  init_list = ['/home/yolux/work/branch_test2/lib/no_sql_root/src/api-web/ajax/php/Record/NewRecordTwoAjax.php',
  '/home/yolux/work/branch_test2/lib/no_sql_root/src/api-web/ajax/php/Record/UpdateRecordTwoAjax.php',
  '/home/yolux/work/branch_test2/lib/no_sql_root/src/api-web/ajax/php/Record/GetRecordChorusAllListTwoAjax.php',
  '/home/yolux/work/branch_test2/lib/no_sql_root/src/api-web/ajax/php/User/GetUserChorusInitiateListTwoAjax.php',
  '/home/yolux/work/branch_test2/lib/no_sql_root/src/api-web/ajax/php/User/GetUserChorusToFollowListTwoAjax.php',
  '/home/yolux/work/branch_test2/lib/no_sql_root/src/api-web/ajax/php/User/GetUserChorusToPublishListTwoAjax.php',
  '/home/yolux/work/branch_test2/lib/no_sql_root/src/api-web/ajax/php/User/GetUserChorusInvitePosteeListTwoAjax.php'
  ]
  
  funcs = []
  params = []
  includes = []
  const_files = []

  `rm #{GREP_FILE_NAME}`
  find_func_info init_list, funcs, params, includes, const_files, [[],[],[],[]]

  File.open(SUMMARY_FILE_NAME, "w+") do |fw|
    output = []
    {:funcs => funcs, :params => params, :includes => includes, :const_files => const_files}.each do |k,v|
      output << "=== #{k.to_s} #{'='*45}"
      output.concat v.uniq.sort
    end
    output << ""
    fw.write output.join("\n")
  end
end

# start
# GREP_FILE_NAME = '/home/yolux/summary_chorus_grep.log'
# SUMMARY_FILE_NAME = "/home/yolux/summary_chorus.log"
# RECURSIVE_INCLUDE_FILE = false
# RECURSIVE_FUNCTION_CALL_FILE = false
# go()

GREP_FILE_NAME = '/home/yolux/summary_chorus_grepA.log'
SUMMARY_FILE_NAME = "/home/yolux/summary_chorusA.log"
RECURSIVE_INCLUDE_FILE = true
RECURSIVE_FUNCTION_CALL_FILE = false
go()

GREP_FILE_NAME = '/home/yolux/summary_chorus_grepB.log'
SUMMARY_FILE_NAME = "/home/yolux/summary_chorusB.log"
RECURSIVE_INCLUDE_FILE = false
RECURSIVE_FUNCTION_CALL_FILE = true
go()





def go
  white_list = ['===X includes:']
  black_list = ['===X params:', '===X funcs:','===X new_list X===']
  branch_path = '/home/yolux/work/branch_test2/lib/no_sql_root/'
  master_path = '/home/yolux/work/ikala_web_mobile30_backend/lib/no_sql_root/'
  file_to_copy_list = []
  #['/home/yolux/summary_chorus_grepA.log', '/home/yolux/summary_chorus_grepB.log'].each do |x|
  ['/home/yolux/summary_chorus_grepA.log'].each do |x|
    p x
    result = []
    hash = {}
    hash_key = ''

    File.open(x, "r:utf-8") do |f|
      add = false
      f.readlines.each do |line|
        if line.start_with? *white_list
          #add = true 
          hash_key = line.sub('===X includes:', "'").sub(" X===\n", "'")
          hash[hash_key] = []
          next
        elsif line.start_with? *black_list
          #add = false
          hash_key = ''
          next
        end 
        #result << line if add
        hash[hash_key] = hash[hash_key] << line.chomp unless hash_key == ''
      end
    end

    #File.open("#{x}_ext_include.log", "w+") do |f|
      #f.write result.join('')
    #end

    # File.open("#{x}_ext_include.log", "w+") do |f|
    #   hash.each do |k,v|
    #     result << k
    #     result << v.to_s
    #   end
    #   f.write result.join("\n")
    # end

    file_to_copy = hash.values.flatten.uniq.sort
    file_to_copy_list << file_to_copy
    # File.open("#{x}_ext_include.log", "w+") do |f|
    #   f.write file_to_copy.join("\n")
    # end
    
    to_add = []
    to_modify = []
    to_ignore = []
    file_to_copy.each do |f|
      f.chomp!
      orig_file = f.sub(branch_path, master_path)
      if File.exists?(orig_file)
        if FileUtils.cmp(orig_file, f)
          to_ignore << f
        else
          to_modify << f
        end
      else
        to_add << f
      end
    end

    p "ignore:#{to_ignore.size}, add:#{to_add.size}, modify:#{to_modify.size}"
    File.open("#{x}_file_to_add.log", "w+") {|f| f.write to_add.join("\n")}
    File.open("#{x}_file_to_modify.log", "w+") {|f| f.write to_modify.join("\n")}

  end

  # diff = file_to_copy_list[1] - file_to_copy_list[0]
  # p diff.size
  # p diff
  
end

go()

=end

File.open('/home/yolux/summary_chorus_grepA.log_file_to_add.log', "r:utf-8") do |f|
  f.readlines.each do |line|
    line.strip!
    next if line.empty?
    new_line = line.sub('/home/yolux/work/branch_test2/lib/no_sql_root/src','/home/yolux/compare')
    FileUtils.mkdir_p File.dirname(new_line)
    FileUtils.cp line, new_line
  end
  
end