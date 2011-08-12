
module SUSEIfcfg

class Ifcfg
  # foo for a file named ifcfg-foo
  attr :ifcfg

  # the file representation, dealing with the syntax
  attr :backend


  # TODO, a declaration to forward foo and foo= to backend
  attr :startmode
  attr :bootproto

  def initialize

  end

  def save
    backend.save
  end
end
end #module
