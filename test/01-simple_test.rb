require "test/unit"
require "test_helper"

require "dirty_backend"
require "ifcfg"

class SimpleTest < Test::Unit::TestCase
    def expected_dir
        File.dirname(__FILE__) + "/01-simple.out"
    end

    def actual_dir
        expected_dir + ".tmp"
    end

    def setup
        DirtyIfcfgBackend.base_dir = actual_dir
        mkdir actual_dir
    end

    def teardown
        rm_r actual_dir
    end

    def test_simple
        iname = "eth0"
        simple = SUSEIfcfg::Ifcfg.new(iname)
        simple.class.backend = DirtyIfcfgBackend.new # clumsy
        simple.startmode = :auto
        simple.bootproto = :dhcp
        simple.save

        assert_files_equal(expected_dir + "/ifcfg-" + iname,
                           actual_dir   + "/ifcfg-" + iname)
    end
end
# or assert_dirs_equal expected_dir, actual_dir
