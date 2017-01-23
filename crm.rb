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
    when 2 then modify_existing_contact
    when 3 then delete_contact
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

# Displays results of contact found by ID

  def contact_found
    Contact.all.each do |contact|
      if contact.id == @find_by_id.to_i
        puts "\nID: #{contact.id}"
        puts "First Name: #{contact.first_name}"
        puts "Last Name: #{contact.last_name}"
        puts "Email: #{contact.email}"
        puts "Note: #{contact.note}"
      end
    end
  end

# Selects targeted attribute

def target_attr
  case @search_attr
  when 1
    @search_attr = "first_name"
  when 2
    @search_attr = "last_name"
  when 3
    @search_attr = "email"
  when 4
    @search_attr = "note"
  when 5
    print_main_menu
  end
end

  def modify_existing_contact

    puts "\nEnter contact ID or type search: "
    @find_by_id = gets.chomp

    if @find_by_id.upcase == "SEARCH"
      search_by_attribute
      puts "Enter ID number: "
      @find_by_id = gets.chomp
    end

    contact_found # Display contact selected

    puts "\n"
    puts '[1] Modify first name'
    puts '[2] Modify last name'
    puts '[3] Modify email'
    puts '[4] Modify note'
    puts "[5] Exit to main menu\n"
    puts "\nEnter a number: "
    @search_attr = gets.chomp.to_i
    puts "\nEnter new value: "
    new_value = gets.chomp

    target_attr

    Contact.all.each do |contact|
      if contact.id == @find_by_id.to_i
        contact.send("#{@search_attr}=", new_value)
        puts "\n"
        puts "CONTACT UPDATED\n"
        puts "ID: #{contact.id}"
        puts "First Name: #{contact.first_name}"
        puts "Last Name: #{contact.last_name}"
        puts "Email: #{contact.email}"
        puts "Note: #{contact.note}"
        puts "\n"
      end
    end

  end

  def delete_contact

    puts "[1] Search for contact"
    puts "[2] Enter contact ID"
    @find_by_id = gets.chomp.to_i

    if find_by_id == 1
      search_by_attribute
      puts "Enter ID number: "
      @find_by_id = gets.chomp.to_i
    end

    contact_found

    Contact.all.each { |contact| contact.delete if contact.id == @find_by_id }

  end

  def display_all_contacts

    puts "\nCONTACT LIST\n\n"

    Contact.all.each do |contact|
      puts "ID: #{contact.id}"
      puts "First Name: #{contact.first_name}"
      puts "Last Name: #{contact.last_name}"
      puts "Email: #{contact.email}"
      puts "Note: #{contact.note}"
      puts "\n"
    end

  end

  def search_by_attribute

    puts "\nSearch: "
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] ID"
    puts "[5] Main Menu"
    puts "\nEnter a number: "
    @search_attr = gets.chomp.to_i

    target_attr

    @search_results = []
    puts "\nEnter value: "
    value = gets.chomp

    Contact.all.each { |contact| @search_results << contact if contact.send("#{@search_attr}") == value }

    search_display

  end

  def search_display
    puts "\nSEARCH RESULTS\n\n"
    @search_results.each do |contact|
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
