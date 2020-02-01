#!/bin/ruby

require 'shell'
require 'mechanize'
require 'rexml/document'
require 'socket'
require 'net/http'
require 'rubygems'
require 'nokogiri'

civv  = "co2069328"
fagai = "co2519396"
#kuro  = "co3589365" 
#kuro2 = "co2519395"
guitar= "co329059"
# btc   = "co2477005"
# ika   = "co3566507"
# nz    = "co2032327"
# mihoro= "co3230998"


url_nicolive_antenna = 'https://secure.nicovideo.jp/secure/login?site=nicolive_antenna'
url_nicoalert_data   = 'http://live.nicovideo.jp/api/getalertstatus'
url_nicoalert_info   = 'http://live.nicovideo.jp/api/getalertinfo'

## Login
print "ニコニコIDのアドレスを入力してください: \n"
nico_id = gets.chomp.strip
print "ニコニコIDのパスワードを入力してください: \n"
nico_pass = gets.chomp.strip

## Get Your Communities
agent = Mechanize.new
agent.user_agent = 'NicoLiveAlert'
ticket     = agent.post( url_nicolive_antenna, 'mail' => "#{nico_id}",'password' => "#{nico_pass}")
xml_ticket = REXML::Document.new ticket.body 
get_ticket = xml_ticket.elements['nicovideo_user_response/ticket'].text
data       = agent.get(url_nicoalert_data, 'ticket' => "#{get_ticket}")
xml_data   = REXML::Document.new data.body
community    = xml_data.elements['getalertstatus/communities']
community_id = community.map(&:text)
community_id = community_id << fagai
print "#{community_id}\n\n\n"
print "+++++++++++++++++++++++++++++++++++++++++++\n"

## Connect Alerts Server 
response = Net::HTTP.get(URI(url_nicoalert_info))
xml = Nokogiri(response)
address = ( xml/'addr' ).inner_text()
port    = ( xml/'port' ).inner_text()
thread  = (xml/'thread').inner_text()

## Recieve Data
TCPSocket.open(address, port.to_i) {|sock|
sock.write("<thread thread=\"#{thread}\" version=\"20061206\" res_from=\"-1\"/>\0")
while true
    stream = sock.gets("\0")
    next if stream =~ /^<thread/
    live_id, commu_id, owner_id = stream.match(/<chat[^>]+>(.*)<\/chat>/)[1].split(',')
    # system("nicoment lv#{live_id} わこつです")
    community_id.each do |n|
        if n == commu_id
            if      n == guitar
            elsif   n == civv
            else
                ; # say Hello
                ; # system("$HOME/mybin/nicoment lv#{live_id} わこつ &")
            end

            # open Page
            system("chromium http://live.nicovideo.jp/watch/lv#{live_id} &")
            system("espeak 'niconico-live started.' ")
            
            # print Info
            response = Net::HTTP.get(URI("http://live.nicovideo.jp/api/getstreaminfo/lv#{live_id}"))
            xml  = Nokogiri(response)
            title = (xml/'streaminfo/title').inner_text()
            description = (xml/'streaminfo/description').inner_text()
            print "----------------------------------------------------\n"
            print "#{owner_id}'s #{title} live started. \n #{description}\n"
            print "the live identity is #{live_id}\n"
            print "----------------------------------------------------\n"
        end
    end
    print "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
    print " ..... loading ..... live #{live_id}"
end
}

# system("echo -e \"\033[30m..... loading ..... live \033[36m #{live_id}\"")
# print "#{commu_id} http://live.nicovideo.jp/watch/lv#{live_id}"
## pikachu = "y\\)速度\\(30\\)音程\\(160\\)piかぁ\\\'ちゅう\\ \\(\\๑\\◕\\ܫ\\◕\\๑\\)" 
## ebifurai = "エビフライどうぞ\\(\\^\\\ \\^\\)_\\\ \∑\=\\:\\;\\\"\\,\\\',\\\"\\,\\,\\\"\\,\\\'\\,\\,\\\"\\,\\,\\'\\'\\;\\:\\i"
