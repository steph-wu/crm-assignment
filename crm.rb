require_relative 'contact'

class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts "\nEnter a number: "
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_menu
    when 3 then delete_content
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def update(attribute, new_value)
    @@contacts.find { |contact| contact if contact.send("#{attribute}=", new_value) }
  end

  def modify_menu

    puts '[1] Modify first name'
    puts '[2] Modify last name'
    puts '[3] Modify email'
    puts '[4] Modify note'
    puts '[5] Exit to main menu'

    modify_existing_contact

end

  def modify_existing_contact

    # modify_selection = gets.chomp
    #
    # case modify_selection
    # when "1"
    #   puts "Enter new value: "
    #   contact.first_name = gets.chomp
    # when "2"
    #   puts "Enter new value: "
    #   contact.last_name = gets.chomp
    # when "3"
    #   puts "Enter new value: "
    #   contact.email = gets.chomp
    # when "4"
    #   puts "Enter new value: "
    #   contact.note = gets.chomp
    # end

  end

  def delete_contact

  end

  def display_all_contacts

  end

  def search_by_attribute

    search_results = []

    puts "\nSearch for field: "
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] ID"
    puts "[5] Main Menu"
    puts "\nEnter a number: "
    attribute = gets.chomp.to_i

    case attribute
    when 1
      attribute = "first_name"
    when 2
      attribute = "last_name"
    when 3
      attribute = "email"
    when 4
      attribute = "id"
    when 5
      print_main_menu
    end

    puts "\nEnter value: "
    value = gets.chomp

    Contact.all.each { |contact| search_results << contact if contact.send("#{attribute}") == value }

    puts "\nSEARCH RESULTS"

    search_results.each do |contact|
      puts "ID: #{contact.id}"
      puts "First Name: #{contact.first_name}"
      puts "Last Name: #{contact.last_name}"
      puts "Email: #{contact.email}"
      puts "Note: #{contact.note}"
      puts "\n"
    end

  end


end

################################################

a_crm_app = CRM.new
a_crm_app.main_menu

a_crm_app.print_main_menu
