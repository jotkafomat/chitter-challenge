require_relative './database_connection'

class Maker


  def self.create(email:, password:, name:)
    result = DatabaseConnection.query("INSERT INTO makers (email, password, name) VALUES('#{email}', '#{password}', '#{name}') RETURNING id, email, name;")

    Maker.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name']
    )
  end

  def self.find(id:)

    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM makers WHERE id = #{id}")
    Maker.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name']
    )
  end

  attr_reader :id, :email, :name

  def initialize(id:, email:, name:)
    @id = id
    @email = email
    @name = name
  end
end