#peggy_coding_backup.rb

def err msg
  puts "\033[41;37m[#{Time.now()}]\033[0m #{msg} >_< ! Call for help"
end

def dbg msg
  puts "\033[44;37m[#{Time.now()}]\033[0m #{msg}"
end

dbg 'Hello~ I am peggy_coding_backup script.'
res = Dir["/Volumes/*/"].select{ |f| File.directory?("#{f}/peggy_coding_backup")}
sleep_time = 10

case res.size
when 0
  err 'I can not find backup folder'
when 1
  backup_path = "#{res[0]}/peggy_coding_backup"
  dbg "backup folder found! -> #{backup_path}"
  code_path = "/Users/yolux/Ramdisk/abc"

  unless File.directory? code_path
    err "I can not find your code -> #{code_path}"
  else
    while truee
      cmd = "tar czvPf '#{backup_path}/#{Time.now().to_s.gsub('-','').gsub(/[: ]/, '_')[0..-7]}.tar.gz' '#{code_path}'"
      dbg "start to backup your code, cmd = #{cmd}"
      system(cmd)
      dbg "finish!"
      sleep sleep_time
    end
  end

when 2 .. 99
  err 'too many backup folders'
else
  err 'unknown error'
end