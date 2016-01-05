require 'green_shoes'

Shoes.app title: "Kvo stava tuka" do
  	background darkgreen = rgb(56,86,152)
    @button = button("i cri evri tim")
    @button.click(){ask_open_file}
    @button.style width: 200
   	@button.style height: 100 
   	@bytton2 = button("WC")
   	@button.click(){para ask_open_file}
end