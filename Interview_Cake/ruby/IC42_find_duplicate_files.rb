# You left your computer unlocked and your friend decided to troll you by copying a lot of your files to random spots all over your file system.
# Even worse, she saved the duplicate files with random, embarrassing names ("this_is_like_a_digital_wedgie.txt" was clever, I'll give her that).
#
# Write a function that returns an array of all the duplicate files. We'll check them by hand before actually deleting them, since programmatically deleting files is really scary. To help us confirm that two files are actually duplicates, return an array of arrays ↴ where:
#
# the first item is the duplicate file
# the second item is the original file
# For example:
#
#   [['/tmp/parker_is_dumb.mpg', '/home/parker/secret_puppy_dance.mpg'],
#  ['/home/trololol.mov', '/etc/apache2/httpd.conf']]
# You can assume each file was only duplicated once.


def find_duplicate_files(root_directory, files)
  file_hash = Hash.new(0)
  duplicates = []

  files.each do |file|
    if file_hash[file] != 0
      #check which one is older
      if file_hash[file].date_created < file.date_created
        duplicates.push(file)
      else
        duplicates.push(file_hash[file])
      end
    else
      file_hash[file] = 1
    end
  end

  duplicates

end
