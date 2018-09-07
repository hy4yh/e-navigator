module UsersHelper
  def age(birthday)
    # プロフィールで誕生日が設定されてる場合のみ
    if birthday.present?
      date_format = "%Y%m%d"
      (Time.current.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
    end
  end
end
