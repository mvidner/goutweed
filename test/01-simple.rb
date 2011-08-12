
#require "test_helpers.rb"
expected_dir = "01-simple.out"
actual_dir = "01-simple.out.tmp"
DirtyIfcfgBackend.base_dir = actual_dir
FileUtils.mkdir actual_dir

INAME = "eth0"
simple = SUSEIfcfg::Ifcfg.new(INAME)
simple.startmode = :auto
simple.bootproto = :dhcp
simple.save

assert_files_equal(expected_dir + "/ifcfg-" + INAME,
                   actual_dir   + "/ifcfg-" + INAME)

# or assert_dirs_equal expected_dir, actual_dir
