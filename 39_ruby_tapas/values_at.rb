

sums = { sub_gross: 0.00, sub_fee: 1.23, pay_gross: 4.56, pay_fee: 3.21 }

if sums[:sub_gross] > 0 || sums[:sub_fee] > 0
  printf "Gross: $%0.2f; Fees: $%0.2f\n", sums[:sub_gross], sums[:sub_fee]
end
#2.7.1 :063 > end
# Gross: $0.00; Fees: $1.23
#  => nil
#
sums = { sub_gross: 0.00, sub_fee: 1.23 }
sums.values_at(:sub_gross, :sub_fee)
# => [0.0, 1.23]
#
sums = { sub_gross: 0.00, sub_fee: 1.23 }
sums.values_at(:sub_gross, :sub_fee).reduce(false){|a, v| a || v > 0}


sums.values_at(:sub_gross, :sub_fee).reduce(false){|a, v| a || v > 0}

sums.values_at(:sub_gross, :sub_fee).any?(&:nonzero?)

if sums.values_at(:sub_gross, :sub_fee).any?(&:nonzero?)
  printf "Gross: $%0.2f; Fees: $%0.2f\n", sums[:sub_gross], sums[:sub_fee]
end


if sums.values_at(:sub_gross, :sub_fee).any?(&:nonzero?)
  printf "Gross: $%0.2f; Fees: $%0.2f\n", sums[:sub_gross], sums[:sub_fee]
end