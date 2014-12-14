require 'digest/md5'

def get_hash(name)
	readsize = 64 * 1024
	File.open(name, 'rb') do |f|
		size = File.size?(name)
		data = f.read(readsize)
		f.seek(-readsize, IO::SEEK_END)
		data += f.read(readsize)
		return Digest::MD5.hexdigest(data)
  end
end


def subs_downloader(filename)
	vid_extensions = [".avi",".mp4",".mkv",".mpg",".mpeg",".mov",".rm",".vob",".wmv",".flv",".3gp"]
  begin
		orignal_filename = filename
		vid_extensions.each do |vix|
			filename = filename.gsub(vix , "")
		end

		if orignal_filename == filename
			return
		end

		puts "hello kitty"	

	rescue Exception => e
	
  end	

end

subs_downloader("abc.avi")

