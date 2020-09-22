require 'kimurai'
require 'pry-byebug'
require 'open-uri'
require 'io/console'

class SpiderImpots < Kimurai::Base
  @name = "spider_impots"
  @engine = :selenium_firefox
  @start_urls = ["https://cfspart.impots.gouv.fr/LoginAccess?op=c&url=aHR0cHM6Ly9jZnNwYXJ0LmltcG90cy5nb3V2LmZyL21vbnByb2ZpbC13ZWJhcHAvbW9uQ29tcHRl"]
  @config = {
    user_agent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36",
    # TODO: remove before prod
    before_request: { delay: 4..6 }
  }

  def parse (response, url:, data: {})
    puts "please fill in your id"
    # id = gets.chomp
    id = 3005225886138
    browser.fill_in 'spi_tmp', with: id
    browser.find("//button[@id='btnAction']").click
    puts "please fill in your pwd"
    pwd = STDIN.noecho(&:gets).chomp
    browser.fill_in 'pwd_tmp', with: pwd
    browser.find("//button[@id='btnAction']").click
    document_page = browser.find("//a[@id='documents']")
    request_to :parse_document, url: document_page[:href]

  end

  def parse_document (response, url:, data: {})
    idEnsua = response.xpath("//input[@name='idEnsua']").first[:value]
    url_target = "https://cfspart.impots.gouv.fr/enp/ensu/Affichage_Document_PDF?idEnsua=#{idEnsua}"
    request_to :parse_document_page, url: url_target
  end

  def parse_document_page (response, url:, data: {})
    item = {}
    binding.pry

  end

end


SpiderImpots.crawl!
