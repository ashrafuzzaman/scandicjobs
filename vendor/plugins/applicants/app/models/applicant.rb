class Applicant < ActiveRecord::Base

  belongs_to :job_category
  belongs_to :job_sub_category

  acts_as_indexed :fields => [:name, :gender, :phone, :email, :address, :free_time, :language, :about_me]

  validates_presence_of :name
  validates_uniqueness_of :name


end
