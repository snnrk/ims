class Issue < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 20 }
  validates :fired_time, presence: true
  validate :valid_fired_and_recovered_time
  validate :valid_start_and_ending_time
  validates :impact, length: { maximum: 20 }
  validates :author_id, presence: true
  belongs_to :author, class_name: "User"
  
  private
  
  def valid_fired_and_recovered_time
    valid_datetime(fired_time, recovered_time) if recovered_time.present?
  end
  def valid_start_and_ending_time
    valid_datetime(start_time, ending_time) if (start_time.present? and ending_time.present?)
  end
  
  def valid_datetime(preceded, succeeded)
    if preceded > succeeded
      errors.add(:date, I18n.t(:preceded_datetime_shoud_be_preceded))
    end
  end
end