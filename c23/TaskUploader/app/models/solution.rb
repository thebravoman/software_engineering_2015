class Solution < ActiveRecord::Base
	validates :task_id, presence: true 
	validates :code, presence: true
	validates :author, presence: true
end
