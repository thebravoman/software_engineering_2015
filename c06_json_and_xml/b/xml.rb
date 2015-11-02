require 'rexml/document'

forecast = <<DATA
<current>
  <city id="2643743" name="London">
    <coord lon="-0.13" lat="51.51"/>
    <country>GB</country>
    <sun rise="2015-10-29T06:48:34" set="2015-10-29T16:39:04"/>
  </city>
  <temperature value="285.292" min="285.292" max="285.292" unit="kelvin"/>
  <humidity value="94" unit="%"/>
  <pressure value="1010.02" unit="hPa"/>
  <wind>
    <speed value="6.26" name="Moderate breeze"/>
    <gusts/>
    <direction value="168.5" code="SSE" name="South-southeast"/>
    <weather number="324" value="light rain 234" icon="10d"/>
  </wind>
  <clouds value="92" name="overcast clouds"/>
  <visibility/>
  <precipitation value="0.25" mode="rain" unit="3h"/>
  <weather number="500" value="light rain" icon="10d"/>
  <lastupdate value="2015-10-29T07:26:19"/>
</current>
DATA

document = REXML::Document.new(forecast)

document.elements.each('//weather[@number=500]') do |element|
  puts element.attributes['value']
end

#
#  <wind>
#    <speed value="6.26" name="Moderate breeze"/>
#    <gusts/>
#    <direction value="168.5" code="SSE" name="South-southeast"/>
#    <weather number="324" value="light rain 234" icon="10d"/>
#  </wind>
#

my_xml = REXML::Document.new('')
wind = my_xml.add_element('wind')

wind.add_element('speed',{'value' => 6.26, 'name' => 'Moderate breeze'})
wind.add_element('gusts')

puts my_xml
