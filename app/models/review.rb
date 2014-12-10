class Review < ActiveRecord::Base
  
  def self.columns
    @columns ||= [];
  end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default,
      sql_type.to_s, null)
  end

  # Override the save method to prevent exceptions.
  def save(validate = true)
    validate ? valid? : true
  end

  column :venue, :string
  column :stars, :string

  DATA=YAML.load_file('config/data.yml')

  #RATE = ["totally", "pretty", "almost", "not very", "totally not"]

  def text
      description + " " + describe_object(0) + " " + describe_object(1)  + " " + recommendation
  end

  def description
    "It was #{DATA['rate'].sample} #{DATA['star'][stars.to_i].sample}!"
  end

  def recommendation
    "#{DATA['recommendations'][stars.to_i].sample}"
  end

  def describe_object(obj)
    "#{DATA[venue][obj]['title'].sample} " +
    "#{DATA[venue][obj]['verb'].sample} #{DATA[venue][obj]['grades'][stars.to_i].sample}."
  end

end
