require 'rexml/document'

forecast = <<DATA
<current>
  <city id="654706" name="Kallio">
    <coord lon="24.95" lat="60.18"/>
    <country>FI</country>
    <sun rise="2015-10-29T05:35:15" set="2015-10-29T14:31:31"/>
  </city>
  <temperature value="280.529" min="280.529" max="280.529" unit="kelvin"/>
  <humidity value="100" unit="%"/>
  <pressure value="1038.01" unit="hPa"/>
  <wind>
    <speed value="6.52" name="Moderate breeze"/>
    <gusts/>
    <direction value="224.003" code="SW" name="Southwest"/>
    <weather number="123" value="overcast clouds 2" icon="04d"/>
  </wind>
  <clouds value="92" name="overcast clouds"/>
  <visibility/>
  <precipitation mode="no"/>
  <weather number="804" value="overcast clouds" icon="04d"/>
  <lastupdate value="2015-10-29T09:40:23"/>
</current>
DATA

document = REXML::Document.new(forecast)

document.elements.each('//weather[@number=804]') do |element|
  puts element.attributes['value']
end

# <city id="654706" name="Kallio">
#   <coord lon="24.95" lat="60.18"/>
#   <country>FI</country>
#   <sun rise="2015-10-29T05:35:15" set="2015-10-29T14:31:31"/>
# </city>

my_xml = REXML::Document.new

city = my_xml.add_element('city', 'id' => '654706', 'name' => 'Kallio')
city.add_element('coord', 'lon' => 24.95, 'lat' => '60.18')
city.add_element('country')
city.add_element('sun')

puts my_xml
