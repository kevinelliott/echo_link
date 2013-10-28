require 'echo_link/scraper'
require 'echo_link/version'

module EchoLink
  BASE_URL = 'http://www.echolink.org'
  URLS = {
    logins: "#{BASE_URL}/logins.jsp",
    all_links: "#{BASE_URL}/links.jsp?title=&d=1&sel=all&lat_fix=&lon_fix=&lat_deg=&lat_min=&lat_NS=&lon_deg=&lon_min=&lon_EW=&gs=",
    active_links: "#{BASE_URL}/links.jsp?title=&d=2&sel=all&lat_fix=&lon_fix=&lat_deg=&lat_min=&lat_NS=&lon_deg=&lon_min=&lon_EW=&gs="
  }
end
