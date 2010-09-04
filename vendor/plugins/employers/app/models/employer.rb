class Employer < ActiveRecord::Base

  belongs_to :job_category
  belongs_to :job_sub_category

  acts_as_indexed :fields => [:first_name, :last_name, :phone, :email, :address, :working_period, :about_job]

  validates_presence_of :first_name
  validates_uniqueness_of :first_name

  def name
    "#{first_name} #{last_name}"
  end

end
