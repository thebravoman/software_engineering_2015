require 'rubygems'
require 'json'
require 'pp'

json = File.read('B_12_Emiliqn_Gospodinov.json')
obj = JSON.parse(json)

pp obj
