require "test/unit"
require "test_helper"

require "dirty_backend"
require "ifcfg"

class ReadTest < Test::Unit::TestCase
    def base_dir
        File.dirname(__FILE__) + "/" + File.basename(__FILE__, "_test.rb")
    end

    def input_dir
        base_dir + ".in"
    end

    def expected_dir
        base_dir + ".out"
    end

    def actual_dir
        expected_dir + ".tmp"
    end

    def setup
        DirtyIfcfgBackend.base_dir = input_dir
    end

    def teardown
    end

    def test_read
        iname = "eth0"
        SUSEIfcfg::Ifcfg.backend = DirtyIfcfgBackend.new # clumsy
        simple = SUSEIfcfg::Ifcfg.read(iname)

        assert_equal "manual", simple.startmode
        assert_equal "static", simple.bootproto
    end
end
# or assert_dirs_equal expected_dir, actual_dir
