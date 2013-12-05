# encoding: utf-8
require 'nokogiri'
require 'open-uri'
require 'fileutils'
HOME_PATH = File.expand_path '.'
RUN_API_TABLE = ['MultiGetRecordFolderBasic',
'AddSystemRankingAll',
'RemoveSystemRankingAll',
'GetSystemRankingAll',
'Common',
'AddRecordBasic',
'GetUserRecordPublish',
'MultiGetRecordBasic',
'MultiGetUserBasic',
'AddUserBasic',
'UpdateUserBasic',
'GetUserBasic',
'GetUserFriend',
'GetUserFans',
'GetUserIdol',
'GetUserFriendByName',
'GetUserRecordFolder',
'GetUserRecordFolderCollect',
'AddRecordFolderCollect',
'RemoveRecordFolderCollect',
'RemoveRecordFolderCollectByUserId',
'GetRecordFolderCollectByUserId',
'GetRecordFolderBasic',
'GetRecordFolderRecommendByUserId',
'GetRecordFolderShareByUserId',
'AddRecordFolderBasic',
'AddRecordFolderRecord',
'UpdateRecordFolderBasic',
'AddRecordFolderReportedByUserId',
'GetRecordFolderRecord',
'GetRecordFolderRecordByTheTimestamp',
'RemoveRecordFolderRecord',
'GetRecordFolderReply',
'AddRecordFolderReply',
'RemoveRecordFolderReply',
'GetSystemFlowPosteeLatestId',
'GetUserPhotoFolder',
'MultiGetPhotoFolderBasic',
'GetPhotoFolderBasic',
'GetPhotoFolderRecommendByUserId',
'MultiGetPhotoFolderRecommendByUserId',
'GetPhotoFolderShareByUserId',
'AddPhotoFolderBasic',
'AddPhotoBasic',
'AddPhotoFolderPhoto',
'GetPhotoFolderPhoto',
'UpdatePhotoBasic',
'UpdatePhotoFolderBasic',
'RemovePhotoFolderPhoto',
'MultiGetPhotoBasic',
'GetPhotoBasic',
'GetPhotoFolderReply',
'AddPhotoFolderReply',
'RemovePhotoFolderReply',
'RecursiveGetSystemFlowPostee',
'MultiGetPoolContentBasic',
'MultiGetCountArtistSong',
'MultiGetArtistBasic',
'GetArtistSong',
'MultiGetSongBasic',
'GetSongBasic',
'GetUserRecordTemporary',
'UpdateRecordBasic',
'GetUserRecordVideo',
'GetUserPhoto',
'GetUserFlowPostee',
'GetUserUpdate',
'MultiGetPoolContentReply',
'GetPoolContentReply',
'AddUserSongToSing',
'GetUserSongToSing',
'GetCountUserSongToSing',
'RemoveUserSongToSing',
'GetChannelRecommendByUserId',
'GetChannelShareByUserId',
'GetRecordVideoAll',
'GetRecordVideoAllLatestId',
'MultiGetRecordVideoAll',
'GetRecordBasic',
'AddRecordRecommend',
'AddVideoUploadRecommend',
'AddRecordFolderRecommend',
'AddPhotoFolderRecommend',
'AddChannelRecommend',
'AddRecordShare',
'AddVideoUploadShare',
'AddRecordFolderShare',
'AddPhotoFolderShare',
'AddChannelShare',
'GetPoolContentBasic',
'AddPoolContentReply',
'RemovePoolContentReply',
'GetUserFriendToAcceptByTheTimestamp',
'GetUserFriendToBeByTheTimestamp',
'GetUserFriendByTheTimestamp',
'GetUserFansByTheTimestamp',
'GetUserIdolByTheTimestamp',
'GetUserBlockByTheTimestamp',
'GetUserFriendToAccept',
'GetUserFriendToBe',
'GetUserBlock',
'AddUserFriendToBe',
'AddUserFriend',
'AddUserIdol',
'AddUserBlock',
'RemoveUserBlock',
'RemoveUserIdol',
'RemoveUserFans',
'RemoveUserFriend',
'RemoveUserFriendToAccept',
'RemoveUserFriendToBe',
'GetUserFlowReply',
'RemoveUserUpdate',
'RemoveUserFlowPostee',
'GetFlowReply',
'AddFlowReply',
'RemoveFlowReply',
'AddFlowBasic',
'GetFlowBasic',
'UpdateFlowBasic',
'MultiGetUserRecordPublish',
'MultiGetUserVideoUploadPublish',
'MultiGetUserPhotoFolder',
'MultiGetUserRecordFolder',
'MultiGetUserRecordVideo',
'GetSongRecord',
'GetRecordRecommend',
'GetRecordRecommendByUserId',
'GetRecordShare',
'GetRecordShareByUserId',
'RecursiveGetRecordVideoAll',
'RecursiveGetRecordAll',
'AddVideoUploadBasic',
'GetVideoUploadBasic',
'UpdateVideoUploadBasic',
'GetUserVideoUploadPublish',
'GetUserVideoUpload',
'GetUserVideoUploadTemporary',
'GetVideoUploadRecommendByUserId',
'GetVideoUploadShareByUserId',
'GetSearchArtist',
'GetSearchSong',
'GetSearchUser',
'GetSearchRecord',
'GetSearchVideoUpload',
'GetAutoCompleteArtist',
'GetAutoCompleteSong',
'GetAutoCompleteUser',
'GetAutoCompleteRecord',
'GetAutoCompleteVideoUpload',
'MultiGetVideoUploadBasic',
'GetUserMessagePostee',
'GetCountUserMessagePostee',
'GetMessageAll',
'GetCountMessageAll',
'AddMessageBasic',
'AddMessageAll',
'RemoveMessageAll',
'AddMessageBasicWithMessageAll',
'UnserializeKeyMessageAll',
'GetUserNotificationPostee',
'GetUserChorusPostee',
'GetUserSocialPostee',
'GetCountUserNotificationPostee',
'GetCountUserChorusPostee',
'GetCountUserSocialPostee',
'GetCountUserMessagePosteeNoSender',
'GetUserSponsoredByTheTimestamp',
'AddUserSponsorByTheTimestamp',
'GetSystemConfig',
'AddSystemConfig',
'AddSongSeen',
'GetCountSongSeenHomeboxOne',
'GetCountSongSeenMobileAndroid',
'GetCountSongSeenMobileIos',
'GetCountSongSeenWeb',
'GetCountSongSeenSmarttvLg',
'GetCountSongSeenSmarttvSamsung',
'GetCountSongSingHomeboxOne',
'GetCountSongSingMobileAndroid',
'GetCountSongSingMobileIos',
'GetCountSongSingWeb',
'GetCountSongSingSmarttvLg',
'GetCountSongSingSmarttvSamsung',
'MultiGetCountSongSeenHomeboxOne',
'MultiGetCountSongSeenMobileAndroid',
'MultiGetCountSongSeenMobileIos',
'MultiGetCountSongSeenWeb',
'MultiGetCountSongSeenSmarttvLg',
'MultiGetCountSongSeenSmarttvSamsung',
'MultiGetCountSongSingHomeboxOne',
'MultiGetCountSongSingMobileAndroid',
'MultiGetCountSongSingMobileIos',
'MultiGetCountSongSingWeb',
'MultiGetCountSongSingSmarttvLg',
'MultiGetCountSongSingSmarttvSamsung',
'AddSongBasic',
'UpdateSongBasic',
'AddArtistBasic',
'UpdateArtistBasic',
'GetRecordAll',
'GetRecordPublishAll',
'GetRecordAllLatestId',
'GetRecordPublishAllLatestId',
'RecursiveGetRecordPublishAll',
'GetVideoUploadPublishAll',
'GetVideoUploadPublishAllLatestId',
'RecursiveGetVideoUploadPublishAll',
'GetPhotoFolderAllLatestId',
'RecursiveGetPhotoFolderAll',
'GetUserAll',
'GetUserAllLatestId',
'RecursiveGetUserAll',
'MultiGetRecordVideoBasic',
'MultiGetCountRecordReply',
'MultiGetCountRecordSeen',
'MultiGetRecordReply',
'SerializeColumnNameRecordReply',
'RecursiveGetVideoUploadAll',
'GetVideoUploadAllLatestId',
'RecursiveGetPhotoAll',
'GetPhotoAllLatestId',
'MultiGetCountVideoUploadReply',
'MultiGetCountVideoUploadSeen',
'MultiGetCountUserSeen',
'MultiGetCountUserFansByTheTimestamp',
'MultiGetCountUserFriendByTheTimestamp',
'RecursiveGetFlowAll',
'GetFlowAllLatestId']


