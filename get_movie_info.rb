# encoding: utf-8
begin

path = ARGV.first
raise 'no movie title list file found!' if path.nil?
raise 'no file exist!' unless File.exist? path


File.open(path, "r:utf-8") do |f|

  tmp = []
  fail = []
  succ = []
  puts "read file"
  f.readlines.each do |line|
    next if line.strip.size == 0
    tmp << line.gsub('.', ' ')    
  end
  puts "html file output"
  puts output.size
  output.reverse!

  html1 = <<XXY
    <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>watch list</title>
    <meta name="description" content="The Movie" />
    <meta name="keywords" content="movie" />
    <meta name="author" content="Codrops" />
    <link rel="shortcut icon" href="../favicon.ico"> 
    <link rel="stylesheet" type="text/css" href="css/default.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <script src="js/modernizr.custom.js"></script>
  </head>
  <body>
    <div class="container"> 
      
      <header class="clearfix">
        <!-- <h1>The Movie<span>watch list</span></h1>   -->
        <h1>The Movie</h1>  
        <h2>watch list</h2>
      </header>
      <div class="main">
        <ul id="og-grid" class="og-grid">
XXY
html2 = <<YXX
    </ul>
      </div>
    </div><!-- /container -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="js/grid.js"></script>
    <script>
      $(function() {
        Grid.init();
      });
    </script>
  </body>
</html>
YXX
  final = []
  final << html1
  final.concat output
  final << html2
  final.each {|x| puts x}
    puts "save to index.html"
  # File.open("#{path}.txt", 'w+') {|f| f.write output.join("\n")}
  File.open("#{File.dirname(path)}/index.html", 'w+') {|f| f.write final.join("\n")}

end

rescue => e
  puts e.to_s
end
