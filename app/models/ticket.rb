class Ticket < ActiveRecord::Base
  include GuidReferenced
  acts_as_commentable
  belongs_to :project
  has_many :work_units

  validates_presence_of :project_id
  validates_presence_of :name

  def client
    project.client
  end

  def to_s
    name
  end
end
