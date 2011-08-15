require "fileutils"
include FileUtils

def assert_files_equal(expected_filename, actual_filename)
    difference = `diff -u #{expected_filename} #{actual_filename} 2>&1`
    if difference != ""
        raise "Files should be the same. They differ:\n" + difference
    end
end
