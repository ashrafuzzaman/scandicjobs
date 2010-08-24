class Employer < ActiveRecord::Base

  belongs_to :job_category
  belongs_to :job_sub_category

  acts_as_indexed :fields => [:name, :phone, :email, :address, :working_period, :about_job]

  validates_presence_of :name
  validates_uniqueness_of :name



end
