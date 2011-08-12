class DirtyIfcfgBackend
  # a hash like { "STARTMODE" => "auto", "BOOTPROTO" => "dhcp" }
  attr :data
  attr :filename
  def self.from_file(filename)
  end

  def save
  end

  # a.foo
  #   returns data["FOO"]
  # a.bar_baz = qux
  #   returns data["BAR_BAZ"] = qux
  def method_missing(name, *args)
  end

end
