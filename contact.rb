class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@next_id = 1000

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note = "n/a")
    @id = @@next_id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    # 1. Initialize a new Contact with a unique ID
    new_contact = self.new(first_name, last_name, email, note)
    # 2. Add the new Contact to the list of all contacts
    @@contacts << new_contact
    # 3. Increment the next unique ID
    @@next_id += 1
    # 4. Return new object
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      return contact if contact.next_id == id
    end

  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by

  end

  # This method should delete all of the contacts
  def self.delete_all

  end

  def full_name
    "#{firstname} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.

end

##########################

steph = Contact.new("Stephanie", "Wu", "wu.stephanie@live.com")
lynna = Contact.new("Lynna", "Nguyen", "baekbitch@live.com")
julie = Contact.new("Julie", "Duong", "mmgoldfish@live.com")

puts steph.first_name
puts Contact.find(1)
