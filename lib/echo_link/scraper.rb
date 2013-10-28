require 'curb'
require 'nokogiri'

module EchoLink
  class Scraper


    def links
      links = []

      first_page_url = "#{EchoLink::URLS[:all_links]}&offset=0"
      html = html(first_page_url)
      links += links_from_table(html.css('table')[5])

      p = html.css('table').first.css('tr')[1].css('td').first.css('p').first
      total_links = p.css('b')[2].text.to_i
      per_page = 100
      page_count = (total_links / per_page.to_f).ceil

      (2..page_count).each do |num|
        offset = per_page * (num - 1)
        page_url = "#{EchoLink::URLS[:all_links]}&offset=#{offset}"

        html = html(page_url)
        links += links_from_table(html.css('table')[5])
      end
      links
    end

    def links_from_table(table)
      links = []
      table.css('tr').each_with_index do |tr, i|
        next if i == 0
        tds = tr.css('td')
        links << {
          id: tds[2].text.to_i,
          call_sign: tds[0].text.gsub(/[\r\n]+/,//),
          location: tds[3].text,
          grid: tds[4].text,
          frequency: tds[5].text,
          tone_squelch: tds[6].text,
          power: tds[7].text,
          haat: tds[8].text,
          antenna: tds[9].text,
          status: clean_status(tds[10].text),
          comment: tds[11].text,
          status_updated_at: tds[12].text
        }
      end
      links
    end

    private

      def clean_status(status)
        case status.downcase
        when 'off' then 'offline'
        when 'conn' then 'connected'
        when 'online' then 'online'
        else
          'unknown'
        end
      end

      def curl(url)
        http = Curl.get(url) do |http|
          http.headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36'
        end
      end

      def html(url)
        http = curl(url)
        html = Nokogiri::HTML(http.body_str)
      end

  end
end
