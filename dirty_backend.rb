class DirtyIfcfgBackend
  # a hash like { "STARTMODE" => "auto", "BOOTPROTO" => "dhcp" }
  attr :data
  attr :filename
  def self.from_file(filename)
  end

  def initialize
      @data = Hash.new
  end

  @@base_dir = "/etc/sysconfig/network"

  def self.base_dir=(dirname)
      @@base_dir = dirname
  end

  def save(ifcfg)
      File.open "#{@@base_dir}/ifcfg-#{ifcfg}", "w" do |f|

          data.keys.sort.each do |k|
              f.puts "#{k}=#{data[k]}"
          end
      end
  end

  def self.read(ifcfg)
      instance = new
      File.open "#{@@base_dir}/ifcfg-#{ifcfg}", "r" do |f|
          f.each_line do |l|
              l.chomp!
              key, value = l.split("=")
              instance.data[key] = value
          end
      end
      instance
  end

  # a.foo
  #   returns data["FOO"]
  # a.bar_baz = qux
  #   returns data["BAR_BAZ"] = qux
  #   where qux is a "string" or a :symbol
  def method_missing(name, *args)
      if name.to_s =~ /=$/
          key = name.to_s.chop.upcase
          value = args[0].to_s
          @data[key] = value
      elsif args.empty?
          key = name.to_s.upcase
          @data[key]
      else
          super(name, *args)
      end
  end

end
