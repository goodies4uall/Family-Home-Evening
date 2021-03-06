class Lesson < ActiveRecord::Base
	attr_accessible :title, :content, :private #define what is editable through web

	# An association creates methods like lesson.user, user.lessons, user.lessons.create(), etc.
	belongs_to :user 

	# Validation
	validates :title,   :presence => true, 
                       :length => { :maximum => 100 },
                       :uniqueness => { :scope => :user_id } , :if => :private?

	validates :content, :presence => { :message => "cannot be empty." }
  	validates :user_id, :presence => true



	default_scope :order => 'lessons.created_at DESC' #order lessons newest first
end
