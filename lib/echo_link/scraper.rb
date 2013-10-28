require 'curb'
require 'nokogiri'

module EchoLink
  class Scraper

    def reflectors
      reflectors = []

      html = html(Irlp::URLS[:reflectors])
      html.css('table tr').each_with_index do |reflector, i|
        next if i < 6
        cols = reflector.css('td')
        reflectors << {
          id: cols[0].text.to_i,
          name: cols[1].text.split.join(' ')
        }
      end

      reflectors.each { |r| puts "#{r[:id]}: #{r[:name]}"}
      reflectors
    end

    def nodes
      nodes = []

      html = html(Irlp::URLS[:nodes])
      html.css('table tr').each_with_index do |reflector, i|
        next if i < 1
        cols = reflector.css('td')
        nodes << {
          id: cols[0].text.to_i,
          call_sign: cols[1].text,
          city: cols[2].text,
          province: cols[3].text,
          country: cols[4].text,
          frequency: cols[5].text,
          status: cols[7].text.downcase,
          status_duration: cols[8].text,
          status_link: "#{Irlp::BASE_URL}/index.php?PSTART=11&nodeid=#{cols[0].text}"
        }
      end

      nodes.each { |r| puts "#{r[:id]}: #{r[:call_sign]}"}
      nodes
    end

    def node_status(id)
      node = {}
      
      node_status_url = "#{Irlp::URLS[:node_detail]}&nodeid=#{id}"
      html = html(node_status_url)
      html.css('table tr').each_with_index do |row, i|
        data = row.css('td')[1]
        case i
        when 0
          node[:id] = data.text.to_i
        when 1
          node[:call_sign] = data.text
        when 2
          node[:city] = data.text
        when 3
          node[:province] = data.text
        when 4
          node[:country] = data.text
        when 5
          node[:owner] = data.text
        when 6
          node[:latitude] = data.text
        when 7
          node[:longitude] = data.text
        when 8
          node[:frequency] = data.text
        when 9
          node[:offset] = data.text
        when 10
          node[:tone_squelch] = data.text
        when 11
          node[:avrs_status] = data.text
        when 12
          node[:website] = data.css('a')[0].attr(:href).text if data.css('a').size > 0
        end
      end
      
      node
    end

    private

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
