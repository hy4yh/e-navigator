class Interview < ApplicationRecord
  belongs_to :user
  enum approval_status: { reserve: 0, approval: 1, disapproval: 2 }

  validate :datetime_cannot_be_in_the_past

  def datetime_cannot_be_in_the_past
    if interview_datetime.past?
      errors.add(:interview_datetime, "に過去の日付は指定できません。")
    end
  end
end
