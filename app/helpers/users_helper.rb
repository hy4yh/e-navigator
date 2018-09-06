module UsersHelper
  def age(birthday)
    date_format = "%Y%m%d"
    (Time.current.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end
end
