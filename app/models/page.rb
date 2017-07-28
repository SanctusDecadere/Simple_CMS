class Page < ApplicationRecord

	acts_as_list :scope => :subjects

	belongs_to :subject, { :optional => false } #I think this option determines whether or not a validation for the association is added. 
	has_many :sections #seems to have disappeared in the many to many associations video. not sure when that happened. 
	has_and_belongs_to_many :admin_users


	scope :visible, lambda {where(:visible => true)}
	scope :invisible, lambda { where(:visible => false)}
	scope :sorted, lambda { order("position ASC")}
	scope :newest_first, lambda { order("created_at DESC")}
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}




	# "long form" validations
	#validates_presence_of :name
	#validates_length_of :name, :maximum => 255
	#validates_presence_of :permalink
	#validates_length_of :permalink, :within => 3..255
	#validates_uniqueness_of :permalink


	# "sexy" validations

	validates :name, :presence => true,
					   :length => { :maximum => 255}


	validates 	:permalink, :presence => true,
						    :length => { :within => 3..255},
						    :uniqueness => true






	
end
