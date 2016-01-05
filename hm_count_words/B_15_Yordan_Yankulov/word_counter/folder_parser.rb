module WordCounter
  class FolderParser < Parser
    attr_accessor :content

   def initialize
     @content = ''
   end

   def folder_parser folder
     receive_content folder
     parse content
   end

   def receive_content address
     if (File.file?(address))
       @content << (File.read(address))
       return
     end
     if !address.end_with?("/")
       address << "/"
     end
     Dir.glob(address + '*').each do |file|
       receive_content(file)
     end
   end
  end
end