def find_unused_php
  path = "#{HOME_PATH}/../lib/no_sql_root/"
  total_cf_list = []
  parse_result = {}
  f_write = []
  issue = {:no_func_name => [], :key_exist => [], :call_before_function => []}

  # read cache data if exist ==============================================
  cache_file = "#{HOME_PATH}/script_print/xphpsrc.cache"
  cache_issue_file = "#{HOME_PATH}/script_print/xphpsrc_issue.cache"
  puts "read *.php in source code"
  if File.exist? cache_file
    puts "read cache ..."
    parse_result = Marshal.load File.read(cache_file)
    issue = Marshal.load File.read(cache_issue_file)
  else
    # parse php file in source code =====================================================
    check_php path, parse_result, issue
    # save to cache *****
    serialized_array = Marshal.dump(parse_result)
    File.open(cache_file, 'w') {|f| f.write(serialized_array) }
    serialized_array = Marshal.dump(issue)
    File.open(cache_issue_file, 'w') {|f| f.write(serialized_array) }
  end

  puts "generate x_funcs.txt"
  File.open("#{HOME_PATH}/script_print/x_funcs.txt", "w+") do |f|
    f.write parse_result.map {|k,v| "#{k}\r\n#{v.to_s}\r\n" }.join("\r\n")
    f.write "Total: #{parse_result.size}"
  end  

  ext_func_table = {}
  parse_result.values.each do |x|
    x.each do |k,v|
      if ext_func_table.key? k
        ext_func_table[k].concat v
      else
        ext_func_table[k] = v
      end
    end
  end

  all_runl1_funcs = []
  RUN_API_TABLE.each do |x|
    check_runl1 ext_func_table, all_runl1_funcs, x
  end
  
  puts "generate x_funcs_runl1.txt"
  File.open("#{HOME_PATH}/script_print/x_funcs_runl1.txt", "w+") do |f|
    f.write all_runl1_funcs.join("\r\n")
    f.write "Total: #{all_runl1_funcs.size}"
  end   

  to_kill = []
  tmp_list = []
  parse_result.each do |k,v| 
    num = v.size
    funcs = v.keys
    left_funcs = funcs - all_runl1_funcs
    
    case left_funcs.size
    when 0
      # all func is used by runl1
    when num
      # no func is used by runl1
      to_kill << [1, k, left_funcs]
      tmp_list << k
    else
      # partial func is used by runl1
      to_kill << [9, k, left_funcs]
    end
  end

  puts "generate x_func_to_kill.txt"
  File.open("#{HOME_PATH}/script_print/x_func_to_kill.txt", "w+") do |f|
    f.write to_kill.sort.map{|x| "#{x[0].to_s}\r\n#{x[1].to_s}\r\n#{x[2].to_s}\r\n"}.join("\r\n")
    f.write "Total: #{to_kill.size}"
  end  

  handle_folder = /\/src\/api-core\/|\/src\/api\/|\/src\/api2\/|\/src\/api2-core\//
  tmp_list.select!{|x| x.index(handle_folder)}

  puts "generate x_func_to_kill2.txt"
  File.open("#{HOME_PATH}/script_print/x_func_to_kill2.txt", "w+") do |f|
    f.write tmp_list.join("\r\n")
    f.write "Total: #{tmp_list.size}"
  end  

  puts "generate x_func_to_kill_file.sh"
  File.open("#{HOME_PATH}/script_print/x_func_to_kill_file.sh", "w+") do |f|
    f.write tmp_list.map{|x| "echo `rm #{x}`"}.join("\r\n")
    f.write "\r\n"
  end  

  puts "generate x_func_to_kill2grep.log"
  out_grep = "#{HOME_PATH}/script_print/x_func_to_kill2grep.log"
  tmp_list.each_with_index do |x, i| 
    cmd = "grep -r -n 'include\\S*#{x.split('/')[-1]}' #{path}src >> #{out_grep}"
    puts "#{i}:#{cmd}"
    `#{cmd}` 
  end

  puts "generate remvoe_include_killed_php.log"
  File.open(out_grep, "r:utf-8") do |fr|
    fr.readlines.each do |x|
      next if x.strip.empty?
      next if x.index '/*'

      sep = x.strip.split(':')
      phpfile = sep[0]
      orig_str = sep[-1]
      new_str = orig_str.sub(/include_once/,'/* include_once').sub(/;/, '; */')
      replace_str =  Regexp.new orig_str.gsub(/\?/,'\?').gsub(/\(/,'\(').gsub(/\)/,'\)').gsub(/\//,'\/').gsub(/\./,'\.')
      p [phpfile, orig_str, new_str, replace_str]

      # really to modify them in below code
      #temp = nil
      #File.open(phpfile, "r:utf-8") do |f1|
      #  temp = f1.read.gsub(replace_str, new_str)
      #end

      #File.open(phpfile, "w+") do |f2|
      #  f2.write temp
      #end

    end
  end

end

def check_runl1 ext_func_table, tmp, name
  ext_funcs = ext_func_table[name] || []
  ext_funcs.each do |y|
    next if tmp.include? y
    tmp << y
    check_runl1 ext_func_table, tmp, y
  end
end

def check_php path, tmp, issue
  # =====================  php files =========================
  Dir["#{path}*.php"].each do |file|
    next if file.end_with?'api-web.ajax.php'
    File.open(file, "r:utf-8") do |f|
      func_hash = {}
      func_name = ""
      f.readlines.each do |line|
        next if line.strip.start_with?('<?php', '*', '//', '/*')
        # parse function name
        result = line.scan(/function [A-Z]+[a-zA-Z0-9]+\(/).map{|x| x[9...-1]}
        if result.size == 1
          func_name = result[0]
          func_hash[func_name] = []
        end
        # parse external function name
        result = line.scan(/[A-Z]+[a-zA-Z0-9]+\(/).map{|x| x[0...-1]}
        unless result.empty?
          if func_hash[func_name].nil?
            issue[:call_before_function] << [file,result]
            puts "!"*50
            puts file
            puts result
          else
            func_hash[func_name].concat result
          end
        end
      end
      tmp[file.to_s] = func_hash
    end
  end
  # ===================== folders =========================
  Dir["#{path}*/"].each do |folder|
    check_php folder, tmp, issue
    puts path
  end
end


=begin

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
=end



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
    find_unused_php
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
