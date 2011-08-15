
require "forwardable"

module SUSEIfcfg

class Ifcfg
    # foo for a file named ifcfg-foo
    attr :ifcfg

    # the file representation, dealing with the syntax
    attr_accessor :backend

    extend Forwardable
    def_delegators :@backend, :startmode, :startmode=, :bootproto, :bootproto=

    def initialize(name)
        @ifcfg = name
    end

    def save
        backend.save(ifcfg)
    end
end
end #module
