require "nokogiri"
require "open-uri"

class AbstractSite
	
	DIC_URL       = "http://ejje.weblio.jp/content"
	def initialize(word)
		@word = word
		get_html
	end

	def get_html
		page = URI.parse("#{DIC_URL}/#{@word.gsub(/ /,"+")}").read
		@document = Nokogiri::HTML(page)
	end

	def get_jp_mean
		raise "Called abstract method: get_jp_mean"
	end

	def get_en_mean
		raise "Called abstract method: get_en_mean"
	end

	def get_pron_file
		raise "Called abstract method: get_pron_file"
	end

	def get_pron_note
		raise "Called abstract method: get_pron_note"
	end

	def get_img
		raise "Called abstract method: get_img"
	end


end


class Weblio < AbstractSite

	DIC_URL       = "http://ejje.weblio.jp/content"
	JP_MEAN_XPATH = "//td[@class='content-explanation ej']"
	


end

weblio = Weblio.new("test")
