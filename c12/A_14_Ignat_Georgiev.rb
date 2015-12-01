require 'json'

content = File.read("A_14_Ignat_Georgiev.json")

parsed = JSON.parse(content)

p parsed	  