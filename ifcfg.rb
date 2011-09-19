
require "forwardable"

module SUSEIfcfg

class Ifcfg
    # foo for a file named ifcfg-foo
    attr :ifcfg

    # the file representation, dealing with the syntax
    def backend
        @@backend || raise("Using a backend before specifying one")
    end

    def self.backend=(b)
        @@backend = b
    end

    extend Forwardable
    def_delegators :backend, :startmode, :startmode=, :bootproto, :bootproto=;
    
    # class delegator?!
    def self.read(name)
        @@backend.class.read(name)
    end

    def initialize(name)
        @ifcfg = name
    end

    def save
        backend.save(ifcfg)
    end
end
end #module
