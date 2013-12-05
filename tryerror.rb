def br idx=0
  p '- '*10+idx.to_s
end

begin
  class Test1
    @@haha = 1
    def self.haha
      @@haha
    end
  end
  br 1
  p Test1.haha

  class Test2
    class << self
      attr_accessor :haha
      haha = 9
      @haha ||= 10
      @@haha ||= 11
    end
  end
  br 2
  p Test2.haha

  class Test3
    class << self
      attr_accessor :haha
      def generate
        haha = 9
        @haha ||= 10
        @@haha ||= 11
      end
    end
  end
  br 3
  Test3.generate
  p Test3.haha

  class Test4
    attr_accessor :haha
    def generate
      haha = 9
      @haha ||= 10
    end

    @@cc1 = 1
    @@cc2 = 2
    def generate1
      @haha = @@cc1
    end

    def generate2
      @haha = self.cc2
    end

  end
  br 4
  t = Test4.new
  t.generate
  p t.haha
  t.generate1
  p t.haha
  #t.generate2 -> in `generate2': undefined method `cc2' for #<Test4:0x96519a0 @haha=1> (NoMethodError)
  #p t.haha

  class Test5
    attr_accessor :xyz
    def gen
      5
    end

    def haha
      p gen
      p xyz
      xyz = 9
      p xyz
    end
  end
  br 5
  t = Test5.new
  t.haha

  class Test6
    a = 1
    b = 2
    @@c = 3
    @d = 4
    ERR_ARY = [2]
    def isinstm
      'yy'
    end
    def haha
      #p a  -> #<NameError: undefined local variable or method `a' for #<Test6:0x839b6bc>>
      a = 10
      p a
      p @@c
      p ERR_ARY
      #p isclassm -> #<NameError: undefined local variable or method `isclassm' for #<Test6:0x973ad44>>
      p Test6.isclassm
      #p d -> #<NameError: undefined local variable or method `d' for #<Test6:0x9466c58>>
      #p self.d -> #<NoMethodError: undefined method `d' for #<Test6:0x8206c84>>
      p @d # not 4 because instance is not created
      p isinstm
      p self.isinstm
    end
    def self.isclassm
      'yes'
    end
    def self.hahaha
      #p b -> #<NameError: undefined local variable or method `b' for Test6:Class>
      b = 20
      p b
      p @@c
      p ERR_ARY
      p isclassm
    end
    p '!!!!!'
    p 'call hahaha'
    hahaha
    p 'call self.hahaha'
    self.hahaha
  end
  br 6
  t = Test6.new
  t.haha
  Test6.hahaha
  p Test6::ERR_ARY
  Test6::ERR_ARY << 9
  p Test6::ERR_ARY
  #p Test6::c -> #<NoMethodError: undefined method `c' for Test6:Class>
rescue => e 
  p e
end
br 'end'