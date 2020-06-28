PersonalAccount = Struct.new(
    :first_name,
    :last_name,
    :email)

CorporateAccount = Struct.new(
    :company_name,
    :email,
    :tax_id)

TrialAccount = Struct.new(:email)

require 'csv'

class PersonalAccount
  def to_csv
    CSV.generate { |csv|
      [:first_name, :last_name, :email].each do |name|
        csv << [name, self[name]]
      end
    }
  end

  def to_summary
    "#{first_name} #{last_name} <#{email}>"
  end

  def to_html
    <<"END"
<div class="account vcard">
  <p>
    Account details for:
    <span class="email">#{email}</span>
  </p>
  <p class="fn">#{first_name} #{last_name}</p>
</div>
END
  end
end


pa = PersonalAccount.new("Tom", "Servo", "tservo@example.org")
# puts "CSV:"
# puts pa.to_csv
#
# puts "\nSummary:"
# puts pa.to_summary
#
# puts "\nHTML:"
# puts pa.to_html
#
require 'erb'


class HtmlPersonalAccountView
  TEMPLATE = ERB.new(<<END)
<div class="account vcard">
  <p>
    Account details for:
    <span class="email"><%= email %></span>
  </p>
  <p class="fn"><%= first_name %><%= last_name %></p>
</div>
END

  def render(account)
    account.instance_eval do
      TEMPLATE.run(binding)
    end
  end

end

puts HtmlPersonalAccountView.new.render(pa)