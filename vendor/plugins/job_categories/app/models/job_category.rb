class JobCategory < ActiveRecord::Base

  has_many :applicants
  has_many :employers
  has_many :job_sub_categories

  acts_as_indexed :fields => [:title, :description]

  validates_presence_of :title
  validates_uniqueness_of :title



end
