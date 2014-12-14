require 'digest/md5'
require 'net/http'

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
		original_filename = filename
		vid_extensions.each do |vix|
			filename = filename.gsub(vix , "")
		end

		if original_filename == filename
			return
		end

	  hash = get_hash(original_filename)	

	  if (File.exist?(filename + ".srt") == false) 
	    header = { 'User-Agent' => 'SubDB/1.0 (Subtitle-Downloader /1.0; https://github.com/gautamsawhney/Subtitle-Downloader)' }
	  	# url = "http://sandbox.thesubdb.com/?action=download&hash=" + hash + "&language=en"
	  	http = Net::HTTP.new "sandbox.thesubdb.com"
      res = http.send_request("GET", "/?action=download&hash=" + hash + "&language=en", nil, header)
	  	# res = http.send_request('GET', url, header)
      File.open(filename + ".srt", "wb" ) do |f| 
      	f.write(res.body)
      end	 
	  end
	
	rescue Exception => e
	
  end	

end

subs_downloader("Django.Unchained.2012.1080p.BluRay.x264.YIFY.mp4")

