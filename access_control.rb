module AccessControl
  
  extend self
  
  def configure(&block)
    instance_eval(&block)
  end
  
  def definitions
    @definitions ||= {}
  end
  
  def role(level, options={})
    definitions[level] = Role.new(level, options)
  end
  
  def roles_with_permission(permission)
    definitions.select { |k,v| v.allows?(permission)}.map {|k,_| k }
  end
  
  def [](level)
    definitions[level]
  end
end

puts AccessControl.configure { "I am #{self.inspect}"}
puts "variables #{AccessControl.instance_variables}"