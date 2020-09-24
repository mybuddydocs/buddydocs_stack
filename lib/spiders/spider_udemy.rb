require 'kimurai'
require 'pry-byebug'
require 'open-uri'
require 'io/console'

module Spiders
  class SpiderUdemy < Kimurai::Base
      @name = "spider_udemy"
      @engine = :selenium_firefox
      @start_urls = ["https://www.udemy.com/dashboard/purchase-history/"]
      @config = {
        user_agent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36",
        # TODO: remove before prod
        before_request: { delay: 4..5 }
      }
      @@items = []


      def parse (response, url:, data: {})
        # set username and password to connect
        browser.fill_in 'email', with: data[:login]
        browser.fill_in 'password', with: data[:pwd]
        browser.find("//input[@type='submit' and @value='Log In']").click

        loop do
          # Refresh response object with new page
          response = browser.current_response

          # iterate through each receipt on the first page
          response.xpath("//ul[@class='shopping-list']//a[@data-purpose='receipt-link']").each do |receipt|
            linked_url = absolute_url(receipt[:href], base:url)
            request_to :parse_receipt_page, url: linked_url
          end

          if response.xpath("//a[@class='endless_page_link']").last.inner_text == "Next"
            browser.visit(absolute_url(response.xpath("//a[@class='endless_page_link']").last[:href], base:url))
          else
            break
          end
        end
        binding.pry
      end

      def parse_receipt_page (response, url:, data: {})
        item = {}
        hrefs = []

        # download html
        item[:content] = response.xpath("//div[@class='main-content']").inner_html

        # download css url
        response.xpath("//head/link[@type='text/css']").each do |link|
          hrefs << absolute_url(link[:href], base:url)
        end

        item[:css_url] = hrefs

        @@items << item
      end
    end
end
