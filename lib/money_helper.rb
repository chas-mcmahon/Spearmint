module MoneyHelper
  def convert_cents(cents)
    cents.to_f / 100.0
  end
end