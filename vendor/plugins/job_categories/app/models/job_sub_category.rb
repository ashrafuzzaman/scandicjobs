class JobSubCategory < ActiveRecord::Base

  has_many :applicants
  has_many :employers
  belongs_to :job_category

  acts_as_indexed :fields => [:title, :description]

  validates_presence_of :title
  validates_uniqueness_of :title



end
